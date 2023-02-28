
-- 회원 정보 테이블
CREATE TABLE ugotfilm_user(
    usercode number,
    username varchar2(1000),
    password varchar2(1000),
    nickname varchar2(1000),
    joindate Date,
    gender varchar2(10),
    birth number,
    authRole varchar2(20)
);

drop table ugotfilm_user;

commit;

-- 회원 유저코드 시퀀스
CREATE SEQUENCE ugotfilm_user_usercode_seq START with 1 increment by 1 nocache nocycle;

-- 유저가 선택한 영화 기록
CREATE TABLE ugotfilm_movie_choice(
    usercode number,
    moviecode number,
    choicedate date
);

-- 유저가 선택한 인물 기록
CREATE TABLE ugotfilm_person_choice(
    usercode number,
    personcode number,
    choicedate date
);

-- 유저가 선택한 장르 기록
CREATE TABLE ugotfilm_genre_choice(
    usercode number,
    genrecode number,
    choicedate date
);

-- 영화 정보 저장 테이블
CREATE TABLE ugotfilm_movie(
    moviecode number,
    title varchar2(100),
    poster_path varchar2(100),
    count_num number,
    movie_id number
);

-- 인물 정보 저장 테이블
CREATE TABLE ugotfilm_person(
    personcode number,       -- id
    name varchar2(100),     -- name
    job varchar2(1000),     -- known_for_department
    profile_path varchar2(200) -- profile_path
);

-- 장르 정보 저장 테이블
CREATE TABLE ugotfilm_genre(
    genrecode number,       -- id
    name varchar2(100)     -- name
);

-- 샘플
-- 회원 정보 샘플
insert INTO ugotfilm_user VALUES (1, 'user1', '0000', '유저1', sysdate, '남', 2000);
insert INTO ugotfilm_user VALUES (2, 'user2', '0000', '유저2', sysdate, '여', 1990);
insert INTO ugotfilm_user VALUES (3, 'user3', '0000', '유저3', sysdate, '남', 2010);
commit;

-- 영화 정보 샘플
insert INTO ugotfilm_movie VALUES (1, '테스트1', '판타지 영화내용', sysdate, 4.5, 1, '포스터 경로1');    --장르 1 판타지 2 공포, 3 다큐
insert INTO ugotfilm_movie VALUES (2, '테스트2', '공포영화', sysdate, 4.0, 2, '포스터 경로2');
insert INTO ugotfilm_movie VALUES (3, '테스트3', '다큐 영화1', sysdate, 4.3, 3, '포스터 경로3');
insert INTO ugotfilm_movie VALUES (4, '테스트4', '다큐 영화2', sysdate, 4.3, 3, '포스터 경로4');

-- 인물 정보 샘플

-- 장르 정보 샘플
insert INTO ugotfilm_genre VALUES (1, '판타지');
insert INTO ugotfilm_genre VALUES (2, '공포');
insert INTO ugotfilm_genre VALUES (3, '다큐');

-- 선택 정보 샘플(영화 정보 참고해서 넣으면 된다)
insert INTO ugotfilm_movie_choice VALUES (1, 3, sysdate);
insert INTO ugotfilm_genre_choice VALUES (1, 2, sysdate);
insert INTO ugotfilm_person_choice VALUES (2, 3, sysdate);

commit;

select * from ugotfilm_movie_choice;
select * from ugotfilm_genre_choice;
select * from ugotfilm_person_choice;


-- 다양한 기준의 정보 샘플
--1번 유저가 가장 선호하는 영화 장르(많이 클릭한 순)
select g.name, u.* from (select genrecode, count(genrecode) as count from ugotfilm_genre_choice where usercode=1 group by genrecode) u 
left join ugotfilm_genre g on g.genrecode=u.genrecode order by count desc;


-- 1번 유저가 클릭한 영화 리스트(많이 클릭한 순)
select m.* from (select moviecode, count(moviecode) as count from ugotfilm_movie_choice where usercode=1 group by moviecode) u 
left join ugotfilm_movie m on m.moviecode=u.moviecode order by count desc;
