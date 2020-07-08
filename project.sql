CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(20) NOT NULL PRIMARY KEY,
	MEMBER_PW VARCHAR2(20) NOT NULL,
	MEMBER_NAME VARCHAR2(20),
	MEMBER_EMAIL VARCHAR2(30),
	MEMBER_PHONE VARCHAR2(15),
	MEMBER_PROBCNT NUMBER DFAULT 0,
	MEMBER_CLASS NUMBER
);

CREATE TABLE NOTIFICATION(
	MEMBER_ID VARCHAR2(20) NOT NULL PRIMARY KEY,
	NOTI_DATE DATE NOT NULL PRIMARY KEY,
	NOTI_TITLE VARCHAR2(20),
	NOTI_BODY VARCHAR2(1000),
);

CREATE TABLE NOTI_COMMENT(
	MEMBER_ID VARCHAR(20) NOT NULL PRIMARY KEY,
	NCOMMENT_ID VARCHAR(20),
	NOTI_DATE DATE,
	NCOMMENT_DATE DATE,
	NCOMMENT_BODY VARCHAR2(1000)
);

CREATE TABLE PROBLEM(
	PROB_NUM NUMBER,
	PROB_TITLE VARCHAR2(100),
	PROB_BODY VARCHAR2(1000),
	PROB_ANSWER VARCHAR2(1000)

);

CREATE TABLE SUBMIT_LOG(
	SUB_NUM NUMBER PRIMARY KEY,
	M_ID VARCHAR2(20),
	PROB_NUM PROB NUMBER,
	SUB_ANSWER VARCHAR(1),
	SUB_CODE VARCHAR2(1000)
);

CREATE SEQUENCE SEQ_ID INCREMENT BY 1 START WITH 1;
INSERT INTO MYTABLE VALUES( SEQ_NUM.NEXTVAL, ?, ?, ?);

CREATE SEQUENCE SUBMIT_LOG_SEQ INCREMENT BY 1 START WITH 1;
INSERT INTO SUBMIT_LOG VALUES( SUBMIT_LOG_SEQ.NEXTVAL, ?, ?, ?, ?);


해야할것 
-> 나머지 페이지 css / 끝
-> 예외처리 
-> 문제 보기시 띄어쓰기 처리 / 끝
-> 채팅기능 / 끝
-> 마이페이지 문제수 갱신 / 끝
-> 마이페이지 로그 출력 / 끝
-> 문제 게시판 정답, 제출 , 정답비율 / 끝
-> 순위보기 해야함. = 맞은 개수, 제출, 정답 비율 /끝
-> 상태 메세지 수정 /끝

문제

STU_NAME 문제
STUDENT 테이블에서 STU_NAME 를 출력하라
SELECT STU_NAME FROM STUDENT

김씨 문제
이름이 김 씨 성을 가진 사람을 모두 출력하라
STUDENT 테이블에서 김시 썽을 가진 사람의 이름을 출력하라.
SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE '김%'

[나]로 끝나는 사람은?
STUDENT 테이블 이름이 나로 끝나는 사람을 모두 출력하라
이름 칼럼 = STUDENT_NAME
SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE '김%'



@@@@@@@@@@@@@@문제 테이블 생성@@@@@@@@@@@@@@@@@
COL EMPNO FORMAT 9999
COL ENAME FORMAT A10
COL DNAME FORMAT A10
COL JOB FORMAT A10
COL MGR FORMAT 9999
COL SAL FORMAT 99999
COL DEPTNO FORMAT 999

DROP TABLE DEPT CASCADE CONSTRAINT;
DROP TABLE EMP CASCADE CONSTRAINT;

/////////////////////////////////////////////////////////////////////////

CREATE TABLE DEPT(
	DEPTNO NUMBER(2) CONSTRAINT pk_dept PRIMARY KEY,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);

INSERT INTO DEPT VALUES (10,'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');


CREATE TABLE EMP(
	EMPNO NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4), 
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) 
);

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',null,TO_DATE('1981-11-17','yyyy-mm-dd'),5000,null,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('1981-04-02','yyyy-mm-dd'),2975,null,20);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1981-05-01','yyyy-mm-dd'),2850,null,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('1981-06-09','yyyy-mm-dd'),2450,null,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('1987-04-19','yyyy-mm-dd'),3000,null,20);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('1981-12-03','yyyy-mm-dd'),3000,null,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-02-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-02-22','yyyy-mm-dd'),1250,500,30);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-09-28','yyyy-mm-dd'),1250,1400,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('1981-09-08','yyyy-mm-dd'),1500,null,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('1981-12-03','yyyy-mm-dd'),950,null,30);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('1982-01-23','yyyy-mm-dd'),1300,null,10);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,null,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('1987-05-23','yyyy-mm-dd'),1100,null,20);
COMMIT;

