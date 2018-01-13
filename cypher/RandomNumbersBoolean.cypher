WITH [x IN range(1, 20) | toInteger(rand() * 2)] As RandomNumberBoolean
RETURN RandomNumberBoolean;