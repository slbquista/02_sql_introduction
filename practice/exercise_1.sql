drop table A1_USERS cascade constraints;
drop table A1_DISCUSSIONS cascade constraints;
drop table A1_PARTICIPATION cascade constraints;

create table A1_USERS (
	userid number primary key not null,
	first_name  varchar2(32) not null,
	last_name varchar2(32) not null
);

create table A1_DISCUSSIONS (
	discid number primary key not null,
	dtitle varchar2(128) not null
);

create table A1_PARTICIPATION (
	userid number references A1_USERS(userid),
	discid number references A1_DISCUSSIONS(discid),
	posting varchar2(256) not null

);

alter table A1_PARTICIPATION
add constraint pk_3
primary key (userid, discid);