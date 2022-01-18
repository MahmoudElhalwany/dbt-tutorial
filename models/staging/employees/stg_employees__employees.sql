with

source as (

  select * from {{ source('dbt_employees', 'employees') }}

),

transformed as (

  select

   emp_no,
   gender as emp_gender,
   hire_date as emp_hire_date,
   first_name || ' ' || last_name as emp_name,
   birth_date as emp_birth_date

   from source

)

select * from transformed
