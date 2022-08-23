/* 사용자 */
DROP TABLE USERS 
	CASCADE CONSTRAINTS;

/* 코스 */
DROP TABLE COURSE 
	CASCADE CONSTRAINTS;

/* 기록 */
DROP TABLE RECORD 
	CASCADE CONSTRAINTS;

/* 기록사진 */
DROP TABLE RECORD_IMG 
	CASCADE CONSTRAINTS;

/* 방향 */
DROP TABLE POINT 
	CASCADE CONSTRAINTS;

/* 즐겨찾기 카테고리 */
DROP TABLE FAVORITE_CATEGORY 
	CASCADE CONSTRAINTS;

/* 즐겨찾기 코스 */
DROP TABLE FAVORITE_COURSE 
	CASCADE CONSTRAINTS;

/* 좋아요 코스 */
DROP TABLE LIKED_COURSE 
	CASCADE CONSTRAINTS;

/* 함께하기 */
DROP TABLE EVENT 
	CASCADE CONSTRAINTS;

/* 이벤트 댓글 */
DROP TABLE EVENT_COMMENT 
	CASCADE CONSTRAINTS;

/* 참여한 이벤트 */
DROP TABLE EVENT_JOINED 
	CASCADE CONSTRAINTS;

/* 태그한 이벤트 */
DROP TABLE EVENT_TAGGED 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE BOARD 
	CASCADE CONSTRAINTS;

/* 게시판 댓글 */
DROP TABLE BOARD_COMMENT 
	CASCADE CONSTRAINTS;

/* 게시판 사진 */
DROP TABLE BOARD_IMG 
	CASCADE CONSTRAINTS;

/* 1:1 게시판 사진 */
DROP TABLE Q_LIST
	CASCADE CONSTRAINTS;
	
/* 1:1 게시판 댓글 */
DROP TABLE Q_LIST_COMMENT 
	CASCADE CONSTRAINTS;

/* 시퀀스 */
DROP SEQUENCE SEQ_USER_NO;
DROP SEQUENCE SEQ_COURSE_NO;
DROP SEQUENCE SEQ_RECORD_NO;
DROP SEQUENCE SEQ_RECORD_IMG_NO;
DROP SEQUENCE SEQ_POINT_NO;
DROP SEQUENCE SEQ_CATE_NO;
DROP SEQUENCE SEQ_EVENT_NO;
DROP SEQUENCE SEQ_EVENT_COMMENT_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_BOARD_COMMENT_NO;
DROP SEQUENCE SEQ_BOARD_IMG_NO;
DROP SEQUENCE SEQ_Q_LIST_NO;
DROP SEQUENCE SEQ_Q_COMMENT_NO;

/* ********************** 시퀀스 생성 ********************** */
CREATE SEQUENCE SEQ_USER_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_COURSE_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_RECORD_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_RECORD_IMG_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_POINT_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_CATE_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_EVENT_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_EVENT_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_BOARD_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_BOARD_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_BOARD_IMG_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_Q_LIST_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_Q_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

/* ********************** 테이블 생성 ********************** */

/* 사용자 */
CREATE TABLE USERS (
	user_no NUMBER, /* 회원번호 */
	id VARCHAR2(20) NOT NULL UNIQUE, /* 아이디 */
	password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	name VARCHAR2(100) NOT NULL, /* 회원이름 */
	phone VARCHAR2(20) NOT NULL UNIQUE, /* 전화번호 */
	email VARCHAR2(200) NOT NULL UNIQUE, /* 이메일 */
	Primary Key (user_no)
);

/* ********************** 희지누나 ********************** */

/* 코스 */
CREATE TABLE COURSE (
	course_no NUMBER, /* 코스번호 */
	user_no NUMBER, /* 회원번호 */
	title VARCHAR2(100) NOT NULL, /* 제목 */
	distance NUMBER NOT NULL, /* 거리 */
	course_category VARCHAR2(50) NOT NULL, /* 종목 */
	course_time NUMBER NOT NULL, /* 코스시간 */
	difficulty VARCHAR2(100) NOT NULL, /* 난이도 */
	reg_date DATE NOT NULL, /* 등록일 */
	open_status VARCHAR2(50) NOT NULL, /* 공개여부 */
	Primary Key (course_no),
	CONSTRAINT course_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE
);

