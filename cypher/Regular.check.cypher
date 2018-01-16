MATCH (n)
WITH size((n)-[]-()) AS Degrees
WITH collect(DISTINCT Degrees) AS Degrees
WITH CASE size(Degrees)
    WHEN 1 THEN "Regular of degree " + Degrees[0]
    ELSE "Not regular"
END AS Result
RETURN Result;
