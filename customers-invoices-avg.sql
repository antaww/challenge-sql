SELECT
    c.FirstName,
    c.LastName,
    AVG(i.Total) AS InvoicesAverage
FROM
    customers c
        INNER JOIN
    invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY c.FirstName;