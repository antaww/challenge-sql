SELECT printf('%s %s', c.FirstName, c.LastName) AS FullName,
ROUND(SUM(i.Total),2) AS AllInvoices
FROM customers c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING AllInvoices > 5
ORDER BY FullName;