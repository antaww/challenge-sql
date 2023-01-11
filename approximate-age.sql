SELECT e.FirstName, e.LastName, (e.HireDate - e.BirthDate) AS ApproximateAge
FROM employees e
ORDER BY ApproximateAge;