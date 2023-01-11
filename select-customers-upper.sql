SELECT UPPER(c.LastName) AS LastNameUpper, c.FirstName
FROM customers c
WHERE LENGTH(c.FirstName) > 5 AND LENGTH(c.LastName) > 5
ORDER BY c.LastName;
