-- count of how many times each user completed a front-end  event

SELECT
    userid,
    sum(CASE WHEN el.eventid = 1 THEN 1 ELSE 0 END) AS viewedHelpCenterPage,
    sum(CASE WHEN el.eventid = 2 THEN 1 ELSE 0 END) AS clickedFAQs,
    sum(CASE WHEN el.eventid = 3 THEN 1 ELSE 0 END) AS clickedContactSupport,
    sum(CASE WHEN el.eventid = 4 THEN 1 ELSE 0 END) AS submittedTicket,
FROM 
    frontendeventlog el
JOIN
    frontendeventdefinitions def
ON
    el.eventid=def.eventid
WHERE
    eventtype = 'Customer Support'
GROUP BY
    userid