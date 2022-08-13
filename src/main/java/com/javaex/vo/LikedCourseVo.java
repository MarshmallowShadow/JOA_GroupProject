package com.javaex.vo;

public class LikedCourseVo {

	private int userNo; //회원번호
	private int courseNo; //코스번호
	private String likeDate; //좋아요 누른 시간
	
	
	public LikedCourseVo() {
	}
	public LikedCourseVo(int userNo, int courseNo, String likeDate) {
		this.userNo = userNo;
		this.courseNo = courseNo;
		this.likeDate = likeDate;
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
	public String getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}
	
	
	@Override
	public String toString() {
		return "LikedCourseVo [userNo=" + userNo + ", courseNo=" + courseNo + ", likeDate=" + likeDate + "]";
	}
	
	
}
