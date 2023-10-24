WITH monthly_revs AS
(
    SELECT
        date_trunc('month',s.orderdate) as ordermonth,
        p.productname,
        sum(s.revenue) as revenue
    FROM
        subscriptions s
    JOIN
        products p 
    ON  
        s.productid=p.productid
    WHERE 
        s.orderdate BETWEEN '2022-01-01' and '2022-12-31'
    GROUP BY  
        date_trunc('month',s.orderdate) ,  p.productname
    )

    SELECT
        productname,
        min(revenue) as min_rev,
        max(revenue) as max_rev,
        avg(revenue) as avg_rev,
        stddev(revenue) as std_dev_rev
    FROM 
        monthly_revs
    GROUP BY
        productname