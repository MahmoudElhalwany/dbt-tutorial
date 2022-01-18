with

source as (

  select * from {{ source('dbt_employees', 'dept_emp') }}

),

transformed as (

  select

   emp_no,
   dept_no,
   from_date as emp_dept_from_date,
   to_date as emp_dept_to_date
   from source

)

select * from transformed
