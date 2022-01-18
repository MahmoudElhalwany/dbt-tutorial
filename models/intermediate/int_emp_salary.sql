with


emp_salary as (

  select * from {{ ref('stg_employees__salaries') }}

),

employees as (

  select * from {{ ref('stg_employees__employees') }}
),

last_emp_salary_date as (

  select max(emp_salary_to_date) emp_salary_to_date,
  emp_no
  from emp_salary
  group by emp_no

),

cur_emp_salary as (

  select emp_salary.emp_no,
   emp_salary.emp_salary,
   emp_salary.emp_salary_from_date,
   emp_salary.emp_salary_to_date
   from emp_salary
   inner join last_emp_salary_date
   on emp_salary.emp_salary_to_date == last_emp_salary_date.emp_salary_to_date
   and emp_salary.emp_no == last_emp_salary_date.emp_no

)



select * from cur_emp_salary
