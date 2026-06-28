WITH genre_sales AS 
(	SELECT
        invoice.billing_country,
        ge.name,
        SUM(il.quantity) as total
    FROM invoice
    INNER JOIN invoice_line as il ON il.invoice_id = invoice.invoice_id
    INNER JOIN track as tr ON tr.track_id = il.track_id
    INNER JOIN genre as ge ON ge.genre_id = tr.genre_id
    GROUP BY invoice.billing_country, ge.name
),
ranked AS 
(	SELECT 
		billing_country,
        name,
        total,
        RANK() OVER (PARTITION BY billing_country ORDER BY total DESC) as rank
    FROM genre_sales
)
SELECT *
FROM ranked
WHERE rank = 1
ORDER BY billing_country;