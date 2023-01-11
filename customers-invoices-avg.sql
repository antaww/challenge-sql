-- You must carry out a statistical study on all the customers as well as their
-- invoices.
--
-- You must select, the FirstName and the LastName of each customer,
-- as well as the average total price of all their respective invoices with
-- the alias InvoicesAverage.
--
-- Take a look at the GROUP BY clause. You must GROUP BY an ID to be sure
-- that you haven't 2 same names.
--
-- You must order result by FirstName in ascending order.

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