package com.javaex.vo;

public class FavoriteCategoryVo {

	private int cateNo; //카테고리 번호
	private int userNo; //회원번호
	private String cateName; //카테고리 이름
	
	
	public FavoriteCategoryVo() {
	}
	public FavoriteCategoryVo(int cateNo, int userNo, String cateName) {
		this.cateNo = cateNo;
		this.userNo = userNo;
		this.cateName = cateName;
	}
	
	
	public int getCateNo() {
		return cateNo;
	}
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	
	@Override
	public String toString() {
		return "FavoriteCategoryVo [cateNo=" + cateNo + ", userNo=" + userNo + ", cateName=" + cateName + "]";
	}
	
	
}
