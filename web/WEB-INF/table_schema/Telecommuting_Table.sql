/* 21.01.02 수정 */

SELECT * FROM tab;
SELECT * FROM USER_SEQUENCES;

/* 부서 */
CREATE TABLE DEPARTMENT (
	D_IDX NUMBER(20) constraint D_PK primary key, /* 부서 번호 */
	D_NAME VARCHAR2(20) NOT NULL, /* 부서 이름 */
	D_PHONE VARCHAR2(20) NOT NULL /* 부서 연락처 */
);

/* 사원정보  */
CREATE TABLE MEMBER (
	M_IDX NUMBER(20) constraint M_PK primary key, /* 사원번호 */
	M_NAME VARCHAR2(20) NOT NULL, /* 이름 */
	M_ID VARCHAR2(20) NOT NULL, /* 아이디 */
	M_PW VARCHAR2(20) NOT NULL, /* 비밀번호 */
	M_PHONE VARCHAR2(15) NOT NULL, /* 연락처 */
	M_SUBPHONE VARCHAR2(15) NOT NULL, /* 비상연락처 */
	M_EMAIL VARCHAR2(40) NOT NULL, /* 이메일 */
	M_ADD VARCHAR2(40) NOT NULL, /* 주소 */
	M_EMPDATE DATE NOT NULL, /* 입사일 */
	D_IDX NUMBER(20) NOT NULL, /* 부서 번호 */
	M_PHOTO VARCHAR2(100) NOT NULL, /* 사진 */
	TOKEN VARCHAR2(200) NOT NULL, /* 토큰  */
	M_LEVEL NUMBER(6) NOT NULL, /* 레벨 (권한 등급) */
	CONSTRAINT MD_FK FOREIGN KEY(D_IDX) REFERENCES DEPARTMENT(D_IDX),
	CONSTRAINT UK_MEMBER UNIQUE(M_ID, M_PHONE, M_EMAIL)
);

/* 회의  */
CREATE TABLE CONFERENCE (
	C_IDX NUMBER(20) constraint C_PK primary key, /* 회의번호 */
	C_TITLE VARCHAR2(50) NOT NULL, /* 회의 제목 */
	C_CONTENT VARCHAR2(200) NOT NULL, /* 회의 내용 */
	M_IDX NUMBER(20) NOT NULL, /* 사원번호 */
	CONSTRAINT CM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX)
);

/* 게시판  */
CREATE TABLE BOARD (
	B_IDX NUMBER(20) constraint B_PK primary key, /* 게시판 번호 */
	B_TITLE VARCHAR2(50) NOT NULL, /* 게시판 제목 */
	B_CONTENT VARCHAR2(200) NOT NULL, /* 게시판 내용 */
	M_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	CONSTRAINT BM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX)
);

/* 근태  */
CREATE TABLE ATTENDANCE (
	A_IDX NUMBER(20) constraint A_PK primary key, /* 근태 번호 */
	A_GOTIME DATE NOT NULL, /* 출근시간 */
	A_OFFTIME DATE NOT NULL, /* 퇴근시간 */
	A_PLACE_LAT VARCHAR2(100) NOT NULL, /* 현재 위치_위도*/
	A_PLACE_LON VARCHAR2(100) NOT NULL, /* 현재 위치 _경도*/
	M_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	CONSTRAINT AM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX)
);

/* 개인업무 */
CREATE TABLE INDIVIDUAL_WORK (
	IW_IDX NUMBER(20) constraint I_PK primary key, /* 개인업무 번호 */
	IW_TITLE VARCHAR2(20) NOT NULL, /* 개인업무 제목 */
	IW_CONTENT VARCHAR2(100) NOT NULL, /* 개인업무 내용 */
	M_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	CONSTRAINT IWM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX)
);

