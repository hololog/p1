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
	num int,
	name varchar(10) not null,
	subject varchar(20) not null,
	content varchar(500) not null,
	readcount int default 0,
	date date ,
	primary key (num)
	);
	
	