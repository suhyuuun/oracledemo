/*
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
*/

CREATE TABLE student(
    name varchar2(20), -- 바이트(영문, 특수문자 - 1byte / 한글 - 3byte)
    age number(3), -- 자릿수
    avg number(5, 2), -- 5는 전체자릿수, 2은 소수점 자릿수
    hire date
    );
    
SELECT * FROM student;

