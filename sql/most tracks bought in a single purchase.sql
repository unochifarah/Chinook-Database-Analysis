SELECT
	cu.first_name || ' ' || cu.last_name AS customer_name,
	SUM(il.quantity)
FROM 
	invoice_line il
INNER JOIN
	invoice inv
ON
	inv.invoice_id = il.invoice_id
INNER JOIN
	customer cu
ON
	cu.customer_id = inv.customer_id
GROUP BY
	il.invoice_id,
	customer_name
ORDER BY
	SUM(il.quantity) DESC
;