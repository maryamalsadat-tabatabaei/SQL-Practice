-- how many users are clicking the email link each number of times


WITH email_per_user AS (
    SELECT
        userid,
        count(*) as num_link_clicks  -- number of times each user click the links
    FROM
        frontendeventlog el
    where
        eventid = 5
    GROUP BY 
        userid
    )

    SELECT
        num_link_clicks,
        count(*) as num_users
    FROM
       email_per_user
    GROUP BY
        num_link_clicks