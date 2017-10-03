--Task 1
alter table E_OWNERS
modify id int (38) not null;
  
--Task 2
insert into E_OWNERS
values (12345678, 'James', 'Fowler')

insert into E_OWNERS
values (87654321, 'Gertrud', 'Menzies')

--Task 3
ALTER TABLE E_OWNERS
ADD emailaddresses varchar2 (64);

--Task 4
create table E_VET_BILLS_COPY as select * from E_VET_BILLS;

--Task 5
alter table E_VET_BILLS_COPY 
rename to E_VAT;

--Task 6
alter table E_VAT
add vat_percent number (4,2);

--Task 7
drop table E_VAT;