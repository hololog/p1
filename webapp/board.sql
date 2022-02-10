CREATE TABLE board(
	BOARD_NUM INT,
	BOARD_NAME VARCHAR(20) NOT NULL,
	BOARD_PASS VARCHAR(15) NOT NULL,
	BOARD_SUBJECT VARCHAR(50) NOT NULL,
	BOARD_CONTENT VARCHAR(2000) NOT NULL,
	BOARD_FILE VARCHAR(50) NOT NULL,
	BOARD_RE_REF INT NOT NULL,
	BOARD_RE_LEV INT NOT NULL,
	BOARD_RE_SEQ INT NOT NULL,
	BOARD_READCOUNT INT DEFAULT 0,
	BOARD_DATE DATE,
	PRIMARY KEY(BOARD_NUM)
);

select * from board;

create table board(
	num int primary key,
	nick varchar(10) not null,
	subject varchar(20),
	content varchar(1000),
	readcount int default 0,
	open varchar(10),
	insert_date datetime default current_timestamp,
	FOREIGN KEY (nick)
    REFERENCES member(nick) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE table member(
	id varchar(20) PRIMARY KEY,
	pass varchar(20) NOT NULL,
	name varchar(20) NOT NULL,
	nick varchar(20) NOT NULL UNIQUE,
	email varchar(50) NOT NULL,
	address varchar(100) NOT NULL,
	join_date datetime default current_timestamp
);

create table review(
	num int primary key,
	nick varchar(10) not null,
	subject varchar(20) not null,
	content varchar(1000) not null,
	review_file varchar(100),
	readcount int default 0,
	review_date datetime default current_timestamp
);

create table file(
	num int primary key,
	nick varchar(10) not null,
	subject varchar(50) not null,
	content varchar(1000) not null,
	review_file varchar(100),
	readcount int default 0,
	review_date datetime default current_timestamp
);

alter table review modify subject varchar(50) not null;

alter table file 
add foreign key (nick) 
references member(nick) ON UPDATE CASCADE ON DELETE RESTRICT;

select * from review;

select * from file;

select * from member;

select * from board;

alter table member add column extraAddress varchar(20);
alter table member add column detailAddress varchar(20);
alter table member add column postcode varchar(20);

update member set address='부산 수영구 광안해변로 418, 105, (민락동), 48278' where id='admin';

truncate table member;

delete from member where id='id2';
set FOREIGN_KEY_CHECKS = 0;
set FOREIGN_KEY_CHECKS = 1;





