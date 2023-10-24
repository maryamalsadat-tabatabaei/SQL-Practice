
WITH monthly_revs AS(
select 
    date_trunc('month', orderdate) as order_month, 
    sum(revenue) as monthly_revenue
from 
    subscriptions
group by 
    date_trunc('month', orderdate)
)
SELECT
    current.order_month as current_month,
    previous.order_month as previous_month,
    current.monthly_revenue as current_revenue,
    previous.monthly_revenue as previous_revenue,

FROM
    monthly_revs current
JOIN
    monthly_revs previous
WHERE
    current.monthly_revenue > previous.monthly_revenue
    AND
    datediff('month',previous.order_month, current.order_month)=1;