/* 기록 */
CREATE TABLE RECORD (
	record_no NUMBER, /* 기록번호 */
	course_no NUMBER, /* 코스번호 */
	user_no NUMBER, /* 등록 사용자 번호 */
	review VARCHAR2(500), /* 한줄평 */
	weather VARCHAR2(100), /* 날씨 */
	temperature NUMBER, /* 기온 */
	course_category VARCHAR2(50) NOT NULL, /* 종목 */
	course_time NUMBER NOT NULL, /* 코스시간 */
	difficulty VARCHAR2(100) NOT NULL, /* 난이도 */
	reg_date DATE NOT NULL, /* 등록일 */
	Primary Key (record_no),
	CONSTRAINT record_course_fk Foreign Key(course_no)
	references course(course_no)
	ON DELETE CASCADE,
	CONSTRAINT record_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE
);

/* 기록사진 */
CREATE TABLE RECORD_IMG (
	record_img_no NUMBER, /* 사진번호 */
	record_no NUMBER, /* 기록번호 */
	save_name VARCHAR2(500) NOT NULL, /* 저장 파일명 */
	file_path VARCHAR2(2000) NOT NULL, /* 파일경로 */
	order_no NUMBER NOT NULL, /* 사진 순서 */
	Primary Key (record_img_no),
	CONSTRAINT record_img_fk Foreign Key(record_no)
	references record(record_no)
	ON DELETE CASCADE
);

/* 방향 */
CREATE TABLE POINT (
	point_no NUMBER, /* 방향식변번호 */
	course_no NUMBER, /* 코스번호 */
	order_no NUMBER NOT NULL, /* 방향순서 */
	x NUMBER NOT NULL, /* x값 */
	y NUMBER NOT NULL, /* y값 */
	Primary Key (point_no),
	CONSTRAINT point_course_fk Foreign Key(course_no)
	references course(course_no)
	ON DELETE CASCADE
);

/* ********************** 경애누나 ********************** */

/* 즐겨찾기 카테고리 */
CREATE TABLE FAVORITE_CATEGORY (
	cate_no NUMBER, /* 카테고리 번호 */
	user_no NUMBER, /* 회원번호 */
	cate_name VARCHAR2(200) NOT NULL, /* 카테고리 이름 */
	Primary Key(cate_no),
	CONSTRAINT cate_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE
);

/* 즐겨찾기 코스 */
CREATE TABLE FAVORITE_COURSE (
	course_no NUMBER, /* 코스번호 */
	cate_no NUMBER, /* 카테고리 번호 */
	fav_date DATE NOT NULL, /* 즐겨찾기 추가 시간 */
	CONSTRAINT fav_course_fk Foreign Key(course_no)
	references course(course_no)
	ON DELETE CASCADE,
	CONSTRAINT fav_cate_fk Foreign Key(cate_no)
	references favorite_category(cate_no)
	ON DELETE CASCADE
);

/* 좋아요 코스 */
CREATE TABLE LIKED_COURSE (
	user_no NUMBER, /* 회원번호 */
	course_no NUMBER, /* 코스번호 */
	like_date DATE NOT NULL, /* 좋아요 누른 시간 */
	CONSTRAINT liked_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT liked_course_fk Foreign Key(course_no)
	references course(course_no)
	ON DELETE CASCADE
);

/* ********************** 가은이누나 ********************** */
/* 함께하기 */
CREATE TABLE EVENT (
	event_no NUMBER, /* 이벤트 번호 */
	user_no NUMBER, /* 회원번호 */
	course_no NUMBER, /* 코스번호 */
	event_title VARCHAR2(1000) NOT NULL, /* 제목 */
	content VARCHAR2(4000) NOT NULL, /* 내용 */
	place VARCHAR2(100) NOT NULL, /*모임 장소*/
	join_max NUMBER NOT NULL, /* 최대 인원수 */
	reg_start DATE NOT NULL, /* 등록 시작일 */
	reg_end DATE NOT NULL, /* 등록 마감일 */
	event_start DATE NOT NULL, /* 함께 하는 날 */
	Primary Key (event_no),
	CONSTRAINT event_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT event_course_fk Foreign Key(course_no)
	references course(course_no)
	ON DELETE CASCADE
);

/* 이벤트 댓글 */
CREATE TABLE EVENT_COMMENT (
	e_comment_no NUMBER, /* 댓글번호 */
	event_no NUMBER, /* 이벤트 번호 */
	user_no NUMBER, /* 작성자 회원번호 */
	mention_user NUMBER NULL, /* 멘션 회원번호 */
	content VARCHAR2(1000) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록일 */
	group_no NUMBER NOT NULL, /* 최상위 댓글번호 */
	order_no NUMBER NOT NULL, /* 답글 순서 */
	depth NUMBER NOT NULL, /* 댓글 계층 */
	Primary Key (e_comment_no),
	CONSTRAINT e_comment_event_fk Foreign Key(event_no)
	references event(event_no)
	ON DELETE CASCADE,
	CONSTRAINT e_comment_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT e_comment_mention_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE SET NULL
);

