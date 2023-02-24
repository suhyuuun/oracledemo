-- 영화 정보 저장 테이블
DROP TABLE ugotfilm_movie;

CREATE TABLE ugotfilm_movie(
    moviecode number,
    title varchar2(1000),
    poster_path varchar2(1000)
);

INSERT INTO ugotfilm_MOVIE(MOVIECODE, TITLE, POSTER_PATH)
VALUES(12345,'바람과함께 사라지다','/testing.jpg') ;

commit;

select * from ugotfilm_MOVIE; 

CREATE TABLE ugotfilm_crew(
    crewcode number,
    name varchar2(1000),
    profile_path varchar2(1000)
);

INSERT INTO ugotfilm_crew(crewcode, name, profile_path)
VALUES(12345,'김수현','/testing.jpg') ;

commit;

select * from ugotfilm_crew;
