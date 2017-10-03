--Task 1
select count (*) from E_OWNERS;


--Task 2
update E_OWNERS
set first_name = 'Roberto', last_name = 'Bloggs'
where id = 111;

update E_OWNERS
set first_name = 'Michelle', last_name = 'McDonald'
where id = 112;

update E_OWNERS
set first_name = 'Joe', last_name = 'Campbell'
where id = 113;

update E_OWNERS
set first_name = 'Fiona', last_name = 'Johnstone'
where id = 114;


--Task 3
select * from E_OWNERS
where id between 111 and 114;


--Task 4
insert into E_OWNER_INTERESTS
values (201, 5)

insert into E_OWNER_INTERESTS
values (202, 5)

select * from E_OWNER_INTERESTS
where E_OWNER_id between 201 and 202;


--Task 5
select
E_OWNERS.id as "Owner ID",
E_OWNERS.first_name,
E_OWNERS.last_name,
E_INTERESTS.description as "Interests"

from E_OWNER_INTERESTS
join E_OWNERS on (E_OWNERS.id = E_OWNER_INTERESTS.E_OWNER_id)
join E_INTERESTS on (E_INTERESTS.id = E_OWNER_INTERESTS.E_INTEREST_id)

order by E_OWNERS.id asc;


--Task 6
select
E_OWNERS.id as "Owner ID",
E_OWNERS.first_name || ' ' || E_OWNERS.last_name as "Full Name",
E_INTERESTS.description as "Interests"

from E_OWNER_INTERESTS
join E_OWNERS on (E_OWNERS.id = E_OWNER_INTERESTS.E_OWNER_id)
join E_INTERESTS on (E_INTERESTS.id = E_OWNER_INTERESTS.E_INTEREST_id)

order by E_OWNERS.id asc;


--Task 7
select E_OWNER_id, sum (amount) from E_VET_BILLS

group by E_OWNER_id
order by sum (amount) desc;


--Task 8
select
sum (amount),
avg (amount),
stddev (amount)
from E_VET_BILLS


--Task 9
select
round(sum (amount), 2) as "Grand Total",
round(avg (amount), 2) as "Average Bill",
round(stddev (amount), 3) as "Standard Deviation"
from E_VET_BILLS


--Task 10
select
E_OWNERS.first_name,
E_OWNERS.last_name,
E_SPECIES.species,
E_PETS.name

from E_OWNERS
join E_SPECIES on (E_OWNERS.id = E_SPECIES.id)
join E_PETS on (E_OWNERS.id = E_PETS.id);

order by first_name asc, species desc;


--Task 11
create table E_OWNERS_COPY as select * from E_OWNERS;

delete from E_OWNERS_COPY
where id < 100 or id > 999;


--Task 12
update E_OWNERS_COPY
set emailaddresses = lower(first_name) || '.' || lower(last_name) || '@pets.org.uk';


select id,
lower(first_name) || '.' || lower(last_name) || '@pets.org.uk'
as "Full emailaddresses"
from E_OWNERS;

