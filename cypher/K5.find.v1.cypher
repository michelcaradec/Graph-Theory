MATCH
    (a)-[]-(b), (a)-[]-(c), (a)-[]-(d), (a)-[]-(e),
    (b)-[]-(c), (b)-[]-(d), (b)-[]-(e),
    (c)-[]-(d), (c)-[]-(e),
    (d)-[]-(e)
WHERE
    NOT a IN [b, c, d, e]
    AND NOT b IN [c, d, e]
    AND NOT c IN [d, e]
    AND NOT d IN [e]
RETURN *
LIMIT 1;
