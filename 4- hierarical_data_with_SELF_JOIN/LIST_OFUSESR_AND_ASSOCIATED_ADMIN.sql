SELECT
    users.name as user_name,
    admin.name as admin_name
FROM
    users
LEFT JOIN
    users admin
ON 
    users.adminid=admin.userid