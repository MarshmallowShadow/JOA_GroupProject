package com.javaex.vo;

public class BoardVo {
	
	//필드
	private int boardNo; /* 게시판 번호 */
	private int userNo; /* 회원번호 */
	private int courseNo; /* 코스번호 */
	private int eventNo; /* 이벤트 번호 */
	private String boardCategory; /* 항목 */
	private String title; /* 제목 */
	private String content; /* 내용 */
	private String regDate; /* 등록일 */
	private int viewCount; /* 조회수 */
	
	//생성자
	public BoardVo() {}
	
	public BoardVo(int boardNo, int userNo, int courseNo, int eventNo, String boardCategory, String title,
			String content, String regDate, int viewCount) {
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.courseNo = courseNo;
		this.eventNo = eventNo;
		this.boardCategory = boardCategory;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.viewCount = viewCount;
	}
	
	//메소드-gs
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	//메소드-일반
	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", userNo=" + userNo + ", courseNo=" + courseNo + ", eventNo=" + eventNo
				+ ", boardCategory=" + boardCategory + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", viewCount=" + viewCount + "]";
	}
}
