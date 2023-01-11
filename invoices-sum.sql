SELECT ROUND(SUM(Total),2) AS AllInvoicesTotalPrice
FROM invoices
WHERE CustomerId = (SELECT CustomerId FROM customers WHERE FirstName = 'Tim' AND LastName = 'Goyer');