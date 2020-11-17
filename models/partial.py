"""Translate Polar expressions to Odoo domain expressions.
Used in the context of partially evaluated queries."""

import functools
from typing import Any, Callable, List

from odoo.models import AbstractModel
from odoo.osv import expression as domain_expression

from polar import Expression, Variable
from polar.exceptions import UnsupportedError

EmitFunction = Callable[[str], Any]

COMPARISONS = {
    "Unify": lambda f, v: [(f, "=", v)],
    "Eq": lambda f, v: [(f, "=", v)],
    "Neq": lambda f, v: [(f, "!=", v)],
    "Geq": lambda f, v: [(f, ">=", v)],
    "Gt": lambda f, v: [(f, ">", v)],
    "Leq": lambda f, v: [(f, "<=", v)],
    "Lt": lambda f, v: [(f, "<", v)],
}


def polar_type_name(name):
    """Translate an Odoo model name to a Polar type specializer name."""
    return name.replace(".", "::")


def partial_to_domain_expr(expr: Expression, model: AbstractModel, **kwargs):
    """Translate a Polar expression to an Odoo domain expression."""
    assert isinstance(expr, Expression), "expected a Polar expression"
    assert isinstance(model, AbstractModel), "expected a model"

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
        if isinstance(right, AbstractModel):
            assert len(right) == 1
            right = right.id
        return COMPARISONS[op](".".join(path + left_path), right)
    else:
        # TODO: Is this unreachable if everything is working correctly?
        breakpoint()


def in_expr(expr: Expression, model):
    print(f"expr: {expr}, model: {model}")
    assert expr.operator == "In"
    (left, right) = expr.args

    right_path = dot_op_path(right)
    assert right_path, "Expected a lookup path"

    if isinstance(left, Expression):
        # Since the relationship lookup always has to be on the left (the
        # field), do we need to invert directional operators like > / >= / < /
        # <= ?
        left_path = dot_op_path(left.args[0])
        if left_path:
            return COMPARISONS[left.operator](
                ".".join(right_path + left_path), left.args[1]
            )
        elif left.operator == "And":
            # Distribute the expression over the "In".
            return and_expr(left, model, path=right_path)
        else:
            assert False, f"Unhandled expression {left}"
    else:
        pass
        # right contains left

        # fetch right and then do COMPARISONS["In"](left, right)


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
