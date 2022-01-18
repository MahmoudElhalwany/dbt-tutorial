with


dept_emp as (

  select * from {{ ref('stg_employees__dept_emp') }}

),

departments as (

  select * from {{ ref('stg_employees__department') }}
),

last_emp_dept_date as (

  select max(emp_dept_to_date) emp_dept_to_date,
  emp_no
  from dept_emp
  group by emp_no

),

cur_emp_dept as (

  select dept_emp.emp_no,
   dept_emp.dept_no,
   dept_emp.emp_dept_from_date,
   dept_emp.emp_dept_to_date
   from dept_emp
   inner join last_emp_dept_date
   on dept_emp.emp_dept_to_date == last_emp_dept_date.emp_dept_to_date
   and dept_emp.emp_no == last_emp_dept_date.emp_no

),

full_cur_emp_dept as (

  select cur_emp_dept.emp_no,
   cur_emp_dept.dept_no,
   departments.dept_name,
   cur_emp_dept.emp_dept_from_date,
   cur_emp_dept.emp_dept_to_date
   from cur_emp_dept
   left join departments
   on cur_emp_dept.dept_no == departments.dept_no
)

select * from cur_emp_dept
