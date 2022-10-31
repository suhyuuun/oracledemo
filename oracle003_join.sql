/*==============================================================================
join(조인)
1. 여러개의 테이블에서 원하는 데이터를 추출해주는 쿼리문이다.
2. join은 oracle제품에서 사용되는 oracle용 join이 있고
   모든 제품에서 공통적으로 사용되는 표준(ANSI)join이 있다.
==============================================================================*/

/*==============================================================================
1. equi join : 가장 많이 사용되는 조인방법 (innerjoin = equi join)
- 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여
  결과를 생성하는 방법이다.
==============================================================================*/

-- (1) oracle용 equi join
SELECT dept.department_id, first_name, job_id, department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

-- (2) ansi용 inner join
SELECT dept.department_id, first_name, job_id, department_name
FROM employees emp inner join departments dept
  ON emp.department_id = dept.department_id;

-- employees와 department테이블에서 사원번호(employee_id), 부서번호(department_id), 부서명(department_name)을 검색하세요.
SELECT emp.employee_id, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY emp.employee_id;

SELECT emp.employee_id, dept.department_id, dept.department_name
FROM employees emp inner join departments dept
  ON emp.department_id = dept.department_id
ORDER BY emp.employee_id;

-- employee와 jobs 테이블에서 사원번호(employee_id), 업무번호(job_id), 업무명(job_title)을 검색하세요
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY e.employee_id;

SELECT e.employee_id, j.job_id, j.job_title
FROM employees e inner join jobs j
ON e.job_id = j.job_id
ORDER BY e.employee_id;

-- job_id가 'FI_MGR'인 사원이 속한 급여(salary)의 최솟값(min_salary), 최대값(max_salary)을 출력하시오
SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.job_id = 'FI_MGR';
/*
 선행테이블(Driving table) - 후행테이블(Driven table) 
 1. 왼쪽 -> 오른쪽
 2. 자식 -> 부모
*/
SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e inner join jobs j
ON e.job_id = j.job_id
WHERE e.job_id = 'FI_MGR';



