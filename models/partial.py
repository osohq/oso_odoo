"""Translate Polar expressions to Odoo domain expressions.
Used in the context of partially evaluated queries."""

import functools
from typing import Any, Callable, List

from odoo.models import AbstractModel
from odoo.osv import expression as domain_expression

from polar import Expression, Variable
from polar.exceptions import UnsupportedError

EmitFunction = Callable[[str], Any]


def polar_type_name(name):
    """Translate an Odoo model name to a Polar type specializer name."""
    return name.replace(".", "::")


def partial_to_domain_expr(expr: Expression, model: AbstractModel):
    """Translate a Polar expression to an Odoo domain expression."""
    assert isinstance(expr, Expression), "expected a Polar expression"
    assert isinstance(model, AbstractModel), "expected a model"

    if expr.operator in ("Eq", "Unify"):
        return compare_expr(expr, model)
    elif expr.operator == "And":
        return and_expr(expr, model)
    elif expr.operator == "Isa":
        assert expr.args[1].tag == polar_type_name(model._name)
        return []
    elif expr.operator == "In":
        return in_expr(expr, model)
    else:
        raise UnsupportedError(f"Unsupported expression {expr}")


def and_expr(expr: Expression, model):
    assert expr.operator == "And"
    return domain_expression.AND(
        [partial_to_domain_expr(arg, model) for arg in expr.args]
    )


COMPARISONS = {
    "Unify": lambda f, v: [(f, "=", v)],
    "Eq": lambda f, v: [(f, "=", v)],
    "Neq": lambda f, v: [(f, "!=", v)],
    "Geq": lambda f, v: [(f, ">=", v)],
    "Gt": lambda f, v: [(f, ">", v)],
    "Leq": lambda f, v: [(f, "<=", v)],
    "Lt": lambda f, v: [(f, "<", v)],
}


def compare_expr(expr: Expression, model):
    op = expr.operator
    (left, right) = expr.args
    path = dot_op_path(left)
    if path:
        if isinstance(right, AbstractModel):
            assert len(right) == 1
            right = right.id
        return COMPARISONS[op](".".join(path), right)
    else:
        path = dot_op_path(right)
        assert path
        assert False, "Is this case ever hit?"
        return COMPARISONS[op](left, ".".join(path))


def in_expr(expr: Expression, model):
    # XXX
    return []


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
