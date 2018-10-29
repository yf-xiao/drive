package com.entity;

public class Users {
	private String usersid;
	private String username;
	private String password;
	private String realname;
	private String sex;
	private String birthday;
	private String contact;
	private String regdate;
	private String dcard;
	private String image;
	
	public String getUsersid() {
		return usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getRegdate() {
		return this.regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getDcard() {
		return dcard;
	}

	public void setDcard(String dcard) {
		this.dcard = dcard;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
