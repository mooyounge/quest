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
    game_name varchar2(30) primary key
);

drop table quest_game;

-- 게시판
create table quest_board(
    game_name varchar2(30) references quest_game(game_name),
    board_id number primary key,
    board_name varchar2(20) not null
);
create sequence quest_board_id;
drop table quest_board;
-- 글 
create table quest_post(
    post_id number primary key,
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

insert into quest_game values('RPG','검은사막');
insert into quest_game values('RPG','테라');
insert into quest_game values('RPG','리니지');
insert into quest_game values('ALL','ALL');
insert into quest_board values('ALL',quest_board_id.nextval,'실험게시판');
select * from quest_board;
insert into quest_post values(quest_post_id.nextval,1,'admin','test','test',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test1','test1',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test2','test2',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test3','test3',systimestamp,0,0);
insert into quest_post values(quest_post_id.nextval,1,'admin','test4','test4',systimestamp,0,0);

select * from quest_post;

select count(post_id) from quest_post;    
    
    
    
    
    
    
    
    
    
    
    
    