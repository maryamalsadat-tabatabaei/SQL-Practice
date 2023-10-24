
--Window functions perform calculations across a specified set of rows, or a window
-- ranking values within a window of rows
-- partition by (split up rows into window) or order by (order the rows within the window(if applicable))

-- 3 window functions to rank values
-- 1)  row_number() -- sequential number to each row and doent consider ties or dup;icte
-- 2) rank() -- not only consider tied vlues when ranking the ties but also consider the tied values for the values after the ties   
-- 3) dense_rank() -- consider ties but after tie value use sequential numbers for rank


WITH sale_ranks AS(
SELECT
    salesemployeeid,
    saleamountid,
    SaleDate,
    row_number() OVER(PARTITION BY salesemployeeid ORDER BY saledate DESC) AS most_recent_sale
FROM
    sales
)

SELECT
    *
FROM
    sale_ranks
WHERE
    most_recent_sale = 1