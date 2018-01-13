// Check AdjacencyProbability
WITH
    // Number of nodes in graph
    100 AS NodeCount,
    // Probability that two vertices are adjacent (default = 1/2, as with unbiased flipped coin).
    1.0 / 10 AS AdjacencyProbability
WITH
    NodeCount,
    AdjacencyProbability,
    [x IN range(1, toInteger(NodeCount ^ 2)) | toInteger(rand() * (1 + AdjacencyProbability * 2))] AS AdjacencyMatrix
// Probability should be close to AdjacencyProbability.
RETURN reduce(acc = 0, x IN AdjacencyMatrix | acc + x) / (NodeCount ^2) AS Probability;
