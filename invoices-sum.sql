SELECT SUM(Total) AS AllInvoicesTotalPrice
FROM invoices
WHERE CustomerId = (SELECT CustomerId FROM customers WHERE FirstName = 'Tim' AND LastName = 'Goyer');