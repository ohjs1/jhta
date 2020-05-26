CREATE TABLE movie (
	mnum NUMBER(5) PRIMARY KEY,
	title VARCHAR2(20),
	content VARCHAR2(100),
	director VARCHAR2(50)
);

CREATE TABLE comments (
	num NUMBER(5) PRIMARY KEY,
	mnum NUMBER(5) REFERENCES movie(mnum),
	id VARCHAR2(20),
	comments VARCHAR2(50)
);

CREATE SEQUENCE movie_seq;
CREATE SEQUENCE comments_seq;

