// Alternative query using APOC
MATCH
    (a)-[]-(b), (a)-[]-(c), (a)-[]-(d), (a)-[]-(e),
    (b)-[]-(c), (b)-[]-(d), (b)-[]-(e),
    (c)-[]-(d), (c)-[]-(e),
    (d)-[]-(e)
WHERE size(apoc.coll.toSet([a, b, c, d, e])) = 5
RETURN *
LIMIT 1;
