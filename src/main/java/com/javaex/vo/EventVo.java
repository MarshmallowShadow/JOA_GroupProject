package com.javaex.vo;

public class EventVo {
	
	//필드
	private int eventNo; /* 이벤트 번호 */
	private int userNo; /* 회원번호 */
	private int courseNo; /* 코스번호 */
	private String title; /* 제목 */
	private String content; /* 내용 */
	private int joinMax; /* 최대 인원수 */
	private String regStart; /* 등록 시작일 */
	private String regEnd; /* 등록 마감일 */
	private String eventStart; /* 함께 하는 날 */
	
	//생성자
	public EventVo() {}
	
	public EventVo(int eventNo, int userNo, int courseNo, String title, String content, int joinMax, String regStart,
			String regEnd, String eventStart) {
		this.eventNo = eventNo;
		this.userNo = userNo;
		this.courseNo = courseNo;
		this.title = title;
		this.content = content;
		this.joinMax = joinMax;
		this.regStart = regStart;
		this.regEnd = regEnd;
		this.eventStart = eventStart;
	}

	//메소드-gs
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

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
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

	public int getJoinMax() {
		return joinMax;
	}

	public void setJoinMax(int joinMax) {
		this.joinMax = joinMax;
	}

	public String getRegStart() {
		return regStart;
	}

	public void setRegStart(String regStart) {
		this.regStart = regStart;
	}

	public String getRegEnd() {
		return regEnd;
	}

	public void setRegEnd(String regEnd) {
		this.regEnd = regEnd;
	}

	public String getEventStart() {
		return eventStart;
	}

	public void setEventStart(String eventStart) {
		this.eventStart = eventStart;
	}

	//메소드-일반
	@Override
	public String toString() {
		return "EventVo [eventNo=" + eventNo + ", userNo=" + userNo + ", courseNo=" + courseNo + ", title=" + title
				+ ", content=" + content + ", joinMax=" + joinMax + ", regStart=" + regStart + ", regEnd=" + regEnd
				+ ", eventStart=" + eventStart + "]";
	}
	
}
