SELECT
    salesemployeeid,
    saledate,
    saleamount,
    sum(saleamount) OVER (PARTITION BY salesemployeeid ORDER BY saledate) AS running_total,
    CAST(sum(saleamount) OVER (PARTITION BY salesemployeeid ORDER BY saledate) AS float) / quota AS percent_quota
FROM
    sales s
JOIN
    employees e 
ON
    s.salesemployeeid= employeeid