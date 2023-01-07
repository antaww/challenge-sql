SELECT c.FirstName, c.LastName, c.Company, i.Total AS InvoiceTotalPrice
FROM customers c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.Company IS NOT NULL