// Get all vertices.
MATCH (n)
WITH collect(n) AS Nodes
// For each vertices combination...
WITH [n IN Nodes |
    [m IN Nodes |
		// ...Check for edge existence.
    	CASE size((n)-[]-(m))
			WHEN 0 THEN 0
			ELSE 1
		END
    ]
] AS AdjacencyMatrix
// Unroll rows.
UNWIND AdjacencyMatrix AS AdjacencyRows
RETURN AdjacencyRows;
