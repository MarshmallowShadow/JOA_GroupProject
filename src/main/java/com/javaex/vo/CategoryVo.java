package com.javaex.vo;

public class CategoryVo {
	
	//
	private int cateNo; //카테고리번호
	private int userNo; //회원번호
	private String cateName; //카테고리이름
		
	
	//
	public CategoryVo() {
	}
	
	public CategoryVo(int cateNo, String cateName) {
		this.cateNo = cateNo;
		this.cateName = cateName;
	}

	public CategoryVo(int cateNo, int userNo, String cateName) {
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
		
	
	//
	@Override
	public String toString() {
		return "CategoryVo [cateNo=" + cateNo + ", userNo=" + userNo + ", cateName=" + cateName + "]";
	}

}
