MATCH
    (h1)-[r1_1]-(u1),
    (h1)-[r1_2]-(u2),
    (h1)-[r1_3]-(u3),
    (h2)-[r2_1]-(u1),
    (h2)-[r2_2]-(u2),
    (h2)-[r2_3]-(u3),
    (h3)-[r3_1]-(u1),
    (h3)-[r3_2]-(u2),
    (h3)-[r3_3]-(u3)
WHERE
    NOT h1 IN [h2, h3, u1, u2, u3]
    AND NOT h2 IN [h3, u1, u2, u3]
    AND NOT h3 IN [u1, u2, u3]
    AND NOT u1 IN [u2, u3]
    AND NOT u2 IN [u3]
RETURN
    h1, h2, h3,
    u1, u2, u3,
    r1_1, r1_2, r1_3,
    r2_1, r2_2, r2_3,
    r3_1, r3_2, r3_3
LIMIT 1;
