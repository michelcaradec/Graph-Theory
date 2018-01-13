// Method:
// Get all vertices involved in expanded paths (only containing vertices with degree 2).
// Delete in-between vertices.
// Create edge between starting and ending vertices

// Paths with two or more edges
MATCH p = (s)-[*2..]-(t)
WITH nodes(p) AS PathNodes
WITH
    // Vertices in path
    PathNodes,
    // Starting and ending vertices
    [head(PathNodes), last(PathNodes)] AS ExternalNodes
WITH
    ExternalNodes,
    // In-between vertices...
    filter(n IN PathNodes WHERE NOT n IN ExternalNodes) AS InsideNodes
WHERE
    // ...having degree 2
    all(n IN InsideNodes WHERE size((n)-[]-()) = 2)
WITH
    InsideNodes,
    ExternalNodes
// Create edge between starting and ending vertices
MATCH (s) WHERE s = head(ExternalNodes)
MATCH (t) WHERE t = last(ExternalNodes)
MERGE (s)-[:EDGE]-(t)
// Remove in-between vertices 
FOREACH(
    n IN InsideNodes |
    DETACH DELETE n
);
