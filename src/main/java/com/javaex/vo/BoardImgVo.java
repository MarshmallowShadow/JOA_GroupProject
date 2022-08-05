package com.javaex.vo;

public class BoardImgVo {
	
	//필드
	private int boardImgNo; /* 사진번호 */
	private int boardNo; /* 게시판 번호 */
	private String saveName; /* 저장 파일명 */
	private String filePath; /* 파일경로 */
	private int orderNo; /* 사진 순서 */
	
	//생성자
	public BoardImgVo() {}

	public BoardImgVo(int boardImgNo, int boardNo, String saveName, String filePath, int orderNo) {
		this.boardImgNo = boardImgNo;
		this.boardNo = boardNo;
		this.saveName = saveName;
		this.filePath = filePath;
		this.orderNo = orderNo;
	}

	//메소드-gs
	public int getBoardImgNo() {
		return boardImgNo;
	}

	public void setBoardImgNo(int boardImgNo) {
		this.boardImgNo = boardImgNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	//메소드-일반
	@Override
	public String toString() {
		return "BoardImgVo [boardImgNo=" + boardImgNo + ", boardNo=" + boardNo + ", saveName=" + saveName
				+ ", filePath=" + filePath + ", orderNo=" + orderNo + "]";
	}

}
