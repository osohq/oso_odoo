"""Translate Polar expressions to Odoo domain expressions.
Used in the context of partially evaluated queries."""

from odoo.models import BaseModel
from odoo.osv import expression as domain_expression

from polar import Expression, Variable
from polar.exceptions import UnsupportedError


def make_comparison(op):
    def compare(left, right):
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
        return and_expr(expr, model)
    elif expr.operator == "Isa":
        assert expr.args[1].tag == polar_type_name(model._name)
        return None
    elif expr.operator == "In":
        return in_expr(expr, model, **kwargs)
    else:
        raise UnsupportedError(f"Unsupported expression {expr}")


def and_expr(expr: Expression, model, **kwargs):
    assert expr.operator == "And"
    operands = []
    for arg in expr.args:
        domain_expr = partial_to_domain_expr(arg, model, **kwargs)
        if domain_expr is None:
            continue
        operands.append(domain_expr)

    return domain_expression.AND(operands)


def compare_expr(expr: Expression, model, path=[], **kwargs):
    op = expr.operator
    (left, right) = expr.args
    left_path = dot_op_path(left)

    if left_path:
        return COMPARISONS[op](".".join(path + left_path), right)
    else:
        # Odoo only allows dot lookups (traversing relationships) in the
        # field_name, which is on the LHS of a search criterion.
        # See: https://www.odoo.com/documentation/14.0/reference/orm.html#search-domains
        right_path = dot_op_path(right)
        assert right_path, "Expected a lookup path"

        domain = COMPARISONS[op](".".join(path + right_path), left)

        if op in ["Geq", "Gt", "Leq", "Lt"]:
            domain.insert(0, "!")
            domain = domain_expression.distribute_not(domain)

        return domain

    assert left_path, "Expected a lookup path"


def in_expr(expr: Expression, model, path=[], **kwargs):
    assert expr.operator == "In"
    (left, right) = expr.args
    right_path = dot_op_path(right)
    assert right_path, "Expected a lookup path"

    if isinstance(left, Expression):
        left_path = dot_op_path(left.args[0])
        if left_path:
            return COMPARISONS[left.operator](
                ".".join(right_path + left_path), left.args[1]
            )
        elif left.operator == "And":
            # Distribute the expression over the "In".
            return and_expr(left, model, path=right_path)
        elif left.operator == "In":
            return in_expr(left, model, path=right_path)
        else:
            assert False, f"Unhandled expression {left}"
    else:
        return COMPARISONS["Unify"](".".join(path + right_path), left)


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
