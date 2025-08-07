--primary and foreign key
create table table_name(
	column_name data_type primary key
)

create table table_name(
	departmen_id data_type,
	foreign key (departmen_id) references parent_table(primary_key_column)
)


--aliases
select column_name as alias_name
from table_name

select emp_name as employee,
	salary*12 as annual_salary
from employees;


--is clause
select * from employees where age is not null;
select * from employees where age is null;


--like and Ilike clause
select * from employees where emp_name Ilike '%a%'

--In clause
select * from employees where dept_id in (1,2,3)

select * from employees where dept_id =1 or dept_id=2 or dept_id=3

--between clause
select * from employees where age between 25 and 35;

-- case when

select emp_name,
	age,
	case
		when age>=35 then 'Senior'
		when age between 25 and 34 then 'Mid-Level'
		else 'Junior'
	end as level
from employees;

--aggregations
select agg_func(column_name) from table_name;

select sum(salary), avg(salary), max(age), min(age), count(*)
from employees


select dept_id, 
case
		when age>=35 then 'Senior'
		when age between 25 and 34 then 'Mid-Level'
		else 'Junior'
	end as level,
	avg(salary)
from employees
group by dept_id, case
		when age>=35 then 'Senior'
		when age between 25 and 34 then 'Mid-Level'
		else 'Junior'
	end

	
	
select dept_id, count(*)
from employees
group by dept_id 
having count(*) > 1;


select * from employees
order by dept_id, hire_date desc ;

select * from employees
order by 5, 6 desc ;


--joins in sql

--inner join - only matching rows
select e.emp_name, d.dept_name
from employees e
inner join departments d on e.dept_id=d.dept_id

select * from employees;
select * from departments;

-- left join(or left outer join) - all rows from left + matches from right
select e.emp_name, d.dept_name
from employees e
left join departments d on e.dept_id=d.dept_id


--right join -- all rows from right + matches from left
select e.emp_name, d.dept_name
from employees e
right join departments d on e.dept_id=d.dept_id


-- full outer join -- all records from both tables
select e.emp_name, d.dept_name
from employees e
full outer join departments d on e.dept_id=d.dept_id


--cross join -- every combination
select e.emp_name, d.dept_name
from employees e
cross join departments d


--set operations
--union combines and removes duplicates
select emp_name from employees  
union 
select dept_name from departments;

--union all combines and keeps duplicates
select emp_name from employees  
union all
select dept_name from departments;

--intersect returns common rows
select emp_name from employees  
intersect
select dept_name from departments;

--except returns values from first, but not in second
select dept_name from departments
except
select emp_name from employees;


	





