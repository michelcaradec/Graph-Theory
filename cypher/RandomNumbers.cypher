WITH 15 AS UpperBound
WITH [x IN range(1, 20) | round(rand() * (UpperBound - 1) + 1)] As RandomNumber
RETURN RandomNumber;