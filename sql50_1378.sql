SELECT e.name as name, u.unique_id as unique_id
FROM Employees e LEFT JOIN EmployeeUNI u
ON e.id = u.id;
