"""Translate Polar expressions to Odoo domain expressions.
Used in the context of partially evaluated queries."""

from odoo.models import AbstractModel
from odoo.osv import expression as domain_expression

from polar import Expression, Variable
from polar.exceptions import UnsupportedError


def partial_to_domain_expr(expr: Expression, type_name: str):
    """Translate a Polar expression to an Odoo domain expression."""
    assert isinstance(expr, Expression), "expected a Polar expression"
    if expr.operator in ("Eq", "Unify"):
        return compare_expr(expr, type_name)
    elif expr.operator == "And":
        return and_expr(expr, type_name)
    elif expr.operator == "Isa":
        assert expr.args[1].tag == type_name
        return []
    else:
        raise UnsupportedError(f"Unsupported expression {expr}")


def and_expr(expr: Expression, type_name: str):
    assert expr.operator == "And"
    return domain_expression.AND(
        [partial_to_domain_expr(arg, type_name) for arg in expr.args]
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


def compare_expr(expr: Expression, type_name: str):
    op = expr.operator
    (left, right) = expr.args
    field = dot_op_field(left)
    if field:
        if isinstance(right, AbstractModel):
            assert len(right) == 1
            right = right.id
        return COMPARISONS[op](field, right)
    else:
        assert False, "When does this happen?"
        return COMPARISONS[op](left, right)


def dot_op_field(expr):
    """Get the field from dot op ``expr`` or return ``False``."""
    return (
        isinstance(expr, Expression)
        and expr.operator == "Dot"
        and isinstance(expr.args[0], Variable)
        and expr.args[0] == Variable("_this")
        and expr.args[1]
    )
