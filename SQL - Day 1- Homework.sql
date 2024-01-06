--1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

--OR

SELECT COUNT(*) FROM actor WHERE last_name = 'Wahlberg';


--2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--OR

SELECT COUNT(*) FROM payment WHERE amount BETWEEN 3.99 AND 5.99;


--3. What film does the store have the most of? (search in inventory)
SELECT COUNT(film_id), film_id 
FROM inventory
group by film_id 
HAVING COUNT(film_id) > 0
order by film_id desc;

--OR

SELECT i.film_id, f.title, COUNT(i.inventory_id) as inventory_count
FROM inventory i
JOIN film f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title
ORDER BY film_id desc;


select *
from inventory;

--4. How many customers have the last name ‘William’?
SELECT last_name
FROM actor
WHERE last_name = 'William';

--OR

SELECT COUNT(*) FROM customer WHERE last_name = 'William';


--5. What store employee (get the id) sold the most rentals?
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having sum(amount) > 0
	order by sum (amount)
)

--OR

SELECT s.staff_id, COUNT(r.rental_id) AS rentals_count
from staff s
join payment p ON s.staff_id = p.staff_id
join rental r ON p.rental_id = r.rental_id
GROUP BY s.staff_id
ORDER BY COUNT(r.rental_id) desc;



select *
from inventory;

--6. How many different district names are there?
SELECT COUNT(DISTINCT district) FROM address;


--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY film_id desc;


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) FROM customer 
WHERE store_id = 1 
AND last_name LIKE '%es';


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT p.amount, COUNT(r.rental_id) AS rentals_count
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN customer c ON p.customer_id = c.customer_id
WHERE c.customer_id BETWEEN 380 AND 430
GROUP BY p.amount
HAVING COUNT(r.rental_id) > 250;


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT COUNT(DISTINCT rating) AS num_rating_categories, rating
FROM film
GROUP BY rating
ORDER BY COUNT(*) desc;












