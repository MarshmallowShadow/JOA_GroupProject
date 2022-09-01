package com.javaex.vo;

public class BoardCommentVo {
	
	//필드
	private int bCommentNo; /* 댓글번호 */
	private int boardNo; /* 게시판 번호 */
	private int userNo; /* 작성자 회원번호 */
	private Integer mentionUser; /* 멘션 회원번호 */
	private String content; /* 내용 */
	
	//생성자
	public BoardCommentVo() {}
	
	public BoardCommentVo(int bCommentNo, int boardNo, int userNo, Integer mentionUser, String content) {
		this.bCommentNo = bCommentNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.mentionUser = mentionUser;
		this.content = content;
	}

	//메소드-gs
	public int getbCommentNo() {
		return bCommentNo;
	}

	public void setbCommentNo(int bCommentNo) {
		this.bCommentNo = bCommentNo;
	}

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

	public Integer getMentionUser() {
		return mentionUser;
	}

	public void setMentionUser(Integer mentionUser) {
		this.mentionUser = mentionUser;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	//메소드-일반
	@Override
	public String toString() {
		return "BoardCommentVo [bCommentNo=" + bCommentNo + ", boardNo=" + boardNo + ", userNo=" + userNo
				+ ", mentionUser=" + mentionUser + ", content=" + content + "]";
	}
	
}
