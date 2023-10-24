
-- union removes the duplicate rows from the final output but union all doesnt remove the duplicated

With all_subscriptions as(

--UNION subscriptions tables here
SELECT
    subscriptionid,
    expirationdate
FROM
    subscriptionsproduct1
WHERE
    active = 1

UNION ALL

SELECT
    subscriptionid,
    expirationdate
FROM
    subscriptionsproduct2
WHERE
    active = 1
)
select
	date_trunc('year', expirationdate) as exp_year, 
	count(*) as subscriptions
from 
	all_subscriptions
group by 
	date_trunc('year', expirationdate)