/* 참여한 이벤트 */
CREATE TABLE EVENT_JOINED (
	user_no NUMBER, /* 회원번호 */
	event_no NUMBER, /* 이벤트 번호 */
	CONSTRAINT join_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT join_event_fk Foreign Key(event_no)
	references event(event_no)
	ON DELETE CASCADE
);

/* 태그한 이벤트 */
CREATE TABLE EVENT_TAGGED (
	user_no NUMBER, /* 회원번호 */
	event_no NUMBER, /* 이벤트 번호 */
	CONSTRAINT tagged_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT tagged_event Foreign Key(event_no)
	references event(event_no)
	ON DELETE CASCADE
);


/* 게시판 */
CREATE TABLE BOARD (
	board_no NUMBER, /* 게시판 번호 */
	user_no NUMBER, /* 회원번호 */
	course_no NUMBER NULL, /* 코스번호 */
	event_no NUMBER NULL, /* 이벤트 번호 */
	board_category VARCHAR2(100) NOT NULL, /* 항목 */
	title VARCHAR2(200) NOT NULL, /* 제목 */
	content VARCHAR2(4000) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록일 */
	view_count NUMBER NOT NULL, /* 조회수 */
	Primary Key (board_no),
	CONSTRAINT board_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT board_course_fk Foreign Key(course_no)
	references course(course_no)
	ON DELETE SET NULL,
	CONSTRAINT board_event_fk Foreign Key(event_no)
	references event(event_no)
	ON DELETE SET NULL
);

/* 게시판 댓글 */
CREATE TABLE BOARD_COMMENT (
	b_comment_no NUMBER, /* 댓글번호 */
	board_no NUMBER, /* 게시판 번호 */
	user_no NUMBER, /* 작성자 회원번호 */
	mention_user NUMBER NULL, /* 멘션 회원번호 */
	content VARCHAR2(1000) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록일 */
	group_no NUMBER NOT NULL, /* 최상위 댓글번호 */
	order_no NUMBER NOT NULL, /* 답글 순서 */
	depth NUMBER NOT NULL, /* 댓글 계층 */
	Primary Key (b_comment_no),
	CONSTRAINT b_comment_board_fk Foreign Key(board_no)
	references board(board_no)
	ON DELETE CASCADE,
	CONSTRAINT b_comment_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE,
	CONSTRAINT b_comment_mention_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE SET NULL
);

/* 게시판 사진 */
CREATE TABLE BOARD_IMG (
	board_img_no NUMBER, /* 사진번호 */
	board_no NUMBER, /* 게시판 번호 */
	save_name VARCHAR2(500) NOT NULL, /* 저장 파일명 */
	file_path VARCHAR2(2000) NOT NULL, /* 파일경로 */
	order_no NUMBER NOT NULL, /* 사진 순서 */
	Primary Key (board_img_no),
	CONSTRAINT board_img_fk Foreign Key(board_no)
	references board(board_no)
	ON DELETE CASCADE
);

/* ********************** 수빈이누나 ********************** */
/* 1:1 게시판 */
CREATE TABLE Q_LIST (
	q_list_no NUMBER, /* 게시판 번호 */
	user_no NUMBER, /* 회원번호 */
	board_category VARCHAR2(100) NOT NULL, /* 항목 */
	title VARCHAR2(200) NOT NULL, /* 제목 */
	content VARCHAR2(4000) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록일 */
	view_count NUMBER NOT NULL, /* 조회수 */
	Primary Key (q_list_no),
	CONSTRAINT q_list_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE
);

/* 1:1 게시판 댓글 */
CREATE TABLE Q_LIST_COMMENT (
	q_comment_no NUMBER, /* 댓글번호 */
	q_list_no NUMBER, /* 게시판 번호 */
	user_no NUMBER, /* 작성자 회원번호 */
	content VARCHAR2(1000) NOT NULL, /* 내용 */
	reg_date DATE NOT NULL, /* 등록일 */
	Primary Key (q_comment_no),
	CONSTRAINT q_comment_list_fk Foreign Key(q_list_no)
	references q_list(q_list_no)
	ON DELETE CASCADE,
	CONSTRAINT q_comment_user_fk Foreign Key(user_no)
	references users(user_no)
	ON DELETE CASCADE
);