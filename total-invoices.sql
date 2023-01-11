SELECT printf('%s %s', c.FirstName, UPPER(c.LastName)) AS FullName,
ROUND(SUM(i.Total),2) AS AllInvoices
FROM customers c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING AllInvoices > 38
ORDER BY FullName;