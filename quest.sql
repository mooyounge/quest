--quest_user
create table quest_user(
    id varchar2(15) primary key,
    password varchar2(15) not null,
    nicname varchar2(30) not null,
    email varchar2(30) not null unique,
    phoneNumber number not null,
    name varchar2(10) not null,
    birth varchar2(15) not null,
    ban_confirm number(1),
    ban_time date
);

-- 게임 장르
create table quest_genre(
    genre varchar2(20) primary key,
    genre_number number unique
);

drop table quest_genre; -- 이거 삭제하고 게임 이름에 걍 집어넣어도 될거같음

-- 게임 이름
create table quest_game(
    genre varchar2(30) not null,
    game_name varchar2(30) primary key,
    game_abb varchar2(10) not null
);
ALTER TABLE quest_game modify(game_abb varchar2(10) unique);

update quest_game set GAME_ABB = 'all' where genre = 'ALL';


select * from quest_game;
insert into quest_game values('FPS','서든어택','sudden');
insert into quest_game values('FPS','배틀 그라운드','bground');
insert into quest_game values('FPS','더 디비전','thediv');
insert into quest_game values('FPS','레인보우식스 시즈','rb6s');

insert into quest_game values('AOS','리그오브 레전드','lol');
insert into quest_game values('AOS','DOTA2','dota2');
insert into quest_game values('AOS','사이퍼즈','cypers');

insert into quest_game values('rhythm','DJ MAX','djmax');

insert into quest_game values('indie','A Hat in time','ahit');

insert into quest_game values('RPG','검은사막','bdesrt');
insert into quest_game values('RPG','테라','tera');
insert into quest_game values('RPG','리니지','lineage');

insert into quest_game values('ALL','ALL');

select * from quest_game;
update quest_game set game_name = '전체게시판' where genre = 'ALL';
commit;



-- 게시판
create table quest_board(
    game_abb varchar2(10) references quest_game(game_abb),
    board_id number primary key,
    board_name varchar2(20) not null
);
insert into quest_board values('all',quest_board_id.nextval,'정보');
delete from quest_board where board_id > 5;
select * from quest_board;
delete from quest_board where board_id = 99;
create sequence quest_board_id;
drop table quest_board;
update quest_board set board_name = 'info' where board_name = '정보';
commit;
-- 글 
create table quest_post(
    post_id number primary key,
    game_abb varchar2(10) references quest_game(game_abb), 
    board_id number references quest_board(board_id),
    user_id varchar2(15) references quest_user(id),
    post_title varchar2(50) not null,
    post_content clob not null,
    post_regdate date not null,
    post_like number default 0,
    post_dislike number default 0,
    post_lookup number default 0
);
select * from quest_post;
create sequence quest_post_id;
drop table quest_post;

--댓글
create table quest_comment(
    comment_id number primary key,
    post_id references quest_post(post_id),
    user_id references quest_user(id),
    comment_content clob not null,
    comment_regdate date not null,
    comment_like number default 0,
    comment_dislike number default 0
);
drop table quest_comment;
--신고


--태그


-- Insert
insert into quest_user values
('admin','admin','admin','khh971228@naver.com','01011111111','admin','971228','','');


select * from quest_board;
insert into quest_post values(quest_post_id.nextval,'all',65,'admin','test','test',systimestamp,0,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test1','test1',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test2','test2',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test3','test3',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test4','test4',systimestamp,0,0);

select board_id from quest_board where board_name = 'free';
select * from quest_board;
select * from quest_post where game_abb like('%');
select * from quest_post where game_abb = 'all' and (board_id ='65' or board_id='64');
select count(post_id) from quest_post where game_abb like '%' and board_id >= 0;
    
    
    100
    97
    94
    