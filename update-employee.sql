UPDATE employees
SET Title     = 'IT Manager',
    ReportsTo = (SELECT EmployeeId FROM employees WHERE LastName = 'Andrew' AND FirstName = 'Adams')
WHERE LastName = 'King'
  AND FirstName = 'Robert';