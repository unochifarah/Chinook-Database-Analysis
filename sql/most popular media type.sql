SELECT 
	SUM(il.quantity),
	mt.name
FROM 
	invoice_line il
INNER JOIN
	track tr
ON
	tr.track_id = il.track_id
INNER JOIN
	media_type mt
ON
	mt.media_type_ID = tr.media_type_ID
GROUP BY
	mt.media_type_ID
ORDER BY
	SUM(il.quantity) DESC
;