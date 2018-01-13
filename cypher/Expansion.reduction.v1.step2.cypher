// Iterates for each n IN Nodes
// 2.Substitute vertices with degree 2
MATCH (n)-[r]-()
WITH n, COUNT(r) AS Degree
WHERE Degree = 2
MATCH (a)-[r1]-(n)-[r2]-(b)
MERGE (a)-[:EDGE]-(b)
DETACH DELETE n;
