WITH DeptTopSalaries AS (
    SELECT departmentId, salary, salary_rank FROM (
        SELECT
            departmentId,
            salary,
            DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
        FROM (
            SELECT DISTINCT departmentId, salary
            FROM Employee
        ) AS distinct_salaries
    ) AS ranked_salaries
    WHERE salary_rank <= 3
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN DeptTopSalaries t
    ON e.departmentId = t.departmentId AND e.salary = t.salary
JOIN Department d
    ON e.departmentId = d.id
ORDER BY Department, Salary DESC;
