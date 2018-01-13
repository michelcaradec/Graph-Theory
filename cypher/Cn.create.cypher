WITH 5 AS Count
WITH range(1, Count) AS items
WITH [x in tail(items) | [x - 1, x]] + [[last(items), head(items)]] AS tuples
FOREACH (
    tuple IN tuples |
    MERGE (s:Vertex {id: head(tuple)})
    MERGE (t:Vertex {id: last(tuple)})
    CREATE (s)-[:EDGE]->(t)
);
