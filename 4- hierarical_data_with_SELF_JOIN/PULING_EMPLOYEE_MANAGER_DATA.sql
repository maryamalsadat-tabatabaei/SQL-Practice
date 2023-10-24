SELECT
    employees.employeeid,
    employees.name as employee_name,
    manager.name as manager_name,
    coalesce(manager.email ,employees.email) as contact_email --return first non-null item
FROM
    employees
LEFT JOIN
    employees as manager
ON
    employees.managerid=manager.employeeid
WHERE
    employees.department='Sales'