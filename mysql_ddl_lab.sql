## Part 1:
select distinct release_year from film;

## Part 2:
select title from film where title like '%ARMAGEDDON%';

## Part 3:
select title from film where title like '%APOLLO';

## Part 4:
select title from film
order by length desc limit 10;
## Part 5:
select count(*) from film where special_features like '%Behind the Scenes%';

## Part 6:
alter table staff drop column picture;

## Part 7:
insert into staff(first_name, last_name, email, address_id, store_id, username) values ('TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'tammy')

## Part 8:
# customer_id
select customer_id from customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

# film_id
select film_id from film where title = 'ACADEMY DINOSAUR';

# get inventory_id
select inventory_id from inventory where film_id = 1;

# staff_id
select * from staff;

insert into rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), 1, 130,, 1);

## Part 9:
select * from customer
where active = 0;

drop table if exists deleted_users;

CREATE TABLE deleted_users (customer_id int UNIQUE NOT NULL,
email varchar(255) UNIQUE NOT NULL,
delete_date date)

insert into deleted_users
select customer_id, email, curdate() from customer where active = 0;
select * from deleted_users;

delete from customer where active = 0;

select * from customer where active = 0;
