drop table E_OWNERS cascade constraints;
drop table E_OWNER_INTERESTS cascade constraints;
drop table E_INTERESTS cascade constraints;
drop table E_PETS cascade constraints;
drop table E_SPECIES cascade constraints;
drop table E_VET_BILLS cascade constraints;

create table E_OWNERS (
	id number primary key not null,
	first_name varchar2 (32),
	last_name varchar2 (64) not null
);

create table E_INTERESTS (
	id number primary key not null,
	description varchar2 (32)
);

create table E_SPECIES (
	id number primary key not null,
	species varchar2 (64)
);

create table E_OWNER_INTERESTS (
	E_OWNER_id number references E_OWNERS(id),
	E_INTEREST_id number references E_INTERESTS(id)
);

create table E_PETS (
	id number primary key not null,
	name varchar2 (32),
	E_OWNER_id number references E_OWNERS(id),
	gender varchar2 (32),
	dob date,
	E_SPECIES_id number references E_SPECIES(id)
);

create table E_VET_BILLS (
	id number primary key not null,
	amount number (10,2) not null,
	billing_date date not null,
	E_OWNER_id number references E_OWNERS(id)
);

alter table E_OWNER_INTERESTS
add constraint pk_1
primary key (E_OWNER_id, E_INTEREST_id);