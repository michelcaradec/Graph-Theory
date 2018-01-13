// Method: Build vertices relationships from an adjancy matrix.
// This method provides control over the maximum degree of each vertex (see AdjacencyProbability).
WITH
    // Number of nodes in graph
    20 AS NodeCount,
    // Probability that two vertices are adjacent (default = 1/2, as with unbiased flipped coin).
    1.0 / 10 AS AdjacencyProbability
WITH
    NodeCount,
    AdjacencyProbability,
    [x IN range(1, toInteger(NodeCount ^ 2)) | toInteger(rand() * (1 + AdjacencyProbability * 2))] AS AdjacencyMatrix
FOREACH (
    row IN range(1, NodeCount) |
    MERGE (s:Vertex {id: row})
    FOREACH (
        col IN [c IN range(1, NodeCount) WHERE c <> row | c] /*Avoid self-relationships*/ |
        FOREACH (
            // Pick coordinates of adjacent vertices.
            item_t IN filter(
                i IN [(row - 1) * NodeCount + col]
                WHERE AdjacencyMatrix[i] <> 0
             ) |
            MERGE (t:Vertex {id: col})
            MERGE (s)-[:EDGE]-(t)
        )
    )
);
