package com.javaex.vo;

public class UserVo {
	
	//필드
	private int userNo;
	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	
	//생성자
	public UserVo() {
		
	}

	public UserVo(int userNo, String id, String password, String name, String phone, String email) {
		this.userNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}

	//매소드
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	//매소드 일반
	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", email=" + email + "]";
	}	

}
