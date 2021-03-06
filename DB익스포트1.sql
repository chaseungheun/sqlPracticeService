--------------------------------------------------------
--  파일이 생성됨 - 목요일-7월-16-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SUBMIT_LOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SUBMIT_LOG_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 241 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_JNUM
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ_JNUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ"  MINVALUE 1 MAXVALUE 20 INCREMENT BY 2 START WITH 11 CACHE 5 NOORDER  CYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence JSEQ_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."JSEQ_NUM"  MINVALUE 10000 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10020 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SOLVED_PROB_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SOLVED_PROB_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table J_PROBLEM
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."J_PROBLEM" 
   (	"PROB_NUM" NUMBER, 
	"PROB_TITLE" VARCHAR2(100 BYTE), 
	"PROB_BODY" VARCHAR2(2000 BYTE), 
	"PROB_ANSWER" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SUBMIT_LOG
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."SUBMIT_LOG" 
   (	"SUB_NUM" NUMBER, 
	"M_ID" VARCHAR2(20 BYTE), 
	"PROB_NUM" NUMBER, 
	"SUB_ANSWER" VARCHAR2(1 BYTE), 
	"SUB_CODE" VARCHAR2(2000 BYTE), 
	"SUB_DATE" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."STUDENT" 
   (	"STU_NO" CHAR(9 BYTE), 
	"STU_NAME" VARCHAR2(12 BYTE), 
	"STU_DEPT" VARCHAR2(20 BYTE), 
	"STU_GRADE" NUMBER(1,0), 
	"STU_CLASS" CHAR(1 BYTE), 
	"STU_GENDER" CHAR(1 BYTE), 
	"STU_HEIGHT" NUMBER(5,2), 
	"STU_WEIGHT" NUMBER(5,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROBLEM
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."PROBLEM" 
   (	"PROB_NUM" NUMBER, 
	"PROB_TITLE" VARCHAR2(100 BYTE), 
	"PROB_BODY" VARCHAR2(1000 BYTE), 
	"PROB_ANSWER" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."MEMBER" 
   (	"M_ID" VARCHAR2(15 BYTE), 
	"M_PW" VARCHAR2(15 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"M_EMAIL" VARCHAR2(30 BYTE), 
	"M_PHONE" VARCHAR2(15 BYTE), 
	"M_MESSAGE" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View V_TRADE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "C##ORA_USER"."V_TRADE" ("T_SEQ", "P_CODE", "C_CODE", "T_DATE", "T_QTY", "T_COST", "T_TAX") AS 
  SELECT "T_SEQ","P_CODE","C_CODE","T_DATE","T_QTY","T_COST","T_TAX" FROM trade WHERE p_code = '401'
;
REM INSERTING into C##ORA_USER.J_PROBLEM
SET DEFINE OFF;
Insert into C##ORA_USER.J_PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (10001,'plus_1toM','1에서 부터 M까지 더하는 함수를 작성하라
public static int solution(int m){
     int answer = 0;

     return answer; 
}','import java.util.Random;
import java.util.*;

public class plus_1toM {

	public static void main(String[] args) {
	
		int n,m;
		Random random= new Random();
		m = random.nextInt(1000);
		
		System.out.println(answer(m) == solution(m));
	}
	public static int answer(int m){
		return (m*(m+1))/2;
	}
	//solution
	
}');
Insert into C##ORA_USER.J_PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (10000,'plus','인풋으로 a,b를 받으면 a+b를 출력하는 아래의 함수를 작성하라.
public static int solution(int a, int b){
int answer = 0;
return ;
}','
public class plus {

	public static void main(String[] args) {
	
		int a=10,b=9;
		System.out.println(answer(a,b) == solution(a,b));
	}
	public static int answer(int a,int b){
		return a+b;
	}
	//solution
	
}
');
REM INSERTING into C##ORA_USER.V_TRADE
SET DEFINE OFF;
REM INSERTING into C##ORA_USER.SUBMIT_LOG
SET DEFINE OFF;
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (226,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:53:17');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (230,'123',10001,'F','public static int answer(int m){
int answer = 0;

return ((m+1)*m)/2;
}','20/07/16 11:05:33');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (231,'123',10000,'T','public static int solution(int a, int b){
int answer = 0;
return a+b;
}
','20/07/16 11:06:17');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (125,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:14:09');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (126,'123',125,'T','SELECT * FROM STUDENT','20/07/08 15:14:14');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (127,'123',127,'T','SELECT * FROM STUDENT','20/07/08 15:14:17');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (128,'123',128,'T','SELECT * FROM STUDENT','20/07/08 15:14:21');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (129,'solar',128,'T','SELECT * FROM STUDENT','20/07/08 15:14:34');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (130,'solar',128,'T','SELECT * FROM STUDENT','20/07/08 15:14:37');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (124,'star',123,'T','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''','20/07/08 15:05:10');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (131,'solar',127,'T','SELECT * FROM STUDENT','20/07/08 15:14:40');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (132,'luna',127,'T','SELECT * FROM STUDENT','20/07/08 15:15:04');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (133,'luna',122,'F','SELECT * FROM STUDENT','20/07/08 15:15:08');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (134,'luna',121,'F','SELECT * FROM STUDENT','20/07/08 15:15:12');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (135,'chacha',123,'T','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''','20/07/08 15:16:29');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (143,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:31:21');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (145,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:32:03');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (146,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:32:09');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (150,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:34:17');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (153,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:35:25');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (154,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:36:43');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (155,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:37:05');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (156,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:37:44');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (157,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:38:02');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (158,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:38:30');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (159,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:38:32');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (160,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:38:36');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (162,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:39:10');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (164,'123',123,'F','SELECT * FROM STUDENT','20/07/08 15:40:40');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (221,'123',10000,'T','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:44:25');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (222,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:49:49');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (227,'123',10000,'T','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:54:50');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (234,'123',10001,'T','public static int solution(int m){
int answer = 0;

return ((m+1)*m)/2;
}','20/07/16 11:10:44');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (236,'123',10001,'F','public static int solution(int m){
int answer = 0;

return m;
}','20/07/16 11:11:31');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (232,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a-b;
}','20/07/16 11:06:26');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (228,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a-b;
}','20/07/16 10:55:00');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (121,'star',121,'T','SELECT STU_NAME FROM STUDENT','20/07/08 15:02:54');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (136,'123',123,'F','SELECT * FROM STUDENT','20/07/08 15:18:56');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (141,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:27:50');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (142,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:30:45');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (144,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:31:51');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (147,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:32:46');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (151,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:34:47');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (152,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:34:53');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (161,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:38:57');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (163,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:39:57');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (181,'solar',124,'T','SELECT * FROM STUDENT','20/07/09 16:36:16');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (182,'solar',121,'T','SELECT STU_NAME FROM STUDENT','20/07/09 16:36:42');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (223,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:50:26');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (229,'123',10001,'F','public static int answer(int m){
int answer = 0;
for(int i=1;i<=m;i++){
answer+=i;
}
return answer;
}','20/07/16 11:04:38');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (235,'123',10001,'T','public static int solution(int m){
int answer = 0;
for(int i=1;i<=m;i++){
answer+=i;
}
return answer;
}
','20/07/16 11:11:15');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (122,'star',121,'F','SELECT * FROM STUDENT','20/07/08 15:03:12');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (123,'star',122,'T','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''김%''','20/07/08 15:03:26');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (148,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:33:10');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (149,'123',124,'T','SELECT * FROM STUDENT','20/07/08 15:33:32');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (201,'123',123,'T','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''','20/07/13 14:00:24');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (224,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:51:29');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (225,'123',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/16 10:52:16');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (233,'123',10001,'F','public static int answer(int m){
int answer = 0;

return ((m+1)*m)/2;
}
','20/07/16 11:10:05');
REM INSERTING into C##ORA_USER.STUDENT
SET DEFINE OFF;
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20153075 ','옥한빛','기계',1,'C','M',177,80);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20153088 ','이태연','기계',1,'C','F',162,50);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20143054 ','유가인','기계',2,'C','F',154,47);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20152088 ','조민우','전기전자',1,'C','M',188,90);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20142021 ','심수정','전기전자',2,'A','F',168,45);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20132003 ','박희철','전기전자',3,'B','M',null,63);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20151062 ','김인중','컴퓨터정보',1,'B','M',166,67);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20141007 ','진현무','컴퓨터정보',2,'A','M',174,64);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20131001 ','김종헌','컴퓨터정보',3,'C','M',null,72);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20131025 ','옥성우','컴퓨터정보',3,'A','F',172,63);
REM INSERTING into C##ORA_USER.PROBLEM
SET DEFINE OFF;
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (127,'진진진진','SELECT * FROM STUDENT','SELECT * FROM STUDENT');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (128,'진진진진진','SELECT * FROM STUDENT','SELECT * FROM STUDENT');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (122,'김씨 문제','이름이 김 씨 성을 가진 사람을 모두 출력하라
STUDENT 테이블에서 김시 썽을 가진 사람의 이름을 출력하라.

답: SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''김%''','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''김%''');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (123,'[나]로 끝나는 사람은?','STUDENT 테이블 이름이 나로 끝나는 사람을 모두 출력하라
이름 칼럼 = STUDENT_NAME

SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (125,'진진','SELECT * FROM STUDENT','SELECT * FROM STUDENT');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (126,'진진진','SELECT * FROM STUDENT','SELECT * FROM STUDENT');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (141,'1주차 조회문제','select * from STUDENT','select * from STUDENT');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (142,'sdgfsdf','select * from STUDENT','asdsa');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (121,'STU_NAME 문제','STUDENT 테이블에서 STU_NAME 를 출력하라


답
SELECT STU_NAME FROM STUDENT
','SELECT STU_NAME FROM STUDENT');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (124,'진','SELECT * FROM STUDENT','SELECT * FROM STUDENT');
REM INSERTING into C##ORA_USER.MEMBER
SET DEFINE OFF;
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('chacha','chacha','chacha','chacha','chacha','나는 차승훈');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('123','123','123','123','123','나 123이야');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('star','star','star','star','star','5성');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('solar','solar','solar','solar','solar','승훈');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('luna','luna','luna','luna','luna','배고픔');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('copy1','copy1','copy1','copy1','copy1','ctrl c, v');
--------------------------------------------------------
--  DDL for Index SYS_C007405
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."SYS_C007405" ON "C##ORA_USER"."SUBMIT_LOG" ("SUB_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index P_STU_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."P_STU_NO" ON "C##ORA_USER"."STUDENT" ("STU_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007403
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."SYS_C007403" ON "C##ORA_USER"."MEMBER" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SUBMIT_LOG
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."SUBMIT_LOG" ADD PRIMARY KEY ("SUB_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."STUDENT" ADD CONSTRAINT "P_STU_NO" PRIMARY KEY ("STU_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."MEMBER" MODIFY ("M_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."MEMBER" MODIFY ("M_PW" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."MEMBER" ADD PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
