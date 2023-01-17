##############################################
게시판 만들기
##############################################

1. 테이블생성 
create table board(
   	num number,
   	writer varchar2(20),
 	email varchar2(30),
	subject varchar2(50),
	reg_date date,
	readcount number default 0, 
	ref number, 
	re_step number, 
	re_level number, 
	content varchar2(100),
	ip varchar2(20),
    upload varchar2(300)
);

create sequence board_num_seq
start with 1 
increment by 1
nocache
nocycle;

insert into board 
values(board_num_seq.nextval, '홍길동','young@aaaa.com','제목1',sysdate,0,board_num_seq.nextval,
0,0,'내용 테스트.......','127.0.0.1','sample.txt');

commit;

<<<<<<< HEAD
=======
SELECT * FROM board;
>>>>>>> 0801bd63bf7c4998aa4b1c4d9c9c745d380e274b

select num, readcount 
from board
where num=2;


<<<<<<< HEAD
select num, subject, ref, re_step, re_level
from board
order by ref desc, re_step asc;

=======
select num, subject, ref, re_step, re_level,upload
from board
order by ref desc, re_step asc;

/*
                    (출력순서) (답변 들여쓰기용)
 num  subject  ref  re_step  re_level
 1    제목글1    1      0        0
 2    제목글2    2      0        0
 3    제1_답1    1      1 -> 2   0 -> 1
             (두번째 답변이 달렸을때) (답변처음달때)
 4    제1_답2    1      1        1
 
 -> 제목글, 답변글 최신순으로 
*/
DELETE FROM board
WHERE num =9;

commit;
>>>>>>> 0801bd63bf7c4998aa4b1c4d9c9c745d380e274b


select b.* 
from (select rownum as rm, a.*
	  from (select *
	 	    from board
<<<<<<< HEAD
            order by ref desc, re_step asc) a)b
=======
            order by ref desc, re_step asc)a)b
>>>>>>> 0801bd63bf7c4998aa4b1c4d9c9c745d380e274b
where b.rm>=? and b.rm<=?           



delete from board
where num=21

drop table board;


select b.* from 
(select rownum as rm, a.* from(
  select num, ref, re_step,re_level from board
  order by ref desc, re_step asc) a)b
<<<<<<< HEAD
where b.rm >=1  and b.rm<=5
=======
where b.rm >=1  and b.rm<=5;

select b.* from 
(select rownum as rm, a.* from(select * from board
                               order by ref desc, re_step asc)a)b
where b.rm >=1  and b.rm<=5;
>>>>>>> 0801bd63bf7c4998aa4b1c4d9c9c745d380e274b

delete from board where num=23;

WebServlet("/board/*")


webContent             /boardview/list.jsp
boardview
  list.jsp

select count(*) from board where subject like '%w%'
select count(*) from board where writer like '%3%'




select num, ref, re_step,re_level 
from board 
order by num

--from -> where -> group by ->having ->select -> order by

select rownum, b.*
 from(select rownum as rm, a.*
 from(select * from board order by ref desc ,re_step asc)a)b
<<<<<<< HEAD
 where b.rm>=? and b.rm <=?










=======
 where b.rm>=? and b.rm <=?;









SELECT * FROM mem
ORDER  BY num DESC;
>>>>>>> 0801bd63bf7c4998aa4b1c4d9c9c745d380e274b



















