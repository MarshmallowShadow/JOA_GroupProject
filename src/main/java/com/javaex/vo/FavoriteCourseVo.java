package com.javaex.vo;

public class FavoriteCourseVo {

	private int courseNo; //코스 번호
	private int cateNo; //카테고리 번호
	private String favDate; //즐겨찾기 추가 시간
	
	
	public FavoriteCourseVo() {
	}
	public FavoriteCourseVo(int courseNo, int cateNo, String favDate) {
		this.courseNo = courseNo;
		this.cateNo = cateNo;
		this.favDate = favDate;
	}
	
	
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getCateNo() {
		return cateNo;
	}
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	public String getFavDate() {
		return favDate;
	}
	public void setFavDate(String favDate) {
		this.favDate = favDate;
	}
	
	
	@Override
	public String toString() {
		return "FavoriteCourseVo [courseNo=" + courseNo + ", cateNo=" + cateNo + ", favDate=" + favDate + "]";
	}
	
	
}
