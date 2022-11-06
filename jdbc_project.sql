-- 테이블 생성
CREATE TABLE players(
num number constraint players_num_pk primary key,
name varchar2(30),
instrument varchar2(30),
day number (10),
price number(6),
programComposer varchar2(30)
);

-- 시퀀스 생성
CREATE SEQUENCE players_num_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
-- 삽입
INSERT INTO players(num, name, instrument, day, price ,programComposer)
VALUES(players_num_seq.nextval, '조성진', '피아노', 20221029, 100000, '쇼팽'); 

SELECT * FROM players;

COMMIT;

