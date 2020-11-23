"""Translate Polar expressions to Odoo domain expressions.
Used in the context of partially evaluated queries."""

from odoo.models import BaseModel
from odoo.osv import expression as domain_expression

from polar import Expression, Variable
from polar.exceptions import UnsupportedError


def make_comparison(op):
    def compare(left, right):
        # Odoo likes to operate on record IDs instead of records.
        if isinstance(right, BaseModel):
            assert len(right) == 1
            right = right.id

        return [(left, op, right)]

    return compare


COMPARISONS = {
    "Unify": make_comparison("="),
    "Eq": make_comparison("="),
    "Neq": make_comparison("!="),
    "Geq": make_comparison(">="),
    "Gt": make_comparison(">"),
    "Leq": make_comparison("<="),
    "Lt": make_comparison("<"),
}


def polar_type_name(name):
    """Translate an Odoo model name to a Polar type specializer name."""
    return name.replace(".", "::")


def partial_to_domain_expr(expr: Expression, model: BaseModel, **kwargs):
    """Translate a Polar expression to an Odoo domain expression."""
    assert isinstance(expr, Expression), "expected a Polar expression"
    assert isinstance(model, BaseModel), "expected a model"

    if expr.operator in COMPARISONS:
        return compare_expr(expr, model, **kwargs)
    elif expr.operator == "And":
        return and_expr(expr, model, **kwargs)
    elif expr.operator == "Isa":
        assert expr.args[1].tag == polar_type_name(model._name)
        return None
    elif expr.operator == "In":
        return in_expr(expr, model, **kwargs)
    else:
        raise UnsupportedError(f"Unsupported expression {expr}")


def and_expr(expr: Expression, model: BaseModel, **kwargs):
    assert expr.operator == "And"
    operands = []
    for arg in expr.args:
        domain_expr = partial_to_domain_expr(arg, model, **kwargs)
        if domain_expr:
            operands.append(domain_expr)
    return domain_expression.AND(operands)


def compare_expr(expr: Expression, _model: BaseModel, path=[], **kwargs):
    (left, right) = expr.args
    left_path = dot_op_path(left)
    if left_path:
        return COMPARISONS[expr.operator](".".join(path + left_path), right)
    else:
        if isinstance(right, BaseModel):
            right = right.id
        else:
            raise UnsupportedError(f"Unsupported comparison: {expr}")
        return COMPARISONS[expr.operator](".".join(path + ["id"]), right)


def in_expr(expr: Expression, model: BaseModel, path=[], **kwargs):
    assert expr.operator == "In"
    (left, right) = expr.args
    right_path = dot_op_path(right)
    assert right_path, "RHS of in must be a dot lookup"
    right_path = path + right_path

    if isinstance(left, Expression):
        if left.operator == "And":
            # Distribute the expression over the "In".
            return and_expr(left, model, path=right_path, **kwargs)
        elif left.operator == "In":
            # Nested in operations.
            return in_expr(left, model, path=right_path, **kwargs)
        elif left.operator in COMPARISONS:
            # `tag in post.tags and tag.created_by = user` where `post` is a
            # partial and `user` is an Odoo record.
            return compare_expr(left, model, path=right_path, **kwargs)
        else:
            assert False, f"Unhandled expression {left}"
    else:
        # `tag in post.tags and user in tag.users` where `post` is a partial
        # and `user` is an Odoo record.
        return COMPARISONS["Unify"](".".join(right_path), left)


# TODO (dhatch): Move this helper into base.
def dot_op_path(expr):
    """Get the path components of a lookup.

    The path is returned as a list.

    _this.created_by => ['created_by']
    _this.created_by.username => ['created_by', 'username']

    None is returned if input is not a dot operation.
    """
    if not (isinstance(expr, Expression) and expr.operator == "Dot"):
        return None

    assert len(expr.args) == 2

    if expr.args[0] == Variable("_this"):
        return [expr.args[1]]

    return dot_op_path(expr.args[0]) + [expr.args[1]]
