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