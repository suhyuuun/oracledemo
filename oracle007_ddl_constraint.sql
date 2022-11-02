/*==============================================================================
테이블 구조 정의 
CREATE TABLE table_name(
    column_name datatype,
    column_name datatype
    );
    
자료형(datatype)
varchar2 - 가변길이 문자를 저장
char - 고정길이 문자를 저장
number(m) - 정수저장
number(m, n) - 실수저장
date - 날짜 저장
datetime - 날짜 시간 저장
==============================================================================*/

CREATE TABLE student(
    name varchar2(20), -- 바이트(영문, 특수문자 - 1byte / 한글 - 3byte)
    age number(3), -- 자릿수
    avg number(5, 2), -- 5는 전체자릿수, 2은 소수점 자릿수
    hire date
    );
    
SELECT * FROM student;

-- 정상 삽입
INSERT INTO student(name, age, avg, hire)
VALUES('홍길동', 30, 97.85, sysdate);

SELECT * FROM student;

-- '박차고 나온 세상에' : 크기 초과(20바이트까지만 가능)
-- ORA-12899: value too large for column "HR"."STUDENT"."NAME" (actual: 26, maximum: 20)
INSERT INTO student(name, age, avg, hire)
VALUES ('박차고 나온 세상에', 30, 97.85, sysdate);

-- 3000 : 크기초과(3자리까지만 가능 - 0~999) 
-- ORA-01438: value larger than specified precision allowed for this column
INSERT INTO student(name, age, avg, hire)
VALUES('홍길동', 3000, 97.85, sysdate);

-- 2997.85 : 크기초과(5자리까지만 가능) - 소수점은 포함하지 않음
-- ORA-01438: value larger than specified precision allowed for this column
INSERT INTO student(name, age, avg, hire)
VALUES('홍길동', 30, 2997.85, sysdate);

-- 297.8589: 소수점 이하는 반올림해서 삽입
INSERT INTO student(name, age, avg, hire)
VALUES('홍길동', 30, 297.8589, sysdate);

-- 소수점자리수는 3번째 자리에서 반올림
SELECT * FROM student;

-- 소수점2자리로 무조건 계산을 한다. 즉 정수는 3자리까지만 허용 
-- ORA-01438: value larger than specified precision allowed for this column
INSERT INTO student(name, age, avg, hire)
VALUES('홍길동', 30, 5297.8, sysdate);

/*==============================================================================
ALTER
 객체(table)의 구조를 변경해주는 명령어이다.
==============================================================================*/

-- 생성 : CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE INDEX
-- 수정 : ALTER TABLE, ALTER SEQUENCE, ALTER VIEW, ALTER INDEX

-- 테이블에 컬럼을 추가한다.
ALTER TABLE student
ADD loc varchar2(50); -- 추가하는 컬럼은 not null이면 안됨

/*
describe                           descending
DESC table_name : 테이블 구조 확인,  DESC column_name : 내림차순
*/

DESC student;

SELECT * FROM student;

-- 데이터가 삽입되어있는 상태에서 실제값보다 줄일 수는 없다.
-- ORA-01441: cannot decrease column length because some value is too big
ALTER TABLE student
MODIFY name varchar2(5);

-- 저장된 데이터의 크기보다 같거나 크게 줄일 수 있다.
ALTER TABLE student
MODIFY name varchar2(9);

-- 크기를 늘리는 것은 상관없다.
ALTER TABLE student
MODIFY name varchar2(30);

DESC student;

-- 테이블의 컬럼명을 수정한다.
ALTER TABLE student
RENAME COLUMN avg TO jumsu;

DESC student;

-- 왠만하면 바꾸지 않음

-- 테이블명을 변경한다.
ALTER TABLE student
RENAME TO members;

-- ORA-04043: student 객체가 존재하지 않습니다.
DESC student;

-- 정상수행
DESC members;

/*==============================================================================
DELETE : 테이블에 저장된 데이터 모두를 삭제한다. (구조 그대로) AUTO COMMIT 발생안됨      -> selection에서만 제거
TRUNCATE : 테이블에 저장된 데이터 모두를 삭제한다. (구조 그대로) AUTO COMMIT 발생       -> 물리적으로 제거
DROP : 테이블 자체를 삭제한다. (AUTO COMMIT 발생)
==============================================================================*/

COMMIT;

SELECT * FROM members;

 -- 2개 행 이(가) 삭제되었습니다.
DELETE FROM members;

SELECT * FROM members;

ROLLBACK;

SELECT * FROM members;

-- Table MEMBERS이(가) 잘렸습니다
TRUNCATE TABLE members; -- AUTO COMMIT

SELECT * FROM members;

ROLLBACK;

SELECT * FROM members; -- 아무것도 나오지 않음

COMMIT;

DROP TABLE members; -- AUTO COMMIT

-- ORA-00942: table or view does not exist
SELECT  * FROM members;

ROLLBACK;

-- ORA-00942: table or view does not exist
SELECT * FROM members;

