--1. List all customers who live in Texas (use JOINs)
select * from address where district = 'Texas';
SELECT * FROM city WHERE city = 'Texas';
select * from country where country = 'United States';


SELECT customer.*
FROM customer
full JOIN address ON customer.address_id = address.address_id
full JOIN city ON address.city_id = city.city_id
full JOIN country ON city.country_id = country.country_id
WHERE country.country = 'United States'AND address.district = 'Texas';



--2. Get all payments above $6.99 with the Customer's Full Name
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS "Customer Name", payment.amount
FROM customer
full JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;
--order by amount asc;


--3. Show all customers names who have made payments over $175(use subqueries)
--SELECT amount
--FROM payment
--ORDER BY amount DESC;

SELECT CONCAT(first_name, ' ', last_name) AS "Customer Name"
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);



--4. List all customers that live in Nepal (use the city table)
SELECT customer.*
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

--5. Which staff member had the most transactions?
SELECT staff_id, COUNT(*) AS "Transaction Count"
FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;

--6. How many movies of each rating are there?
SELECT rating, COUNT(*) AS "Movie Count"
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT CONCAT(first_name, ' ', last_name) AS "Customer Name"
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

--8. How many free rentals did our stores give away?
SELECT COUNT(*) AS "Total Free Rentals"
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
WHERE inventory.store_id = store_id
AND DATE_PART('day', return_date - rental_date) = 0;





