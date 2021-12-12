# 1. find all the people that are male and over 18
select * 
from person
where gender = 'male' and age > 18; 

# 2. Find all names of people that are female and over 30
select name 
from person
where gender = 'female' and age > 30;

# 3. find the names of people that are male, over 20, and eats cheese
select person.name
from person, eats
where person.name = eats.name and age > 20 and pizza = 'cheese' and gender= 'male';

#  4. Find all pizzerias that do not serve a pizza that cost $9 or more (Find all pizzerias that serve pizza that is less than $9)
select distinct pizzeria
from serves
where pizzeria not in (
	select pizzeria
	from serves
	where price >=9
   )
;

# 5. Find only the pizzerias that serve pizza for $9 or more
Select distinct pizzeria
from serves
where pizzeria not in (
	select pizzeria
    from serves
	where price < 9
	)
; 
 
# 6. Find any pizza that was eaten by a female over the age of 20 and cost more than $9 (doesn't have to be more than $9)
select distinct eats.pizza
from eats
inner join person ON person.name = eats.name
inner join serves on eats.pizza = serves.pizza
where gender = 'female' and age > 20 and price > 9;

# 7. Find the Names of people who have eaten at least once at Dominos but are not frequent at Dominos
Select distinct eats.name
from person, eats, serves
where (eats.pizza= 'cheese' or eats.pizza= 'mushroom') and (price = 9.25 or price = price = 11.00)
and eats.name not in  (
	select name
	from frequents
	where pizzeria = 'Dominos'
    )
;

# 8. Find every type of pizza that was eaten by someone younger than 24
select distinct pizza 
from eats
where eats.name IN (
	select person.name
    from person
    where age < 24
	)
;

