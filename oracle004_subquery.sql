/*==============================================================================
서브쿼리
1. 스칼라 쿼리 : SELECT
2. 인라인 뷰 : FROM
3. 서브쿼리 : WHERE
==============================================================================*/
-- 90번 부서에 근무하는 Lex 사원의 정보를 출력하시오.
SELECT * 
FROM employees
WHERE department_id = 90
AND first_name = 'Lex';

-- 90번 부서에 근무하는 Lex 사원의 근무하는 부서명을 출력하시오.
SELECT department_name
FROM departments
WHERE department_id = 90;

-- 'Lex'가 근무하는 부서명을 출력하시오
SELECT department_id
FROM employees
WHERE first_name = 'Lex'; --90

SELECT department_name
FROM departments
WHERE department_id = 90;

SELECT d.department_name
FROM employees e, departments d
WHERE e.department_id =  d.department_id
AND e.first_name='Lex';

SELECT department_name
FROM departments
WHERE department_id = (
                        SELECT department_id -- 여러개가 나온다면 SELECT 뒤에 DISTINCT 넣어서 중복제거
                        FROM employees
                        WHERE first_name = 'Lex'
                        ); --서브쿼리 / 서브쿼리가 있으면 서브쿼리먼저 수행 / 서브쿼리는 소괄호 안에 써주기
                        
-- Lex와 동일한 업무(job_id)를 가진 사원의 이름(first_name), 업무명(job_title), 입사일(hire_date)을 출력하시오
SELECT e.first_name, j.job_title, e.hire_date
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.job_id =   (
                    SELECT job_id
                    FROM employees
                    WHERE first_name = 'Lex');
                    
-- IT 근무하는 사원이름(first_name), 부서번호을 출력하시오
SELECT first_name, department_id
FROM  employees 
WHERE department_id = (
                        SELECT department_id
                        FROM departments
                        WHERE department_name = 'IT'
                        );
                        
-- 'Bruce'보다 급여를 많이 받은 사원이름(first_name), 부서명, 급여를 출력하시오
-- 서브쿼리가 하나일때에는 비교연산자 사용가능
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND salary > (
                SELECT salary
                FROM employees
                WHERE first_name = 'Bruce');