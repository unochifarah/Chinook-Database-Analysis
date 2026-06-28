SELECT 
	SUM(il.quantity),
	al.title,
	ar.name
FROM 
	invoice_line il
INNER JOIN
	track tr
ON
	il.track_id = tr.track_id
INNER JOIN
	album al
ON
	tr.album_id = al.album_id
INNER JOIN
	artist ar
ON
	al.artist_id = ar.artist_id
GROUP BY
	al.title,
	ar.name
ORDER BY
	SUM(il.quantity) DESC
;