package com.javaex.vo;

public class BoardCommentVo {
	
	//필드
	private int bCommentNo; /* 댓글번호 */
	private int boardNo; /* 게시판 번호 */
	private int userNo; /* 작성자 회원번호 */
	private int mentionUser; /* 멘션 회원번호 */
	private String content; /* 내용 */
	private int groupNo; /* 최상위 댓글번호 */
	private int orderNo; /* 답글 순서 */
	private int depth; /* 댓글 계층 */
	
	//생성자
	public BoardCommentVo() {}
	
	public BoardCommentVo(int bCommentNo, int boardNo, int userNo, int mentionUser, String content, int groupNo,
			int orderNo, int depth) {
		this.bCommentNo = bCommentNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.mentionUser = mentionUser;
		this.content = content;
		this.groupNo = groupNo;
		this.orderNo = orderNo;
		this.depth = depth;
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

	public int getMentionUser() {
		return mentionUser;
	}

	public void setMentionUser(int mentionUser) {
		this.mentionUser = mentionUser;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	//메소드-일반
	@Override
	public String toString() {
		return "BoardCommentVo [bCommentNo=" + bCommentNo + ", boardNo=" + boardNo + ", userNo=" + userNo
				+ ", mentionUser=" + mentionUser + ", content=" + content + ", groupNo=" + groupNo + ", orderNo="
				+ orderNo + ", depth=" + depth + "]";
	}

}
