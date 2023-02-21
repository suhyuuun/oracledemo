CREATE TABLE todolist(
id number PRIMARY KEY,
completed number(1) DEFAULT 0,
todoname VARCHAR2(100) NOT NULL);

CREATE SEQUENCE todo_id_seq
 START WITH 1 
 INCREMENT BY 1 
 NOCACHE
 NOCYCLE;

INSERT INTO todolist  VALUES(todo_id_seq.nextval, 0, '여행');

COMMIT;

SELECT * FROM todolist;