CREATE TABLE salgrade(
	grade number(7,2),
	losal number(7,2),
	hisal number(7,2)
);

INSERT INTO salgrade values(1,700,1200);
INSERT INTO salgrade values(2,1201,1400);
INSERT INTO salgrade values(3,1401,2000);
INSERT INTO salgrade values(4,2001,3000);
INSERT INTO salgrade values(5,3001,9999);

-------------------------------------------------------------------------------------------------------

create table student(
stu_no char(9),
stu_name varchar2(12),
stu_dept varchar2(20),
stu_grade number(1),
stu_class char(1),
stu_gender char(1),
stu_height number(5,2),
stu_weight number(5,2),
constraint p_stu_no primary key(stu_no));

insert into student values(20153075, '옥한빛','기계',1,'C','M',177,80);
insert into student values(20153088, '이태연','기계',1,'C','F',162,50);
insert into student values(20143054, '유가인','기계',2,'C','F',154,47);
insert into student values(20152088, '조민우','전기전자',1,'C','M',188,90);
insert into student values(20142021, '심수정','전기전자',2,'A','F',168,45);
insert into student values(20132003, '박희철','전기전자',3,'B','M',null,63);
insert into student values(20151062, '김인중','컴퓨터정보',1,'B','M',166,67);
insert into student values(20141007, '진현무','컴퓨터정보',2,'A','M',174,64);
insert into student values(20131001, '김종헌','컴퓨터정보',3,'C','M',null,72);
insert into student values(20131025, '옥성우','컴퓨터정보',3,'A','F',172,63);
insert into student values(20113075, '옥하나','기계',1,'C','M',155,50);
insert into student values(20123088, '이하나','기계',1,'C','F',172,70);
insert into student values(20113054, '유하나','기계',2,'C','F',164,45);
insert into student values(20122088, '조하나','전기전자',1,'C','M',178,50);
insert into student values(20112021, '심하나','전기전자',2,'A','F',168,35);
insert into student values(20122003, '박하나','전기전자',3,'B','M',null,23);
insert into student values(20111062, '김하나','컴퓨터정보',1,'B','M',166,57);
insert into student values(20121007, '진하나','컴퓨터정보',2,'A','M',174,94);
insert into student values(20111001, '김하나','컴퓨터정보',3,'C','M',null,102);
insert into student values(20121025, '옥둘둘','컴퓨터정보',3,'A','F',172,53);



create table subject(
sub_no char(3),
sub_name varchar2(30),
sub_prof varchar2(12),
sub_grade number(1),
sub_dept varchar2(20),
constraint p_sub_no primary key(sub_no));

insert into subject values('111', '데이터베이스','이재영',2,'컴퓨터정보');
insert into subject values('110', '자동제어','정순정',2,'전기전자');
insert into subject values('109', '자동화설계','박민영',3,'기계');
insert into subject values('101', '컴퓨터개론','강종영',3,'컴퓨터정보');
insert into subject values('102', '기계공작법','김태영',1,'기계');
insert into subject values('103', '기초전자실험','김유석',1,'전기전자');
insert into subject values('104', '시스템분석설계','강석현',3,'컴퓨터정보');
insert into subject values('105', '기계요소설계','김명성',1,'기계');
insert into subject values('106', '전자회로실험','최영민',3,'전기전자');
insert into subject values('107', 'CAD응용실습','구봉규',2,'기계');
insert into subject values('108', '소프트웨어공학','권민성',1,'컴퓨터정보');

create table enrol(
sub_no char(3),
stu_no char(9),
enr_grade number(3),
constraint p_course primary key(sub_no,stu_no));

insert into enrol values('101','20131001',80);
insert into enrol values('104','20131001',56);
insert into enrol values('106','20132003',72);
insert into enrol values('103','20152088',45);
insert into enrol values('101','20131025',65);
insert into enrol values('104','20131025',65);
insert into enrol values('108','20151062',81);
insert into enrol values('107','20143054',41);
insert into enrol values('102','20153075',66);
insert into enrol values('105','20153075',56);
insert into enrol values('102','20153088',61);
insert into enrol values('105','20153088',78);
