// Method: Connect each vertex to N other vertices.
// This provides limited control over the degree of each vertex.
WITH
    // Number of nodes in graph
    20 AS NodeCount,
    // Limiting factor to determine adjacent nodes (out-degree)
    // AdjacentNodeCount = rand(1, NodeCount) / AdjacentNodeCountFactor
    5 AS AdjacentNodeCountFactor
WITH
    NodeCount,
    AdjacentNodeCountFactor,
    range(1, NodeCount) AS items
FOREACH (
    item_s in items |
    MERGE (s:Vertex {id: item_s})
    FOREACH (
        item_t in filter(
            y IN [
                x IN range(1, toInteger(round((rand() * (NodeCount - 1) + 1 / AdjacentNodeCountFactor))) /*Adjacent Nodes Count*/) |
                toInteger(round(rand() * (NodeCount - 1) + 1)) /*Target Node*/
            ] WHERE y <> item_s /*Avoid self-relationships*/
        ) |
        MERGE (t:Vertex {id: item_t})
        MERGE (s)-[:EDGE]-(t)
    )
);
