drop table bookmark;

create table bookmark(
bookmark_seq number,
bookmark_Yncheck varchar2(20),
bookmark_user_id varchar2(20),
bookmark_foodstore_id varchar2(20)
);

create sequence bookmark_seq
start with 1
increment by 1
nocache
nocycle;

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_1111111111', '8144397');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_2222222222', '8144397');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_3333333333', '8144397');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_4444444444', '8144397');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_5555555555', '8144397');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_1111111111', '22549791');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'Y', 'kakao_1111111111', '1337569618');

insert 
into bookmark(bookmark_seq, bookmark_Yncheck, bookmark_user_id, bookmark_foodstore_id)
values(bookmark_seq.nextval, 'N', 'kakao_5555555555', '22549791');

commit;

select * from bookmark;