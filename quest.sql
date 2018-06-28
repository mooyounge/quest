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

-- 게임 이름
create table quest_game(
    genre_number number references quest_genre(genre_number),
    game_name varchar2(30) primary key
);

-- 게시판
create table quest_board(
    game_name varchar2(30) references quest_game(game_name),
    board_id number primary key,
    board_name varchar2(20) not null
);
create sequence quest_board_id;

-- 글 
create table quest_post(
    post_id number primary key,
    board_id number references quest_board(board_id),
    user_id varchar2(15) references quest_user(id),
    post_title varchar2(50) not null,
    post_content clob not null,
    post_regdate date not null,
    post_like number default 0,
    post_dislike number default 0
);
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
--신고


--태그






