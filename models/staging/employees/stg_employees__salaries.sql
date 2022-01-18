with

source as (

  select * from {{ source('dbt_employees', 'salaries') }}

),

transformed as (

  select

   emp_no,
   salary as emp_salary,
   from_date as emp_salary_from_date,
   to_date as emp_salary_to_date

   from source

)

select * from transformed
