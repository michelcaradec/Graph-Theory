MATCH
    (a)-[]-(b),
    (b)-[]-(c),
    (c)-[]-(d),
    (d)-[]-(e)
WHERE
    NOT a IN [b, c, d, e]
    AND NOT b IN [c, d, e]
    AND NOT c IN [d, e]
    AND NOT d IN [e]
RETURN *;
