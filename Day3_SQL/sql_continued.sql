--windows functions
--syntax
-- function() over(partition by column_name order by column_name asc|desc)

--row numbering by salary
select emp_name, dept_id, salary,
	row_number() over(order by salary desc) as row_num
from employees;

--rank within each department
select emp_name, dept_id, salary,
	rank() over(partition by dept_id order by salary desc) as row_num
from employees;

--show current and previous salary
select emp_name, salary,
	lag(salary) over(order by hire_date) as prev_salary
from employees

select emp_name, salary,
	lead(salary) over(order by hire_date) as next_salary
from employees

--running total of salaries
select emp_name, dept_id, salary,
	sum(salary) over(order by hire_date desc) as running_total
from employees;


--view and subqueries
select * from employees where dept_id in (1,2,3)
--in subquery
select * from employees where dept_id in (
	select dept_id from departments where dept_name='Engineering'
)

--scalar subquery
select * from employees where salary = (select max(salary) from employees)

--exists subquery
select * from employees e
where exists(
	select 1 from departments d
	where d.dept_id=e.dept_id
	and d.dept_name='Engineering'
)

--views
--syntax
create view view_name as
	select ...... from ...... where .....
	
create or replace view vw_high_earners as
select emp_name, salary from employees where salary > 70000;

select * from vw_high_earners;

create or replace view view_name as
sql_statments


--functions
--syntax
create function function_name(param_name param_type)
returns return_type
language plpgsql
as $$
declare
	--devlare variables with data types
begin
	--function logic
	return value;
end;
$$;

--how to call this function
select function_name(column_name) from table_name

create function fn_get_employee_tenure(emp int)
returns int
language plpgsql
as $$
declare
	hire_date_val date;
begin
	select hire_date into hire_date_val from employees where emp_id = emp;
	return extract(year from age(current_date, hire_date_val));
end;
$$;

select emp_name, fn_get_employee_tenure(emp_id) as tenure_years from employees;


--fucntion returning table
create or replace function fn_get_employees_by_department(p_dept_id int)
returns table(
	emp_id int,
	emp_name varchar,
	salary int
) 
as $$
begin
	return query
	select e.emp_id, e.emp_name, e.salary
	from employees e 
	where e.dept_id=p_dept_id;
end;
$$ language plpgsql;

select * from fn_get_employees_by_department(2);

--procedures
--syntax
create or replace procedure procedure_name(param_name param_type)
language plpgsql
as $$
begin
	--procedure tasks
end;
$$;

--to execute procedure
call procedure_name(parameter);


create procedure sp_give_raise(percent_increase numeric)
language plpgsql
as $$
begin
	update employees
	set salary = salary + (salary * percent_increase/100);
end;
$$;

call sp_give_raise(13)

select * from  employees;

/* naming conventions for database objects
 table (tbl_)
 view (vw_)
 function (fn_ / ufn_)
 procedures (sp_)
 primary key (pk_)
 foreing key (fk_)
 check (ck_)
 unique (uq_)
 index (idx_ / ix_)
 trigger (trg_)
 sequence (seq_) */



































