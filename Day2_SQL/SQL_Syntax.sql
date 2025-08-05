#DDL statements
create table <table_name> (
	column1 datatype [constraints],
	column2 datatype [constraints],
	column3 datatype [constraints],
	.
	.
	columnn datatype [constraints]
	
);

create table employees (
	emp_id serial primary key,
	full_name varchar(100) not null,
	dept_id int,
	hire_date date default current_date,
	salary numeric(10,2) check (salary>=0)
);

alter table <table_name> add column <column_name data_type constraints>
alter table <table_name> drop column <column_name>
alter table <table_name> rename to <new_table_name>

alter table employees add column mobile_number int not null;
alter table employees drop column mobile_number;
alter table employees rename to tbl_employees;


drop table <table_name> cascade;
drop view <view_name>
drop function <function_name>
drop schema

#DML statements

insert into <table_name> (column1, column2, ...... columnn)
values (values1, values2, ......valuesn);

insert into employees(full_name, dept_id, hire_date, salary, mobile_number)
values ('Alex', 101, '2025-8-5', 25000, 1234);

insert into employees(full_name, dept_id, hire_date, salary, mobile_number)
values ('Romi', 201, NULL, 25000, 1234);


update table_name
set column1 = value1, column2=value2
where condition;

update employees
set hire_date='2024-1-30'
where full_name='Romi';

delete from <table_name>
where condition;

delete from employees
where full_name='Alex';

#DQL statements
select column1, column2
from table_name
where condition
order by column1
limit n;

select emp_id, full_name, dept_id, hire_date, salary, mobile_number
from employees
where salary>10000
order by hire_date desc, emp_id;

#TCL statements

grant select, insert, update, delete on table_name to user_name;
grant all priveleges on table_name to user_name;
grant all priveleges on database sql_db to user_name;

revoke select, insert, update, delete on table_name to user_name;
revoke all priveleges on table_name to user_name;
revoke all priveleges on database sql_db to user_name;




