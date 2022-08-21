package com.javaex.vo;

public class ListCommentVo {
	
	//필드
	private int qCommentNo;		/* 댓글번호 */
	private int qListNo; 		/* 게시판 번호 */
	private int userNo;			/* 작성자 회원번호 */
	private String content;		/* 내용 */
	
	
	//생성자
	public ListCommentVo() {
		
	}

	public ListCommentVo(int qCommentNo, int qListNo, int userNo, String content) {
		super();
		this.qCommentNo = qCommentNo;
		this.qListNo = qListNo;
		this.userNo = userNo;
		this.content = content;
	}

	//메소드
	public int getqCommentNo() {
		return qCommentNo;
	}


	public void setqCommentNo(int qCommentNo) {
		this.qCommentNo = qCommentNo;
	}


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


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "ListCommentVo [qCommentNo=" + qCommentNo + ", qListNo=" + qListNo + ", userNo=" + userNo + ", content="
				+ content + "]";
	}
}
