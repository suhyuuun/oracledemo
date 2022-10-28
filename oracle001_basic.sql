SELECT first_name
FROM employees;

-- 주석처리 (하이픈 두개)
-- 도구 > 환경설정 > 코드편집기 > 글꼴 > 크기 조정가능
-- ctrl + enter : 실행
-- TAB : 테이블보이게 하는 명령어

SELECT * FROM employees;
SELECT * FROM TAB; 

/*
컬럼명, 데이블명에 별칭(alias)을 지정할 수 있다.
별칭(alias)에 공백이 있을 때는 " "(쌍따옴표)를 지정한다.
*/
SELECT salary, salary*10 AS bonus
FROM employees;
-- SELECT : 컬럼 FROM : 테이블

SELECT salary, salary*10 AS "b o n u s"
FROM employees;

-- King님의 급여는 24000입니다.
SELECT last_name || '님의 급여는' || salary ||'입니다.' AS name
FROM employees;

-- DISTINCT 중복제거를 한 후 출력해주는 명령어이다.
SELECT DISTINCT first_name
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;

/*
first_name  last_name
sunder       Abel
sunder       Abel
sunder       Abde
*/

/* 외우기!!
-- SELECT 입력순서
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value' -- 조건
GROUP BY colum_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

-- SELECT 해석순서
FROM table_name
WHERE column_name='value' -- 조건
GROUP BY colum_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/

-- employees테이블에서 salary이 3000미만 일때의 first_name, salary을 출력하라
SELECT first_name, salary
FROM employees
WHERE salary < 3000; --WHERE은 조건이기때문에 연산자 넣어줘야함

-- employees테이블에서 first_name컬럼의 값이 'David'일때의 first_name, salary을 출력하라
SELECT first_name, salary
FROM employees
WHERE first_name = 'David'; --대입의 의미가 아닌 같다의 의미로 사용 WHERE은 비교연산자, 논리연산자로 사용

-- employees테이블에서 first_name컬럼의 값이 'David'가 아닐때의 first_name, salary을 출력하라
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David'; -- <>도 아닐때를 의미함 

-- AND(and) OR(or)
-- employees테이블에서 salary이 3000,9000,17000일때 first_name, hire_date, salary을 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 OR salary = 9000 OR salary = 17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 17000);

-- employees테이블에서 salary이 3000부터 5000까지 일때의 first_name, hire_date, salary을 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000; --BETWEEN은 지정한 값 포함 3000이상 5000이하

-- employees테이블에서 job_id가 'IT_PROG'이 아닐때 first_name, email, job을 출력하라
SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

-- 자주 쓰이는 방법은 아님
SELECT first_name, email, job_id
FROM employees
WHERE job_id ^= 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT job_id = 'IT_PROG';

-- employees테이블에서 salary이 3000,9000,17000이 아닐때 first_name, hire_date, salary을 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary = 3000 OR salary = 9000 OR salary = 17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000, 9000, 17000);

-- employees테이블에서 salary이 3000부터 5000까지 아닐때의 first_name, hire_date, salary을 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary  NOT BETWEEN 3000 AND 5000; --BETWEEN은 지정한 값 포함 3000이상 5000이하

-- employees 테이블에서 commission_pct이 null일때 first_name, salary, comission_pct을 출력하라.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- employees 테이블에서 commission_pct이 null이 아닐때 first_name, salary, comission_pct을 출력하라.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees 테이블에서 first_name에 'der'이 포함이된 first_name, salary, email을 출력하라
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%'; -- 정규식의 *과 비슷한 의미로 사용됨

-- employees테이블에서 first_name의 값 중 'A'로 시작하고 두번째문자는 임의 문자이면 'exander'로 끝나는 first_name, salary, email을 출력하라
-- 언더바(_) 사용
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';

/*
WHERE절에서 사용된 연산자 3가지 종류
1. 비교연산자 : = => < =< != <> ^=
2. SQL연산자 : BETWEEN a AND b, IN, LIKE, IS NULL
3. 논리연산자 : AND, OR, NOT

우선순위
1. 괄호()
2. NOT 연산자
3. 비교연산자, SQL연산자
4. AND
5. OR
*/

-- employees 테이블에서 job_id을 오름차순으로 first_name, email, job을 출력하시오
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id; -- ASC는 생략 가능

-- employees 테이블에서 department_id를 오름차순하고 first_name을 내림차순으로 department_id, first_name, salary를 출력하시오
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id, first_name DESC; -- department의 중복(오른차순)이 될때 first_name으로(내림차순) 순서를 정함

-- employees 테이블에서 가장 최근 입사 순으로 사원의 first_name, salary, hire_date을 출력하시오
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

--employees테이블에서 업무(job_id)이 'FI_ACCOUNT'인 사원들의 급여(salary)가 높은 순으로 first_name, job_id, salary을 출력하시오
SELECT first_name, job_id, salary
FROM employees
WHERE job_id='FI_ACCOUNT'
ORDER BY salary DESC;

--필요에 따라 영역지정을 한 후에 ctrl + enter로 실행을 할 수 있다.


