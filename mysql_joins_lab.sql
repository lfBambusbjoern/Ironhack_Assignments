## NUMBER OF FILMS PER CATEGORY:
select name as category_name, count(*) as num_films from category
inner join film_category using (category_id)
group by name order by num_films desc;

## DISPLAY THE FIRST AND LAST NAMES + ADDRESS OF EACH STAFF MEMBER
select staff.first_name, staff.last_name, address.address from address
inner join staff on staff.address_id = address.address_id;

## DISPLAY THE TOTAL AMOUNT RUNG UP BY EACH STAFF MEMBER IN 08/2005
select s.staff_id, concat(s.first_name,' ',s.last_name) as employee, sum(p.amount) as `total amount` from staff as s
inner join payment as p on s.staff_id = p.staff_id where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id;

## LIST EACH FILM AND NUMBER OF ACTORS WHO ARE LISTED FOR IT
select title as `film title`, count(actor_id) as `number of actors` from film
inner join film_actor on film.film_id = film_actor.film_id
group by film.film_id;

## LIST THE TOTAL PAID BY EACH CUSTOMER
select first_name, last_name, sum(amount) as "total amount paid" from customer
inner join payment on customer.customer_id = payment.customer_id
group by customer.customer_id order by last_name;

###################################################PT2###############################################

## PART 1
select store_id, city, country from store
join (address join (city join country using (country_id)) using (city_id)) using (address_id);

## PART 2
select store.store_id, round(sum(amount), 2) from store join (customer join (payment join rental using (rental_id)) on customer.customer_id = payment.customer_id) using (store_id)
group by store.store_id;

## PART 3
select category.name, avg(length) from film join film_category using (film_id)
join category using (category_id)
group by category.name order by avg(length) desc;

## PART 4
select category.name, avg(length) from film join film_category using (film_id)
join category using (category_id)
group by category.name order by avg(length) desc;

## PART 5
select title, count(*) as `rental frequency` from film
join (inventory join rental using (inventory_id)) using (film_id)
group by title order by `rental frequency` desc;

## PART 6
select name, category_id, sum(amount) as `gross revenue` from payment
join (rental join (inventory join (film_category join category using (category_id)) using (film_id)) using (inventory_id)) using (rental_id)
group by category_id order by `gross revenue` desc limit 5;

## PART 7
select film.film_id, film.title, store.store_id, inventory.inventory_id from inventory
join store using (store_id)
join film using (film_id) where film.title = 'Academy Dinosaur' and store.store_id = 1;

select inventory.inventory_id from inventory joinstore using (store_id)
join film using (film_id)
join rental using (inventory_id) where film.title = 'Academy Dinosaur' and store.store_id = 1 and not exists (select * from rental
where rental.inventory_id = inventory.inventory_id and rental.return_date is null);