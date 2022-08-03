package com.javaex.vo;

public class CourseVo {

	private int courseNo;
	private int userNo;
	private String userName;
	private String title;
	private String courseCate;
	private float distance;
	private String timeH;
	private String timeMi;
	private String difficulty;
	private String regDate;
	private String openStatus;
	
	
	public CourseVo() {
	}
	public CourseVo(int courseNo, int userNo, String userName, String title, String courseCate, float distance,
			String timeH, String timeMi, String difficulty, String regDate, String openStatus) {
		this.courseNo = courseNo;
		this.userNo = userNo;
		this.userName = userName;
		this.title = title;
		this.courseCate = courseCate;
		this.distance = distance;
		this.timeH = timeH;
		this.timeMi = timeMi;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCourseCate() {
		return courseCate;
	}
	public void setCourseCate(String courseCate) {
		this.courseCate = courseCate;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public String getTimeH() {
		return timeH;
	}
	public void setTimeH(String timeH) {
		this.timeH = timeH;
	}
	public String getTimeMi() {
		return timeMi;
	}
	public void setTimeMi(String timeMi) {
		this.timeMi = timeMi;
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
		return "CourseVo [courseNo=" + courseNo + ", userNo=" + userNo + ", userName=" + userName + ", title=" + title
				+ ", courseCate=" + courseCate + ", distance=" + distance + ", timeH=" + timeH + ", timeMi=" + timeMi
				+ ", difficulty=" + difficulty + ", regDate=" + regDate + ", openStatus=" + openStatus + "]";
	}
	

}
