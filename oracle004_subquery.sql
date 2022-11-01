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
                WHERE first_name = 'Bruce')
ORDER BY e.salary;

-- Steven와 같은 부서에서 근무하는 사원의 이름, 급여, 입사일을 출력하시오(in)
SELECT e.first_name, e.salary, e.hire_date
FROM employees e

WHERE department_id IN(
                         SELECT department_id
                         FROM employees
                         WHERE first_name = 'Steven'
                       );

-- 부서별로 가장 급여를 많이 받는 사원이름, 부서번호, 급여를 출력하시오 (in)
SELECT e.first_name, e.department_id, e.salary
FROM employees e
WHERE (e.department_id, e.salary) IN ( --정렬이 두개이면, in안에서 나오는 값도 두개
                                       SELECT department_id, max(salary)
                                       FROM employees
                                       GROUP BY department_id -- where절에서 order by 사용불가 / from 절에서는 order by 사용가능
                                       );
ORDER BY e.department_id;

-- 30부서에 소속된 모든 사원들의 급여보다 더 많은 급여를 받는 사원이름, 급여, 입사일을 출력하시오(ALL)
-- 서브쿼리에서 max()함수를 사용하지 않는다.
SELECT salary
FROM employees
WHERE department_id=30;

SELECT first_name, salary, hire_date
FROM employees
WHERE salary >ALL( 
                    SELECT salary
                    FROM employees
                    WHERE department_id=30 -- 최대 : 11000
                    );
                 
-- 30부서 사원들이 받은 최저급여보다 높은 급여를 받는 사원이름, 급여, 입사일을 출력하시오(ANY)
-- 서브쿼리에서 min()함수를 사용하지 않는다.
SELECT first_name, salary, hire_date
FROM employees
WHERE salary > ANY( 
                    SELECT salary
                    FROM employees
                    WHERE department_id=30 -- 최저 : 2500
                    )
ORDER BY salary;

-- 20부서 사원이 있으면 사람들의 사원명, 입사일, 급여, 부서번호를 출력하시오
SELECT first_name, hire_date, salary, department_id
FROM employees
WHERE EXISTS ( -- 존재하면 true (값을 가지고 옴) 없으면 false (값을 가지고 오지 않음)
                SELECT department_id
                FROM employees
                WHERE department_id = 20
                ); -- 상관관계 쿼리 처리할 때 사용 /상관관계쿼리 :  메인쿼리에서 사용하는 컬럼을 서브쿼리에서 참조하는 것
                
-- 사원이 있는 부서만 출력하시오
SELECT count(*)
FROM departments; /*총부서 27개*/

SELECT department_id, department_name
FROM departments
WHERE department_id IN (
                        SELECT distinct department_id
                        FROM employees
                        WHERE department_id IS NOT NULL
                        --GROUP BY department_id --중복제거용
                         );

SELECT department_id, department_name
FROM departments d
WHERE EXISTS (
                SELECT 1 -- 임의의 값을 넣어줌
                FROM employees e
                WHERE e.department_id = d.department_id
              );