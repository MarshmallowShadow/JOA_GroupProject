package com.javaex.vo;

public class MyReportVo {

	//
	private int recordNo; // 기록번호
	private int courseNo; // 코스번호
	private int userNo; // 등록 사용자 번호
	private String title; // 제목
	private String review; // 한줄평
	private String regDate; // 등록일

	
	
	//
	public MyReportVo() {
	}

	public MyReportVo(int recordNo, int courseNo, int userNo, String title, String review, String regDate) {
		this.recordNo = recordNo;
		this.courseNo = courseNo;
		this.userNo = userNo;
		this.title = title;
		this.review = review;
		this.regDate = regDate;
	}
	
	
	
	//
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	

	//
	@Override
	public String toString() {
		return "MyReportVo [recordNo=" + recordNo + ", courseNo=" + courseNo + ", userNo=" + userNo + ", title=" + title
				+ ", review=" + review + ", regDate=" + regDate + "]";
	}

	
}
