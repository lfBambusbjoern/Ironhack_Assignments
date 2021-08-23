# Lab 1:
# Q3: 
# SELECT title FROM sakila.film
# Q4: 
#SELECT * FROM sakila.language as l
# Q5.1: 
#SELECT * FROM sakila.address (len = 605 = number of stores?)
# Q5.2: 
#SELECT * FROM sakila.staff (Mike Hillyer, Jon Stephens = 2)
# Q5.3: 
#SELECT first_name FROM sakila.staff

#Lab 2:
# Q1: SELECT * FROM bank.account WHERE district_id  = 1 LIMIT 0,5
# Q2: SELECT * FROM bank.client WHERE district_id = 72 /n ORDER BY district_id DESC LIMIT 1
# Q3: SELECT * FROM bank.loan ORDER BY amount LIMIT 0,3
# Q4: SELECT DISTINCT status FROM bank.loan ORDER BY status
# Q5: SELECT amount, account_id FROM bank.loan order by amount desc limit 0,1
# Q6: SELECT account_id, amount FROM bank.loan ORDER BY amount LIMIT 5
# Q7: SELECT account_id, amount, duration FROM bank.loan where duration = 60 ORDER BY amount LIMIT 0,5
# Q8: SELECT DISTINCT k_symbol FROM bank.order
# Q9: SELECT order_id FROM bank.order where account_id = 34
# Q10: SELECT DISTINCT account_id FROM bank.order where order_id > 29540 and order_id < 29560
# Q11: SELECT amount FROM bank.order where account_to = 30067122
# Q12:  SELECT trans_id, date, type, amount FROM bank.trans where account_id = 793 Order by date Limit 0,10
# Q13: SELECT client_id FROM bank.client where district_id < 10 ORDER BY district_id
# Q14: SELECT type, COUNT(type) AS `value_occurrence` FROM card GROUP BY type ORDER BY `value_occurrence` DESC