CREATE
    (h1:House {id: 1}),
    (h2:House {id: 2}),
    (h3:House {id: 3}),
    (u1:Utility {id: 4}),
    (u2:Utility {id: 5}),
    (u3:Utility {id: 6}),
    (e1:Expansion {id: 7}),
    (e2:Expansion {id: 8}),
    (e3:Expansion {id: 9}),
    (h1)-[:EDGE]->(e1)-[:EDGE]->(e2)-[:EDGE]->(u1),
    (h1)-[:EDGE]->(u2),
    (h1)-[:EDGE]->(u3),
    (h2)-[:EDGE]->(u1),
    (h2)-[:EDGE]->(u2),
    (h2)-[:EDGE]->(u3),
    (h3)-[:EDGE]->(u1),
    (h3)-[:EDGE]->(u2),
    (h3)-[:EDGE]->(e3)-[:EDGE]->(u3);