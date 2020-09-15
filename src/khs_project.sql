SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS Board;
DROP TABLE IF EXISTS play;
DROP TABLE IF EXISTS Member;




/* Create Tables */

CREATE TABLE Board
(
	no int NOT NULL AUTO_INCREMENT,
	id varchar(20) NOT NULL,
	category1 varchar(20) NOT NULL,
	category2 varchar(20),
	subject varchar(50),
	content varchar(5000) NOT NULL,
	author varchar(20) NOT NULL,
	regdate datetime NOT NULL,
	readcnt int NOT NULL,
	datetime varchar(50),
	file1 varchar(200),
	PRIMARY KEY (no)
);


CREATE TABLE Member
(
	id varchar(20) NOT NULL,
	pass varchar(20) NOT NULL,
	nickname varchar(20) NOT NULL,
	email varchar(100) NOT NULL,
	birth date NOT NULL,
	img varchar(200),
	PRIMARY KEY (id)
);


CREATE TABLE play
(
	no int NOT NULL AUTO_INCREMENT,
	id varchar(20) NOT NULL,
	subject varchar(50) NOT NULL,
	category varchar(20) NOT NULL,
	review varchar(20000),
	price int(11) NOT NULL,
	cast varchar(200),
	datetime datetime NOT NULL,
	place varchar(200),
	memo varchar(1000),
	file1 varchar(200),
	PRIMARY KEY (no)
);


CREATE TABLE reply
(
	rno int NOT NULL AUTO_INCREMENT,
	bno int NOT NULL,
	id varchar(20) NOT NULL,
	content varchar(1000) NOT NULL,
	author varchar(20) NOT NULL,
	regdate datetime NOT NULL,
	PRIMARY KEY (rno)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (bno)
	REFERENCES Board (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Board
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE play
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



