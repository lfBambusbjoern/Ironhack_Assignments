## Part 1:

select count(film_id) as counts from inventory where film_id = (
select film_id from film where title = 'Hunchback Impossible');
## Part 2:
select title, length from film
where length > (
select avg(length) from film
);

## Part 3:
select concat(first_name, ' ', last_name) as Actor
from actor
where actor_id in (
select actor_id
from film_actor where film_id = (
select film_id from film
where title = 'ALONE TRIP'));

## Part 4:
select title as Title
from film where film_id in (
select film_id from film_category where category_id in (
select category_id from category where name = 'Family'));

## Part 5:
select concat(first_name, ' ', last_name) as Customer_Name, email
from customer where address_id in (
select address_id from address where city_id in (
select city_id from city where country_id in(
select country_id from country where country = 'Canada'))); 