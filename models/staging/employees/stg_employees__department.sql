with

source as (

  select * from {{ source('dbt_employees', 'departments') }}

),

transformed as (

  select dept_no,
   dept_name
   from source

)



select * from transformed
