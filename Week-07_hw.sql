---1, create a new column called Status in the rentals table that uses a case statement to indicate is a film was returned late, early, or on time.
ALTER TABLE rental
ADD status varchar(10);

UPDATE rental
SET status =
   CASE WHEN rental_duration > date_part('day', return_date - rental_date) THEN 'Early' 
        WHEN rental_duration < date_part('day', return_date - rental_date) THEN 'Late'
        ELSE 'on time' END 		
FROM film;

SELECT f.title, r.status
FROM film as f
JOIN inventory AS i
ON f.film_id = i.film_id
JOIN rental AS r
ON r.inventory_id = i.inventory_id
/* here in the above query i have altered table rental and added status column and then updated that status column with the data
and then selected the films with the status column to see whether the film status */
 
--2, show the total payment amounts for people who live in kansas city or saint louis.

SELECT SUM(p.amount) AS total_amount, c1.city AS city
FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id
INNER JOIN address AS a
ON a.address_id = c.address_id
INNER JOIN city AS c1
ON c1.city_id = a.city_id
WHERE city = 'Kansas City' OR city = 'Saint Louis'
GROUP BY c1.city;

/* Here in the query i have joined payment, customer,address and city table , because the the amount is listed in payment table and city is listed in city table
i joined the tables so that we can sum the total amount for a particular city , here i used where clause it helps to use math calculations. */

---3.How many films are in each category ? Why do you think there is a table for category and a table for film category?
SELECT c.name, COUNT(c.name) AS film_count
FROM category AS c
JOIN film_category AS f
ON f.category_id = c.category_id
GROUP BY c.name;

/* Here in the query it is selecting category name and its count that how many times that the film category is repeated 
Joined category and film category to get the total count of film category */

/* I think it is necessory to have a film category table as it shows the film category and there is rule that each category in the category table
should have a film so thats why we have film category table which shows the film category , it gives us an film category idea. */

---4, Show the roster for the staff that includes their email, address, city, and country(not ids).
SELECT s.email AS email, a.address AS address, c.city AS city, c1.country AS country
FROM staff AS s
JOIN address AS a
ON a.address_id = s.address_id
JOIN city AS c
ON c.city_id = a.city_id
JOIN country AS c1
ON c1.country_id = c.country_id;

/* here for the above query i have selected the coulmns that we need to show on the table and joined the staff, address, city and country table 
to get all the data requested for the question. */

----5, Show the film_id, title, and length for the movies that were returned from may 15 to 31, 2005.
SELECT f.film_id AS film_id, f.title AS title, f.length AS length
FROM film AS f
JOIN inventory AS i
ON i.film_id = f.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id
WHERE return_date BETWEEN '2005-05-15' AND '2005-05-31';

/* Here for the above query i have used where clause to calculate the date range,, joined film, inventory and rental table to get all the columns
Query is checking the the films that where returned between the given period */

---6, Write a subquery to show which movies are rented below the average price for all movies. 
SELECT title, rental_rate
FROM film
WHERE rental_rate < (
                SELECT AVG(rental_rate)
                FROM film);
				
/* For the abive query i have used where clause and added subquery to find the average and selected the data which is requested in the quetion */

---7, Write a join statement to show which movies are rented below the average price for all movies.
SELECT f.title AS title, f.rental_rate AS rental_rate
FROM film as f
CROSS JOIN film as f1
WHERE f.rental_rate < (
                SELECT AVG(rental_rate)
                FROM film);	
/* here in the above query i use cross join and added film table to itself and calculated avergare and selected the data */

--8, Perform an explain plan on 6 and 7 and describe what you're seeing and important ways they differ.

---6th question Explain
EXPLAIN SELECT title, rental_rate
FROM film
WHERE rental_rate < (
                SELECT AVG(rental_rate)
                FROM film);
/* Explin shows Seq Scan on film  (cost=66.51..133.01 rows=333 width=21) and the math calculation we done on the query
and Seq Scan on film film_1  (cost=0.00..64.00 rows=1000 width=6) */	
				
---7th question Explain			
EXPLAIN SELECT f.title AS title, f.rental_rate AS rental_rate
FROM film as f
CROSS JOIN film as f1
WHERE f.rental_rate < (
                SELECT AVG(rental_rate)
                FROM film);
/* here in the explain the Nested Loop  (cost=66.51..4360.35 rows=333000 width=21) and it increased the rows when we use 
cross join */

/* Both the quetions have their own data, explanation and the space they are taking on the data table, 
explain shows that the there is joins on the query and shows the aggregates for both the queries */

---9, With a windows function, write a query that shows the film, its duration, and what percentile the duration fits into.
SELECT title, length,
       NTILE(length) OVER (ORDER BY title) AS percentile
FROM film;

/* here for the above query i took NTILE to calculate the percentile. 
this percentile just gives us the numerical rankings for the films. */

---10, In under 100 words, explain what the difference is between set-based and procedural programming. be sure to specify which sql and python are.

/* Procedural approach is actually the "programmatic approach" that we are used to working with in our daily programming life. 
We tell the system "what to do" along with "how to do" it. 
We query the database to obtain a result set and we write the data operational and manipulation logic using 
loops, conditions, and processing statements to produce the final result.
Set based approach is actually an approach which lets you specify "what to do", but does not let you specify "how to do". 
That is, you just specify your requirement for a processed result that has to be obtained from a "set of data" , filtered by optional condition(s). 
Sometimes, the specification of the "sets" you like to retrieve data from may be obtained by using complex joins/subqueries/conditional case statements, 
but in the end, there is a set of data from which the resultant set has to be obtained. 
You never have to specify "how" the data retrieval operation has to be implemented internally. 
You never have to specify how to implement the "joining operation" internally either. 
Also, you don't have to specify how to apply a filter condition against the rows. */

/* As per the inforamtion we can see the SQL is a set-based programming and python is a procedural programming. */ 







