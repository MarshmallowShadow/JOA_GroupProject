package com.javaex.vo;

public class RecordVo {
	
	private int recordNo; //기록번호
	private int courseNo; //코스번호
	private int userNo; //등록 사용자 번호
	private String review; //한줄평
	private String weather; //날씨
	private double temperature; //기온
	private String courseCate; //종목
	private int courseTime; //코스시간
	private String difficulty; //난이도
	private String regDate; //등록일\
	
	
	
	public RecordVo() {
	}
	public RecordVo(int recordNo, int courseNo, int userNo, String review, String weather, double temperature,
			String courseCate, int courseTime, String difficulty, String regDate) {
		this.recordNo = recordNo;
		this.courseNo = courseNo;
		this.userNo = userNo;
		this.review = review;
		this.weather = weather;
		this.temperature = temperature;
		this.courseCate = courseCate;
		this.courseTime = courseTime;
		this.difficulty = difficulty;
		this.regDate = regDate;
	}
	
	
	public int getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
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
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public double getTemperature() {
		return temperature;
	}
	public void setTemperature(double temperature) {
		this.temperature = temperature;
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
	
	
	@Override
	public String toString() {
		return "RecordVo [recordNo=" + recordNo + ", courseNo=" + courseNo + ", userNo=" + userNo + ", review=" + review
				+ ", weather=" + weather + ", temperature=" + temperature + ", courseCate=" + courseCate
				+ ", courseTime=" + courseTime + ", difficulty=" + difficulty + ", regDate=" + regDate + "]";
	}
	
	
	
}
