SELECT
    customerid,
    count(productid) as num_products,
    sum(numberofusers) as total_users,
    CASE WHEN  count(productid) = 1 
        OR
        sum(numberofusers) >=5000
        THEN 1
        ELSE 0
    END 
    As upsell_opportunity

FROM
    subscriptions
GROUP BY
    customerid