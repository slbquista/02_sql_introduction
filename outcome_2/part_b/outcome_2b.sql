--Task 1
select
min (amount) as "Minimum",
max (amount) as "Maximum",
avg (amount) as "Average"
from e_vet_bills;


--Task 2
select sum (amount) as "Vet Bills" from e_vet_bills;


--Task 3
select concat(concat(first_name, ' '), upper(last_name))
as "Owners 2017"
from e_owners;


--Task 4
select
	e_owners.id,
	e_owners.last_name as "Last Name",
	sum(e_vet_bills.amount) as "Vet Bills",
	sum(e_vet_bills.amount * 0.04) as "Discount",
	sum(e_vet_bills.amount - (e_vet_bills.amount * 0.04)) as "Vet Bills - Discount"
from e_owners

join e_vet_bills on (e_owners.id = e_vet_bills.e_owner_id)

group by e_owners.ID, e_owners.last_name;


--Task 5
create table e_owners_copy as select * from e_owners;
describe e_owners_copy;
select * from e_owners_copy;


--Task 6
drop table e_owners_copy;