UPDATE employees
SET Title     = 'IT Manager',
    ReportsTo = (SELECT EmployeeId FROM employees WHERE LastName = 'Adams' AND FirstName = 'Andrew')
WHERE LastName = 'King'
  AND FirstName = 'Robert';