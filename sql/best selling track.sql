SELECT 
	SUM(il.quantity),
	tr.name
FROM 
	invoice_line il
INNER JOIN
	track tr
ON
	tr.track_id = il.track_id
GROUP BY
	tr.name
ORDER BY
	SUM(il.quantity) DESC
;