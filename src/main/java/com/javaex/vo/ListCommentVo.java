package com.javaex.vo;

public class ListCommentVo {
	
	//필드
	private int qCommentNo;		/* 댓글번호 */
	private int qListNo; 		/* 게시판 번호 */
	private int userNo;			/* 작성자 회원번호 */
	private int mentionNo; 		/* 회원번호 */
	private String content;		/* 내용 */
	private int groupNo;		/* 최상위 댓글번호 */
	private int orderNo;		/* 댓글순서 */
	private int depth;			/* 댓글계층 */
	
	
	//생성자
	public ListCommentVo() {
		
	}
	
	public ListCommentVo(int qCommentNo, int qListNo, int userNo, int mentionNo, String content, int groupNo, int orderNo,
			int depth) {
		super();
		this.qCommentNo = qCommentNo;
		this.qListNo = qListNo;
		this.userNo = userNo;
		this.mentionNo = mentionNo;
		this.content = content;
		this.groupNo = groupNo;
		this.orderNo = orderNo;
		this.depth = depth;
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

	public int getMentionNo() {
		return mentionNo;
	}

	public void setMentionNo(int mentionNo) {
		this.mentionNo = mentionNo;
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

	
	//메소드 일반
	@Override
	public String toString() {
		return "ListComment [qCommentNo=" + qCommentNo + ", qListNo=" + qListNo + ", userNo=" + userNo + ", mentionNo="
				+ mentionNo + ", content=" + content + ", groupNo=" + groupNo + ", orderNo=" + orderNo + ", depth="
				+ depth + "]";
	}
	
}
