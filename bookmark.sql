create table bookmark(
 num number,
 user_id varchar2(2000),
 foodstore_id varchar2(2000)
);

create sequence bookmark_num_seq
start with 1 
increment by 1
nocache
nocycle;

insert into bookmark
values(bookmark_num_seq.nextval, '001','260283466');

commit;

select * from bookmark;