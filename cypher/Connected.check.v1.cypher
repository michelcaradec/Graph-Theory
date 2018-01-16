// Get all vertices.
MATCH (n)
WITH collect(n) AS Nodes
// For each vertices combination...
WITH [n IN Nodes |
    [m IN Nodes WHERE m <> n |
		// ...Check for path existence.
    	CASE length(shortestPath((n)-[*]-(m)))
			WHEN NULL THEN 0
			ELSE 1
		END
    ]
] AS PathMatrix
// Unroll connectivity matrix.
UNWIND PathMatrix AS PathRows
UNWIND PathRows AS PathCells
// Connectivity is verified if all vertices are connected
// (i.e. connectivity matrix only contains 1).
WITH count(DISTINCT PathCells) AS PathCellsCount
WITH CASE PathCellsCount
	WHEN 1 THEN "Connected"
	ELSE "Disconnected"
END AS Result
RETURN Result;
