WITH 3 AS Count
WITH
    range(1, Count) AS items_h,
    range(Count + 1, Count * 2) AS items_u
FOREACH (
    item_h IN items_h |
    CREATE (s:House {id: item_h})
    FOREACH (
        item_u IN items_u |
        MERGE (t:Utility {id: item_u})
        MERGE (s)-[:EDGE]-(t)
    )
);
