SELECT
	COUNT(invoice_id),
	billing_country
FROM 
	invoice
GROUP BY
	billing_country
ORDER BY
	COUNT(invoice_id) DESC