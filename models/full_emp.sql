with
emp_salary as (

  select * from {{ ref('int_emp_salary') }}

),

emp_dept as (

  select * from {{ ref('int_emp_departments') }}

),

full_emp as (

  select *
   from emp_salary
   inner join emp_dept
   on emp_salary.emp_no == emp_dept.emp_no

)

select * from full_emp
