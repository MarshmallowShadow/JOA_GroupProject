--테이블 삭제
DROP TABLE RECORD_IMG;
DROP SEQUENCE seq_record_img_no;
DROP TABLE RECORD;
DROP SEQUENCE seq_record_no;
DROP TABLE DIRECTION;
DROP SEQUENCE seq_direction_no;
DROP TABLE COURSE;
DROP SEQUENCE seq_course_no;
DROP TABLE USERS;
DROP SEQUENCE seq_users_no;


--사용자
CREATE TABLE USERS (
	user_no NUMBER NOT NULL, /* 회원번호 */
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	name VARCHAR2(100) NOT NULL, /* 회원이름 */
	phone VARCHAR2(20) NOT NULL, /* 전화번호 */
	email VARCHAR2(200) NOT NULL, /* 이메일 */
    PRIMARY KEY (user_no)
);
create sequence seq_users_no
increment by 1
start with 1
nocache;

--코스
CREATE TABLE COURSE (
	course_no NUMBER NOT NULL, /* 코스번호 */
	user_no NUMBER NOT NULL, /* 회원번호 */
	title VARCHAR2(100) NOT NULL, /* 제목 */
	course_category VARCHAR2(50) NOT NULL, /* 종목 */
	course_time NUMBER NOT NULL, /* 코스시간 */
	difficulty VARCHAR2(100) NOT NULL, /* 난이도 */
	reg_date DATE NOT NULL, /* 등록일 */
    open_status VARCHAR2(50) NOT NULL, /* 공개여부 */
    primary key(course_no),
    constraint course_fk foreign key (user_no)
    references users(user_no)
);
create sequence seq_course_no
increment by 1
start with 1
nocache;

--방향
CREATE TABLE DIRECTION (
	dir_no NUMBER NOT NULL, /* 방향식변번호 */
	course_no NUMBER NOT NULL, /* 코스번호 */
	order_no NUMBER NOT NULL, /* 방향순서 */
	distance NUMBER NOT NULL, /* 거리 */
	start_x NUMBER NOT NULL, /* 시작점 x값 */
	start_y NUMBER NOT NULL, /* 시작점 y값 */
	end_x NUMBER NOT NULL, /* 끝점 x값 */
	end_y NUMBER NOT NULL, /* 끝점 y값 */
    primary key(dir_no),
    constraint direction_fk foreign key (course_no)
    references course(course_no)
);
create sequence seq_direction_no
increment by 1
start with 1
nocache;

--기록
CREATE TABLE RECORD (
	record_no NUMBER NOT NULL, /* 기록번호 */
	course_no NUMBER NOT NULL, /* 코스번호 */
	user_no NUMBER NOT NULL, /* 등록 사용자 번호 */
	review VARCHAR2(500), /* 한줄평 */
	weather VARCHAR2(100), /* 날씨 */
	temperature NUMBER, /* 기온 */
	course_category VARCHAR2(50) NOT NULL, /* 종목 */
	course_time NUMBER NOT NULL, /* 코스시간 */
	difficulty VARCHAR2(100) NOT NULL, /* 난이도 */
	reg_date DATE NOT NULL, /* 등록일 */
    primary key(record_no),
    constraint record_course_fk foreign key (course_no)
    references course(course_no),
    constraint record_user_fk foreign key (user_no)
    references users(user_no)
);
create sequence seq_record_no
increment by 1
start with 1
nocache;

--기록사진
CREATE TABLE RECORD_IMG (
	record_img_no NUMBER NOT NULL, /* 사진번호 */
	record_no NUMBER NOT NULL, /* 기록번호 */
	save_name VARCHAR2(500) NOT NULL, /* 저장 파일명 */
	file_path VARCHAR2(2000) NOT NULL, /* 파일경로 */
	order_no NUMBER NOT NULL, /* 사진 순서 */
    primary key(record_img_no),
    constraint record_img_fk foreign key (record_no)
    references record(record_no)
);
create sequence seq_record_img_no
increment by 1
start with 1
nocache;