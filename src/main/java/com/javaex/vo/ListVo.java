package com.javaex.vo;

public class ListVo {
	
	//필드
	private int qListNo; /* 게시판 번호 */
	private int userNo; /* 회원번호 */
	private String boardCategory; /* 코스번호 */
	private String title; /* 제목 */
	private String content; /* 내용 */
	private String regDate; /* 등록일 */
	private int viewCount; /* 조회수 */
	
	//생성자
	public ListVo() {
		
	}
	
	public ListVo(int qListNo, int userNo, String boardCategory, String title, String content, String regDate,
			int viewCount) {
		super();
		this.qListNo = qListNo;
		this.userNo = userNo;
		this.boardCategory = boardCategory;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.viewCount = viewCount;
	}

	//메소드
	public int getqListNo() {
		return qListNo;
	}

	public void setqListNo(int qListNo) {
		this.qListNo = qListNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	
	
	//메소드 일반
	@Override
	public String toString() {
		return "ListVo [qListNo=" + qListNo + ", userNo=" + userNo + ", boardCategory=" + boardCategory + ", title="
				+ title + ", content=" + content + ", regDate=" + regDate + ", viewCount=" + viewCount + "]";
	}
}
