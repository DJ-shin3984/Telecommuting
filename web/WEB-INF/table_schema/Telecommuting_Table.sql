
/* 21.01.17 수정 */

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
	M_PW VARCHAR2(200) NOT NULL, /* 비밀번호 */
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
	C_TITLE VARCHAR2(50) NOT NULL,     /* 회의 제목 */
	C_CONTENT VARCHAR2(200) NOT NULL, /* 회의 내용 */
	C_DATE DATE NOT NULL,            /* 회의 작성 날짜*/
	M_IDX NUMBER(20) NOT NULL, /* 사원번호 */
	D_IDX NUMBER(20) NOT NULL, /* 부서번호 */
	CONSTRAINT CM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX) on delete cascade,
	CONSTRAINT CD_FK FOREIGN KEY(D_IDX) REFERENCES DEPARTMENT(D_IDX) on delete cascade
);

/* 게시판  */
CREATE TABLE BOARD (
	B_IDX NUMBER(20) constraint B_PK primary key, /* 게시판 번호 */
	B_TITLE VARCHAR2(50) NOT NULL, /* 게시판 제목 */
	B_CONTENT VARCHAR2(200) NOT NULL, /* 게시판 내용 */
	B_DATE DATE NOT NULL,            /* 게시판 작성 날짜*/
	M_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	D_IDX NUMBER(20) NOT NULL, /* 부서번호 */
	CONSTRAINT BM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX) on delete cascade,
	CONSTRAINT BD_FK FOREIGN KEY(D_IDX) REFERENCES DEPARTMENT(D_IDX) on delete cascade
);

/* 근태  */
CREATE TABLE ATTENDANCE (
	A_IDX NUMBER(20) constraint A_PK primary key, /* 근태 번호 */
	A_GOTIME VARCHAR2(50) NOT NULL, /* 출근시간 */
	A_OFFTIME VARCHAR2(50) NOT NULL, /* 퇴근시간 */
	A_PLACE_LAT VARCHAR2(100) NOT NULL, /* 현재 위치_위도*/
	A_PLACE_LON VARCHAR2(100) NOT NULL, /* 현재 위치 _경도*/
	M_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	D_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	CONSTRAINT AM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX) on delete cascade,
	CONSTRAINT AD_FK FOREIGN KEY(D_IDX) REFERENCES DEPARTMENT(D_IDX) on delete cascade
);

/* 개인업무 */
CREATE TABLE INDIVIDUAL_WORK (
	IW_IDX NUMBER(20) constraint I_PK primary key, /* 개인업무 번호 */
	IW_TITLE VARCHAR2(20) NOT NULL, /* 개인업무 제목 */
	IW_CONTENT VARCHAR2(100) NOT NULL, /* 개인업무 내용 */
	M_IDX NUMBER(20) NOT NULL, /* 사원 번호 */
	CONSTRAINT IWM_FK FOREIGN KEY(M_IDX) REFERENCES MEMBER(M_IDX) on delete cascade
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
	CONSTRAINT DWD_FK FOREIGN KEY(D_IDX) REFERENCES DEPARTMENT(D_IDX) on delete cascade
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
select * from department;
insert into department values(sq_didx.nextval,'개발부','010-9999-8888');
insert into department values(sq_didx.nextval,'경영기획부','010-9999-8888');
insert into department values(sq_didx.nextval,'영업부','010-9999-8888');
insert into department values(sq_didx.nextval,'생산부','010-9999-8888');
insert into department values(sq_didx.nextval,'인사과','010-9999-8888');
insert into department values(sq_didx.nextval,'최고부','010-9999-8888');
								
insert into member values(sq_midx.nextval,'신동재','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
							'010-1234-5678','010-2222-3333','n@n.com',
								'서울', sysdate, 105, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'개똥이','aaaa','61be55a8e2f6b4e172338bddf184d6dbee29c98853e0a0485ecee7f27b9af0b4',
							'010-1234','010-2222','n@n.com',
								'서울', sysdate, 105, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'진달래','bbbb','81cc5b17018674b401b42f35ba07bb79e211239c23bffe658da1577e3e646877',
							'010-5678','010-3333','n@n.com',
								'서울', sysdate, 105, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'데이트','date','0e87632cd46bd4907c516317eb6d81fe0f921a23c7643018f21292894b470681',
							'010-5678','010-3333','n@n.com',
								'서울', sysdate, 105, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'소나무','cccc','b6fbd675f98e2abd22d4ed29fdc83150fedc48597e92dd1a7a24381d44a27451',
							'010-5678','010-3333','n@n.com',
								'서울', '21-01-11', 104, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'대나무','asdf','f0e4c2f76c58916ec258f246851bea091d14d4247a2fc3e18694461b1816e13b',
							'010-5678','010-3333','n@n.com',
								'서울', '21-01-11', 104, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'키보드','dddd','5bf8aa57fc5a6bc547decf1cc6db63f10deb55a3c6c5df497d631fb3d95e1abf',
							'010-5678','010-3333','n@n.com',
								'서울', TO_DATE('20210908','yyyymmdd'), 103, '2021-01-09car1.png', 'TOKEN',1);
insert into member values(sq_midx.nextval,'달력','cal','f28c5d59eb1307e88ffc2943867931a33eaa9dbd2e246e40e60c1c12139bd960',
							'010-5678','010-3333','n@n.com',
								'서울', TO_DATE('20210908','yyyymmdd'), 103, '2021-01-09car1.png', 'TOKEN',1);
	 
								
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,'2021년 01월 12일 08시 40분 12초','아직 퇴근안함','3','2',100,105);
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,' ','아직 퇴근안함','3','2',101,105);
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,'2021년 01월 12일 09시 02분 32초','아직 퇴근안함','3','2',103,105);
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,'2021년 01월 12일 08시 42분 22초','아직 퇴근안함','3','2',104,104);
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,'2021년 01월 12일 10시 42분 47초','아직 퇴근안함','3','2',105,104);
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,'2021년 01월 12일 08시 55분 02초','아직 퇴근안함','3','2',106,103);
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL,'2021년 01월 12일 09시 44분 17초','아직 퇴근안함','3','2',107,103);


INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '첫 회의', '등록하느라바쁨', SYSDATE, '101', '105' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '두번째 회의', '생각하기 바쁨', SYSDATE, '102', '105' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '2주차 회의', '적기 바쁨', SYSDATE, '103', '103' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '3주차 회의', '뭐라는겨 바쁨', SYSDATE, '102', '103' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '4주차 회의', '할말없 바쁨', SYSDATE, '104', '104' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '2월 1주차 회의', '아아아아 바쁨', SYSDATE, '104', '104' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '2월 2주차 회의', '훍뚫 바쁨', SYSDATE, '105', '105' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '2월 3주차 회의', 'ㄱㄴㄷㄻ 바쁨', SYSDATE, '105', '103' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '2월 4주차 회의', '자음모음 바쁨', SYSDATE, '101', '102' );
INSERT INTO CONFERENCE VALUES(SQ_CIDX.NEXTVAL, '3월 1주차 회의', '에비쒸 바쁨', SYSDATE, '102', '105' );

INSERT INTO DEPARTMENT_WORK(DW_IDX, DW_TITLE, DW_CONTENT, DW_SCHEDULE, DW_MONTHWORK, DW_WEEKWORK, D_IDX)
			VALUES(SQ_DWIDX.NEXTVAL, '부서업무 1', '내용이다111', '09시 회의', '프로젝트 완성111', '합치기11', 105);
INSERT INTO DEPARTMENT_WORK(DW_IDX, DW_TITLE, DW_CONTENT, DW_SCHEDULE, DW_MONTHWORK, DW_WEEKWORK, D_IDX)
			VALUES(SQ_DWIDX.NEXTVAL, '부서업무 2', '내용이다222', '11시 회의', '안드로이드 완성', '옮기기!!', 105);
INSERT INTO DEPARTMENT_WORK(DW_IDX, DW_TITLE, DW_CONTENT, DW_SCHEDULE, DW_MONTHWORK, DW_WEEKWORK, D_IDX)
			VALUES(SQ_DWIDX.NEXTVAL, '부서업무 3', '내용이다333', '20시 회의', '디자인 완성', '꾸미기!!', 105);
INSERT INTO DEPARTMENT_WORK(DW_IDX, DW_TITLE, DW_CONTENT, DW_SCHEDULE, DW_MONTHWORK, DW_WEEKWORK, D_IDX)
			VALUES(SQ_DWIDX.NEXTVAL, '부서업무 4', '내용이다444', '19시 회의', '세부작업 완성', '세부묘사하기', 103);


INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '첫게시글', '첫게시글 내용', SYSDATE, '102', '105');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '22게시글', '인코딩깨진거아님', SYSDATE, '103', '105');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '33게시글', '막적기', SYSDATE, '102', '104');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '게시글44', '생각하기 ㄴㄴ', SYSDATE, '104', '103');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '55게시글', '뭘적냐', SYSDATE, '102', '105');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '게시글66', '첫게시글 내용@@', SYSDATE, '102', '105');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '77게시글', '게시글 내용!!', SYSDATE, '102', '105');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '게시글88', '!@게시글 내용', SYSDATE, '103', '103');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '99게시글', '게시글$ 내용', SYSDATE, '102', '103');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '열번째게시글', '게@글 내용', SYSDATE, '103', '105');
INSERT INTO BOARD(B_IDX, B_TITLE, B_CONTENT, B_DATE, M_IDX, D_IDX) 
	VALUES(SQ_BIDX.NEXTVAL, '첫게시글', '첫게시글 내용', SYSDATE, '102', '105');

	
INSERT INTO ATTENDANCE VALUES(SQ_AIDX.NEXTVAL, ' ', ' ', 
			'위도', '경도', 102, 105)
	
	
			
