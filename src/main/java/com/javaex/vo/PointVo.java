package com.javaex.vo;

public class PointVo {

	private int pointNo; //방향식변번호
	private int courseNo; //코스번호
	private int orderNo; //방향순서
	private double x; //x값
	private double y; //y값
	
	
	public PointVo() {
	}
	public PointVo(int pointNo, int courseNo, int orderNo, double x, double y) {
		this.pointNo = pointNo;
		this.courseNo = courseNo;
		this.orderNo = orderNo;
		this.x = x;
		this.y = y;
	}
	
	
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	
	
	@Override
	public String toString() {
		return "PointVo [pointNo=" + pointNo + ", courseNo=" + courseNo + ", orderNo=" + orderNo + ", x=" + x + ", y="
				+ y + "]";
	}
	
	
}
