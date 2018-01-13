WITH 5 AS Count
WITH range(1, Count) AS items
FOREACH (
    s_id IN items |
    FOREACH (
        t_id IN filter(item in items WHERE item <> s_id) |
        MERGE (s:Vertex {id: s_id})
        MERGE (t:Vertex {id: t_id})
        MERGE (s)-[:EDGE]-(t)
    )
);
