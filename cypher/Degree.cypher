MATCH (n)-[r]-()
RETURN n.id AS Id, COUNT(r) AS Degree
ORDER BY Degree DESC
