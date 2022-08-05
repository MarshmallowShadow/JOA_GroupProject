package com.javaex.vo;

public class EventTaggedVo {
	
	//필드
	private int userNo; /* 회원번호 */
	private int eventNo; /* 이벤트 번호 */
	
	
	//생성자
	public EventTaggedVo() {}
	
	public EventTaggedVo(int userNo, int eventNo) {
		this.userNo = userNo;
		this.eventNo = eventNo;
	}

	//메소드-gs
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	//메소드-일반
	@Override
	public String toString() {
		return "EventTaggedVo [userNo=" + userNo + ", eventNo=" + eventNo + "]";
	}
	
}
