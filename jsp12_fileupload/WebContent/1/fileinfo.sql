CREATE TABLE fileinfo (
	filenum NUMBER(5) PRIMARY KEY,
	writer VARCHAR2(20),
	title VARCHAR2(20),
	content VARCHAR2(100),
	orgfilename VARCHAR2(150),
	savefilename VARCHAR2(150),
	filesize NUMBER(10)
);

CREATE SEQUENCE fileinfo_seq;