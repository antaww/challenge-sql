SELECT printf('%s %s', FirstName, UPPER(LastName)) AS FullName, SUM(Total) AS AllInvoices
FROM customers                                                                             INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY customers.CustomerId
HAVING AllInvoices > 38
ORDER BY FullName;