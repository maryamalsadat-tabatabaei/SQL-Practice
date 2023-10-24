-- All-time average number of registered users purchased by customerId

WITH num_users AS
(
    SELECT customerId,sum(numberodusers) as total_users 
    FROM subscriptions 
    GROUP BY customerId
    ) 
    SELECT avg(total_users) as average_users 
    FROM num_users

-- 1) create a CTE that aggregates the number of users by customer
-- 2) find the average of all the summed values in a seperate select statements