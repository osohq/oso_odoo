# Deny everything by default.

allow(_, _, repo: oso::test::repository) if
    repo.name.endswith("A");

allow(_, _, repo: oso::test::organization);
