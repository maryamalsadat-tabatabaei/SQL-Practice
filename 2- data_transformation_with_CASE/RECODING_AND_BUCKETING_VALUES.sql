-- recode statuses into appropiate business verbiage for stackholders to take action fron them

SELECT
    customerid,
    subscriptionid,
    CASE
        WHEN currentStatus = 5 THEN 'User completed payment process'
        WHEN currentStatus = 0 THEN 'User in eror status'
        WHEN currentStatus IN(1,2,3,4) THEN 'User is in the payment process'
        WHEN currentStatus IS NULL THEN 'User has not interacted with payment widget'
    END 
    AS  UserPaymentStage

FROM
    subscriptions