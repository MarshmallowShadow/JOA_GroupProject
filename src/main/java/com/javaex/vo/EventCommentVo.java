package com.javaex.vo;

public class EventCommentVo {
	
	//필드
	private int eCommentNo; /* 댓글번호 */
	private int eventNo; /* 이벤트 번호 */
	private int userNo; /* 작성자 회원번호 */
	private int mentionUser; /* 멘션 회원번호 */
	private String content; /* 내용 */
	private int groupNo; /* 최상위 댓글번호 */
	private int orderNo; /* 답글 순서 */
	private int depth; /* 댓글 계층 */
	
	//생성자
	public EventCommentVo() {}
	
	public EventCommentVo(int eCommentNo, int eventNo, int userNo, int mentionUser, String content, int groupNo,
			int orderNo, int depth) {
		this.eCommentNo = eCommentNo;
		this.eventNo = eventNo;
		this.userNo = userNo;
		this.mentionUser = mentionUser;
		this.content = content;
		this.groupNo = groupNo;
		this.orderNo = orderNo;
		this.depth = depth;
	}

	//메소드-gs
	public int geteCommentNo() {
		return eCommentNo;
	}

	public void seteCommentNo(int eCommentNo) {
		this.eCommentNo = eCommentNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
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
		return "EventCommentVo [eCommentNo=" + eCommentNo + ", eventNo=" + eventNo + ", userNo=" + userNo
				+ ", mentionUser=" + mentionUser + ", content=" + content + ", groupNo=" + groupNo + ", orderNo="
				+ orderNo + ", depth=" + depth + "]";
	}
	
}
