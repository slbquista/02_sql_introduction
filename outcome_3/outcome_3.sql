-- Task 1
create or replace view Task_1 as
SELECT
    to_char(sysdate,'DD/MM/YYYY') as "Report Date",
    sum(amount) as "Vet Bills",
    sum(amount) * 0.20 as "VAT",
    sum(amount) + (sum(AMOUNT) * 0.20) as "Grand Total"
FROM E_VET_BILLS;

select * from Task_1;


-- Task 2
create or replace view Task_2 (c1, c2, c3, c4) as
SELECT
	e_owner_id as "Owner ID",
	sum(amount) as "Total Amount",
	sum(amount) * 0.02 as "Discount Recieved",
	sum(amount) - (sum(amount) * 0.02) as "Total Less Discount"
FROM e_vet_bills
group by e_owner_id;

select * from Task_2
order by c3 asc;


-- Task 3

create or replace view Task_3 (c1, c2, c3, c4) as

select
	1,
	to_char(e_owner_id),
	to_char(billing_date, 'DD/MM/YYYY'),
	amount
from e_vet_bills

union

select
	2,
	to_char('Total for owner ' || e_owner_id),
	null,
	sum(amount)
from e_vet_bills
group by e_owner_id

union

select
	3,
	to_char('Grand Total'),
	null,
	sum(amount)
from e_vet_bills

select c1, c2, c3, c4 from Task_3;