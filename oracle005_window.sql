/*==============================================================================
ROLLUP( )함수, CUBE( )함수
==============================================================================*/
SELECT department_id, job_id, count(*)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

/*==============================================================================
ROLLUP(column1, column2)
(column1, colum2)
(column1)
()

ROLLUP(department_id, job_id)
20	MK_MAN	1   -- 그룹
20	MK_REP	1   -- 그룹
20          2   -- 그룹
            107 -- 총계
==============================================================================*/

SELECT department_id, count(*)
FROM employees
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

SELECT department_id, job_id, count(*)
FROM employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id;

/*==============================================================================
CUBE( )함수
CUBE(column1, column2)
    (column1, column2)
    (column1)
    (column2)
    ()
CUBE(department_id, job_id)
20	MK_MAN	1   -- 그룹
20	MK_REP	1   -- 그룹
20          2   -- 소계
    MK_MAN  1   -- 소계
    MK_REP  1   -- 소계
                -- 총계
==============================================================================*/

SELECT department_id, count(*)
FROM employees
GROUP BY CUBE(department_id)
ORDER BY department_id;

SELECT department_id, job_id, count(*)
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id, job_id;

-- ()로 묶어주면 하나로 취급하고 출력
SELECT department_id, job_id, count(*)
FROM employees
GROUP BY CUBE((department_id, job_id))
ORDER BY department_id, job_id;

/*==============================================================================
GROUPING SETS ( )함수
    각각에 대한 통계가 나옴
    합계는 나오지 않음
==============================================================================*/

SELECT department_id, job_id, count(*)
FROM employees
GROUP BY GROUPING SETS(department_id, job_id)
ORDER BY department_id, job_id;

-- 개별적으로 주면 나열과 같아짐
SELECT department_id, job_id, count(*)
FROM employees
GROUP BY GROUPING SETS(department_id), GROUPING SETS(job_id)
ORDER BY department_id, job_id;

--SELECT CASE department_id 
--        WHEN 10 THEN 'A'  
--        WHEN 20 THEN 'B'
--        ELSE 'C'
--        END AS "alias"
--FROM employees;

SELECT CASE GROUPING(d.department_name)
            WHEN 1 THEN 'ALL Departments' -- 1 : 집계이면
            ELSE d.department_name
        END AS "DNAME",
        CASE GROUPING(e.job_id)
            WHEN 1 THEN 'ALL Jobs'
            ELSE e.job_id
        END AS "JOB",
        /*department_name, job_id,*/
        count(*) AS "Total sal",
        sum(e.salary) AS "Total sal"
FROM employees e, departments d
WHERE e.department_id = d.department_id
/*GROUP BY d.department_name, rollup(job_id);*/
GROUP BY rollup(d.department_name,job_id);

/*==============================================================================
그룹내 순위관련함수
RANK( ) OVER( ) : 특정 컬럼에 대한 순위를 구하는 함수로 동일한 값에 대해서는 동일한 순위를 준다.
DENSE( ) OVER( ) : 동일한 순위를 하나의 건수로 취급한다.
ROW( ) OVER( ) : 동일한 값이라도 고유한 순위를 부여한다.
==============================================================================*/

