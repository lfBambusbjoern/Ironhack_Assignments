## Part 1:

select last_name from actor group by last_name having count(*) = 1;

## Part 2:
select last_name from actor group by last_name having count(*) > 1;

##Part 3:
select staff_id, count(*) from rental group by staff_id;

## Part 4:
select release_year, count(*) as number_films from film group by release_year order by release_year;

## Part 5:

select rating, count(*) as number_films from film group by rating;

## Part 6:

select rating, round(avg(length),2) as avg_duration from film
group by rating order by avg_duration desc;

## Part 7:

select rating, round(avg(length),2) as avg_duration from film
group by rating having avg_duration > 120 order by avg_duration desc;