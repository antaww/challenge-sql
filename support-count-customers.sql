SELECT printf('%s %s', e.FirstName, UPPER(e.LastName)) AS FullName,
COUNT(c.CustomerId) AS NumberOfCustomers
FROM employees e
INNER JOIN customers c ON e.EmployeeId = c.SupportRepId
WHERE e.Title = 'Sales Support Agent'
GROUP BY e.EmployeeId
ORDER BY NumberOfCustomers;