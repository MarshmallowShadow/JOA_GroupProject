package com.javaex.vo;

public class EventCommentVo {
	
	//필드
	private int eCommentNo; /* 댓글번호 */
	private int eventNo; /* 이벤트 번호 */
	private int userNo; /* 작성자 회원번호 */
	private Integer mentionUser; /* 멘션 회원번호 */
	private String content; /* 내용 */
	
	//생성자
	public EventCommentVo() {}
	
	public EventCommentVo(int eCommentNo, int eventNo, int userNo, Integer mentionUser, String content) {
		this.eCommentNo = eCommentNo;
		this.eventNo = eventNo;
		this.userNo = userNo;
		this.mentionUser = mentionUser;
		this.content = content;
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
		return "EventCommentVo [eCommentNo=" + eCommentNo + ", eventNo=" + eventNo + ", userNo=" + userNo
				+ ", mentionUser=" + mentionUser + ", content=" + content + "]";
	}
	
}
