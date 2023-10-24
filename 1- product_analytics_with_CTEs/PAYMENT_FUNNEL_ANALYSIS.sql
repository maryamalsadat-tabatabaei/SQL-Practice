--  categorizing payment process into business logic to understand how users are interacting with payment process and interwinw to success rate
with max_status_reached as(
SELECT 
    subscriptionid,
    max(statusid) as maxstatus
FROM
    paymentstatuslog
GROUP BY
    subscriptionid
),
payment_funnel_stages as(

SELECT
    subs.subscriptionid,
    -- bissinesslogic
    case when maxstatus = 1 then 'PaymentWidgetOpened'
		when maxstatus = 2 then 'PaymentEntered'
		when maxstatus = 3 and currentstatus = 0 then 'User Error with Payment Submission'
		when maxstatus = 3 and currentstatus != 0 then 'Payment Submitted'
		when maxstatus = 4 and currentstatus = 0 then 'Payment Processing Error with Vendor'
		when maxstatus = 4 and currentstatus != 0 then 'Payment Success'
		when maxstatus = 5 then 'Complete'
		when maxstatus is null then 'User did not start payment process'
		end as paymentfunnelstage
FROM
    subscriptions subs
LEFT JOIN
    max_status_reached  max
ON
    subs.subscriptionid = max.subscriptionid
)

SELECT  
    paymentfunnelstage,
    count(subscriptionid) as subscriptions
FROM
    payment_funnel_stages
GROUP BY
    paymentfunnelstage