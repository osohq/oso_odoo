# Deny everything by default.

allow(_, _, repo: oso::test::repository) if
    repo.name.endswith("A");

allow(_, _, repo: oso::test::organization);

# base cases
filter_allow(user, action, [], []);

# recursive cases
# positive case: add to output
filter_allow(user, action, [next, *input], [next, *output]) if
    allow(user, action, next) and filter_allow(user, action, [*input], [*output]);

# negative case: remove from output
filter_allow(user, action, [_, *input], output) if
    filter_allow(user, action, [*input], output);
