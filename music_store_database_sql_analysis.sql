-- Q.1 Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC LIMIT 1;

-- Ans. Mohan Madan (9) is the senior-most employee based on job title.


-- Q.2 Which countries have the most invoices?

SELECT billing_country, COUNT(invoice_id) AS number_of_invoices FROM invoice
GROUP BY billing_country
ORDER BY number_of_invoices DESC;

-- Ans. USA has 131, Canada has 76 and Brazil has 61 invoices.


-- Q.3 What are top 3 values of total invoice?

SELECT total FROM invoice
ORDER BY total DESC LIMIT 3;

-- Ans. The top 3 values of invoice are 23.759, 19.8 and 19.8.


-- Q.4 Which city has the best customers? We would like to throw a promotional music festival in the city we made the most money.

SELECT billing_city AS city, SUM(total) AS revenue FROM invoice
GROUP BY billing_city
ORDER BY revenue DESC LIMIT 1;

-- Ans. Prague has the best customers with the highest revenue so it is the most desired city to throw a promotional music festival.


-- Q.5 Who is the best customer?

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS expenditure FROM customer
JOIN invoice USING (customer_id)
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY expenditure DESC LIMIT 1;

-- Ans. R Madhav is the best customer as he has spent the maximum amount among all the other customers.


-- Q.6  Get the list of contact details of all the rock music listeners, order by email.

SELECT DISTINCT email, first_name, last_name 
FROM customer
JOIN invoice USING (customer_id)
JOIN invoice_line USING (invoice_id)
WHERE track_id IN 
    (SELECT track_id 
     FROM track
     JOIN genre USING (genre_id)
     WHERE genre.name LIKE 'Rock')
ORDER BY email;

-- Alternative (Less Optimized due to use of multiple JOINs)
/* 
SELECT DISTINCT email, first_name, last_name FROM customer
JOIN invoice USING (customer_id)
JOIN invoice_line USING (invoice_id)
JOIN track USING (track_id)
JOIN genre USING (genre_id)
WHERE genre.name LIKE 'Rock'
ORDER BY email;
*/


-- Q.7 Get the artist name and total track count of the top 10 rock artists.

SELECT artist.name, COUNT(track.name) AS rock_tracks_count FROM track 
JOIN album USING (album_id)
JOIN genre USING (genre_id)
JOIN artist USING (artist_id)
WHERE genre.name LIKE 'Rock'
GROUP BY artist.name
ORDER by rock_tracks_count DESC LIMIT 10;


-- Q.8 Return all the track names, and milli-seconds for each track having song length longer than the average song length, order by longest songs listed first.

SELECT name, milliseconds AS time FROM track
WHERE milliseconds >
	(SELECT AVG(milliseconds) AS avg_time FROM track)
ORDER BY time DESC;


-- Q.9 Find how much amount spent by each customer on the top artist

WITH top_artist AS(
	SELECT artist_id, artist.name AS artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track USING (track_id)
	JOIN album USING (album_id)
	JOIN artist USING (artist_id)
	GROUP BY artist_id, artist_name
	ORDER BY total_sales DESC LIMIT 1
)
SELECT c.first_name, c.last_name, top_artist.artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) AS amount_spent
FROM invoice
JOIN invoice_line USING (invoice_id)
JOIN customer c USING (customer_id)
JOIN track USING (track_id)
JOIN album USING (album_id)
JOIN top_artist USING (artist_id)
GROUP BY 1,2,3
ORDER BY 4 DESC
;


-- Q.10 Find out the most popular music genre for each country.

WITH popular_genre AS (
	SELECT COUNT(invoice_line.quantity) AS purchases, country, genre.name AS 	genre_name, genre_id, ROW_NUMBER() OVER(PARTITION BY country ORDER BY
	COUNT(invoice_line.quantity) DESC) AS row_no
	FROM invoice_line 
	JOIN invoice USING (invoice_id)
	JOIN customer USING (customer_id)
	JOIN track USING (track_id)
	JOIN genre USING (genre_id)
	GROUP BY 2,3,4
	ORDER BY 2, 1 DESC
)
SELECT purchases, country, genre_name AS most_popular_music_genre, genre_id FROM popular_genre WHERE row_no <= 1;

/* Alternate Approach - (Less efficient due to nested CTE's)
WITH RECURSIVE 
	sales_per_country AS(
		SELECT COUNT(*) AS purchase_per_genre, country, genre.name AS 
		genre_name, genre_id
		FROM invoice_line
		JOIN invoice USING (invoice_id)
		JOIN customer USING (customer_id)
		JOIN track USING (track_id)
		JOIN genre USING (genre_id)
		GROUP BY 2,3,4
		ORDER BY 2
	),
	max_genre_per_country AS(
		SELECT MAX(purchase_per_genre) AS most_popular_genre, country
		FROM sales_per_country
		GROUP BY 2
		ORDER BY 2
		)
SELECT sales_per_country.*
FROM sales_per_country
JOIN max_genre_per_country USING (country)
WHERE sales_per_country.purchase_per_genre = max_genre_per_country.most_popular_genre; */


-- Q.11 Find the customer who has spent the most on music for each country. For countries where the top amount spent is shared, provide all customers who spent this amount.

WITH amount_spent_per_customer AS (
	SELECT customer.customer_id, country, first_name, last_name, 
	SUM(unit_price * quantity) AS expenditure
	FROM customer
	JOIN invoice USING (customer_id)
	JOIN invoice_line USING (invoice_id)
	GROUP BY 1,2,3,4
),
ranked_customers AS (
	SELECT customer_id, country, first_name, last_name, expenditure, 
	RANK() OVER (PARTITION BY country ORDER BY expenditure DESC) AS 
	rank_no
	FROM amount_spent_per_customer
)
SELECT customer_id, country, first_name, last_name, expenditure
FROM ranked_customers
WHERE rank_no = 1
ORDER BY 5 DESC;



