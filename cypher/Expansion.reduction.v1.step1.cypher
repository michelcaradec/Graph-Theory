// 1.Vertices with degree 2 (= expanded vertices)
MATCH (n)-[r]-()
WITH n, COUNT(r) AS Degree
WHERE Degree = 2
WITH collect(DISTINCT n) AS Nodes
RETURN Nodes;

// Alternative query
MATCH (n)-[]-()
WITH n, size((n)-[]-()) AS Degree
WHERE Degree = 2
WITH collect(DISTINCT n) AS Nodes
RETURN Nodes;
