--quest_user
create table quest_user(
    id varchar2(15) primary key,
    password varchar2(15) not null,
    nicname varchar2(30) not null,
    ban_confirm number(1),
    ban_time date
);
select * from quest_user;
alter table quest_user drop column email;

-- 게임 이름
create table quest_game(
    genre varchar2(30) not null,
    game_name varchar2(30) primary key,
    game_abb varchar2(10) not null
);
ALTER TABLE quest_game ADD(game_id number UNIQUE);
create sequence quest_game_id;

ALTER TABLE quest_game RENAME COLUMN game_id TO game_line;

ALTER TABLE quest_game modify(game_id number);
select * from quest_game order by game_line;
select * from quest_game where game_line > 1;
update quest_game set game_line = 1 where game_abb='aosall';
ALTER TABLE quest_game DROP CONSTRAINT SYS_C004158;

commit;

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

insert into quest_game values('FPS','FPS 전체 게시글','fpsall');
insert into quest_game values('RPG','RPG 전체 게시글','rpgall');
insert into quest_game values('AOS','AOS 전체 게시글','aosall');
insert into quest_game values('rhythm','리듬게임 전체 게시글','rhythmall');
insert into quest_game values('indie','인디게임 전체 게시글','indieall');

select * from quest_game;
commit;



-- 게시판
create table quest_board(
    game_abb varchar2(10) references quest_game(game_abb),
    board_id number primary key,
    board_name varchar2(20) not null
);
insert into quest_board values('fpsall',quest_board_id.nextval,'info');
insert into quest_board values('fpsall',quest_board_id.nextval,'free');
insert into quest_board values('rpgall',quest_board_id.nextval,'info');
insert into quest_board values('rpgall',quest_board_id.nextval,'free');
insert into quest_board values('aosall',quest_board_id.nextval,'info');
insert into quest_board values('aosall',quest_board_id.nextval,'free');
insert into quest_board values('rhythmall',quest_board_id.nextval,'info');
insert into quest_board values('rhythmall',quest_board_id.nextval,'free');
insert into quest_board values('indieall',quest_board_id.nextval,'info');
insert into quest_board values('indieall',quest_board_id.nextval,'free');

select * from quest_board;
delete from quest_board where board_id = 99;
create sequence quest_board_id;
drop table quest_board;

commit;
-- 글 
create table quest_post(
    post_id number primary key,
    game_abb varchar2(10) references quest_game(game_abb),
    board_id number references quest_board(board_id),
    user_id varchar2(50) references quest_user(id),
    post_title varchar2(50) not null,
    post_content clob not null,
    post_regdate date not null,
    post_lookup number default 0
);
select * from quest_post;
create sequence quest_post_id;
drop table quest_post;
ALTER TABLE quest_post DROP COLUMN post_dislike;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM
         USER_CONSTRAINTS where table_name = 'QUEST_POST';
alter table quest_post drop constraint SYS_C004131;
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'QUEST_POST';
SELECT * FROM ALL_CONSTRAINTS where CONSTRAINT_name = 'SYS_C003978';
ALTER TABLE QUEST_POST add constraint fk_user_id foreign key(user_id) references quest_user(id);

--댓글
create table quest_comment(
    comment_id number primary key,
    post_id references quest_post(post_id),
    user_id references quest_user(id),
    user_name varchar(50) not null,
    password varchar(20) not null,
    comment_content clob not null,
    comment_regdate date not null,
    comment_like number default 0,
    comment_dislike number default 0
);
select * from quest_comment;
create sequence quest_comment_id;
insert into quest_comment values(quest_comment_id.nextval,38,null,'현호','1111','내용입니다',sysdate,0,0);
commit;
drop table quest_comment;
ALTER TABLE quest_comment DROP COLUMN comment_like;

--신고


--태그

--글 추천
create table quest_post_like(
    post_like_id number primary key,
    user_id varchar2(50) references quest_user(id),
    user_ip varchar2(30) not null,
    post_id number references quest_post(post_id),
    post_like varchar2(10) check(post_like in('like','dislike')),
    post_info_like varchar2(10) check(post_info_like in('like','dislike'))
);
commit;
insert into quest_post_like values(quest_post_like_id.nextval,null,'123.51',38,'like',null);
select * from quest_post_like;
select count(*) from quest_post_like where user_id is null and post_id = 43 and post_info_like is null;
create sequence quest_post_like_id;
drop table quest_post_like;
delete quest_post_like;
--댓글 추천
create table quest_comment_like(
    comment_like_id number primary key,
    user_id varchar2(50) references quest_user(id),
    user_ip varchar2(30) not null,
    comment_id number references quest_comment(comment_id) on delete cascade,
    comment_like varchar2(10) check(comment_like in('like','dislike'))
);
select *  from quest_comment_like;



create sequence quest_comment_like_id;
drop table quest_comment_like;

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

select a.*, (select count(*) from quest_post_like where a.post_id = post_id and post_like='like') as post_like from quest_post a where post_id = 59;



create table post_tag(
    tag_id number primary key,
    post_id number references quest_post(post_id),
    name varchar2(30) not null,
    color varchar2(10) default 'default' not null
);
create sequence post_tag_id;

select * from post_tag;


(select count(*) from quest_post_like where a.post_id = post_id and post_like='like') as post_like,
				(select count(*) from quest_post_like where a.post_id = post_id and post_like='dislike') as post_dislike,;
                
select * from
(select rownum as rnum, b.* 
 from 
    (select (select count(*) from quest_post_like where a.post_id = post_id and post_like='like') as post_like,
            (select count(*) from quest_post_like where a.post_id = post_id and post_like='dislike') as post_dislike,
            a.* 
     from (select * from quest_post order by post_regdate desc) a ) b where post_like >= 1)  where rnum between 1 and 3 ;
     
select * from (select (select count(*) from quest_post_like where a.post_id = post_id and post_like='like') as post_like,a.* from quest_post a) where post_like >=2;
