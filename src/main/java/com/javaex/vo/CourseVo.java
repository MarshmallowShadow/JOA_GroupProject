package com.javaex.vo;

public class CourseVo {

	private int courseNo; //코스번호
	private int userNo; //회원번호
	private String title; //제목
	private double distance; //거리
	private String courseCate; //종목
	private int courseTime; //코스시간
	private String difficulty; //난이도
	private String regDate; //등록일
	private String openStatus; //공개여부
	
	
	
	public CourseVo() {
	}
	public CourseVo(int courseNo, int userNo, String title, double distance, String courseCate, int courseTime,
			String difficulty, String regDate, String openStatus) {
		this.courseNo = courseNo;
		this.userNo = userNo;
		this.title = title;
		this.distance = distance;
		this.courseCate = courseCate;
		this.courseTime = courseTime;
		this.difficulty = difficulty;
		this.regDate = regDate;
		this.openStatus = openStatus;
	}
	
	
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public String getCourseCate() {
		return courseCate;
	}
	public void setCourseCate(String courseCate) {
		this.courseCate = courseCate;
	}
	public int getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(int courseTime) {
		this.courseTime = courseTime;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getOpenStatus() {
		return openStatus;
	}
	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
	}
	
	
	@Override
	public String toString() {
		return "CourseVo [courseNo=" + courseNo + ", userNo=" + userNo + ", title=" + title + ", distance=" + distance
				+ ", courseCate=" + courseCate + ", courseTime=" + courseTime + ", difficulty=" + difficulty
				+ ", regDate=" + regDate + ", openStatus=" + openStatus + "]";
	}

	

}
