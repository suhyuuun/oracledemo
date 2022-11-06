-- 테이블 생성
CREATE TABLE player(
num number constraint mem_num_pk primary key,
name varchar2(30),
instrument varchar2(30),
day number (10),
programComposer varchar2(30),
price number(6)
);

-- 시퀀스 생성
CREATE SEQUENCE mem_num_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
-- 삽입
INSERT INTO player(num, name, instrument, day, programComposer, price)
VALUES(mem_num_seq.nextval, '조성진', '피아노', 20221029, '쇼팽', 100000); 

SELECT * FROM player;