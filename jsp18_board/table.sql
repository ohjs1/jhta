CREATE TABLE guestboard (
	num NUMBER(5) PRIMARY KEY, --글번호
	writer VARCHAR2(10),
	title VARCHAR2(10),
	content VARCHAR2(50),
	ref NUMBER(5), --그룹번호
	lev NUMBER(5), --레벨(답글인지, 답글의 답글인지..)
	step NUMBER(5) --출력순서
);
