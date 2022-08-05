package com.javaex.vo;

public class RecordImgVo {

	private int RecordImgNo; //사진번호
	private int RecordNo; //기록번호
	private String saveName; //저장파일명
	private String filePath; //파일경로
	private int orderNo; //사진순서
	
	
	public RecordImgVo() {
	}
	public RecordImgVo(int recordImgNo, int recordNo, String saveName, String filePath, int orderNo) {
		RecordImgNo = recordImgNo;
		RecordNo = recordNo;
		this.saveName = saveName;
		this.filePath = filePath;
		this.orderNo = orderNo;
	}
	
	
	public int getRecordImgNo() {
		return RecordImgNo;
	}
	public void setRecordImgNo(int recordImgNo) {
		RecordImgNo = recordImgNo;
	}
	public int getRecordNo() {
		return RecordNo;
	}
	public void setRecordNo(int recordNo) {
		RecordNo = recordNo;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	
	@Override
	public String toString() {
		return "RecordImgVo [RecordImgNo=" + RecordImgNo + ", RecordNo=" + RecordNo + ", saveName=" + saveName
				+ ", filePath=" + filePath + ", orderNo=" + orderNo + "]";
	}
	
	
}
