CREATE TABLE guestboard (
	num NUMBER(5) PRIMARY KEY, --�۹�ȣ
	writer VARCHAR2(10),
	title VARCHAR2(10),
	content VARCHAR2(50),
	ref NUMBER(5), --�׷��ȣ
	lev NUMBER(5), --����(�������, ����� �������..)
	step NUMBER(5) --��¼���
);
