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
	name varchar(10) not null,
	subject varchar(20) not null,
	content varchar(500) not null,
	readcount int default 0,
	indert_date datetime ,
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

select * from member;


create table review(
	num int primary key,
	nick varchar(10) not null,
	subject varchar(20) not null,
	content varchar(1000) not null,
	review_file varchar(100),
	readcount int default 0,
	review_date datetime default current_timestamp
	);

alter table review modify subject varchar(50) not null;

select * from review;