/* 부서 업무 */
CREATE TABLE DEPARTMENT_WORK (
	DW_IDX NUMBER(20) constraint DW_PK primary key, /* 부서 업무 번호 */
	DW_TITLE VARCHAR2(20) NOT NULL, /* 제목 */
	DW_CONTENT VARCHAR2(100) NOT NULL, /* 내용 */
	DW_SCHEDULE VARCHAR2(100) NOT NULL, /* 스케줄 */
	DW_MONTHWORK VARCHAR2(100) NOT NULL, /* 월간 업무 */
	DW_WEEKWORK VARCHAR2(100) NOT NULL, /* 주간 업무 */
	D_IDX NUMBER(20) NOT NULL, /* 부서 번호 */
	CONSTRAINT DWD_FK FOREIGN KEY(D_IDX) REFERENCES DEPARTMENT(D_IDX)
);

  /* ------------------------------------------------------------- */

/* 사원정보 테이블 보기 */
SELECT * FROM MEMBER;

/* 회의 테이블 보기 */
SELECT * FROM CONFERENCE;

/* 게시판 테이블 보기 */
SELECT * FROM BOARD;

/* 근태 테이블 보기 */
SELECT * FROM ATTENDANCE;

/* 개인업무 테이블 보기 */
SELECT * FROM INDIVIDUAL_WORK;

/* 부서 테이블 보기 */
SELECT * FROM DEPARTMENT;

/* 부서 업무 테이블 보기 */
SELECT * FROM DEPARTMENT_WORK;

  /* ------------------------------------------------------------- */

/* 사원정보 삭제 */
DROP TABLE MEMBER CASCADE CONSTRAINTS;

/* 회의 삭제 */
DROP TABLE CONFERENCE CASCADE CONSTRAINTS;

/* 게시판 삭제 */
DROP TABLE BOARD CASCADE CONSTRAINTS;

/* 근태 삭제 */
DROP TABLE ATTENDANCE CASCADE CONSTRAINTS;

/* 개인업무 삭제 */
DROP TABLE INDIVIDUAL_WORK CASCADE CONSTRAINTS;

/* 부서 삭제 */
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;

/* 부서 업무 삭제 */
DROP TABLE DEPARTMENT_WORK CASCADE CONSTRAINTS;

  /* ------------------------------------------------------------- */

/* 사원번호 시퀀스 생성 */
CREATE SEQUENCE SQ_MIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

/* 회의번호 시퀀스 생성 */
CREATE SEQUENCE SQ_CIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

/* 게시판 시퀀스 생성 */
CREATE SEQUENCE SQ_BIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

/* 근태 시퀀스 생성 */
CREATE SEQUENCE SQ_AIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

/* 개인업무 시퀀스 생성 */
CREATE SEQUENCE SQ_IWIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

/* 부서 시퀀스 생성 */
CREATE SEQUENCE SQ_DIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

/* 부서 업무 시퀀스 생성 */
CREATE SEQUENCE SQ_DWIDX INCREMENT BY 1  START WITH 100 NOCYCLE NOCACHE; /* 사원번호 생성 */

  /* ------------------------------------------------------------- */

/* 사원번호 시퀀스 삭제 */
drop sequence SQ_MIDX;

/* 회의번호 시퀀스 삭제 */
drop sequence SQ_CIDX;

/* 게시판 시퀀스 삭제 */
drop sequence SQ_BIDX;

/* 근태 시퀀스 삭제 */
drop sequence SQ_AIDX;

/* 개인업무 시퀀스 삭제 */
drop sequence SQ_IWIDX;

/* 부서 시퀀스 삭제 */
drop sequence SQ_DIDX;

/* 부서 업무 시퀀스 삭제 */
drop sequence SQ_DWIDX;

  /* ------------------------------------------------------------- */

insert into department values(sq_midx.nextval,'개발부','010-9999-8888');
								
insert into member values(sq_midx.nextval,'신동재','admin','admin',
							'010-1234-5678','010-2222-3333','n@n.com',
								'서울', sysdate, 105, '저장경로', 'TOKEN',1);

SELECT COUNT(M_ID) FROM MEMBER WHERE M_ID='admin' AND M_PW='admin'
select * from member
select * from attendance
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,SYSDATE,SYSDATE,'3','2',106)
SELECT * FROM ATTENDANCE WHERE M_IDX=106 AND A_IDX=104


