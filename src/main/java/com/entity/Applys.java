package com.entity;

public class Applys {
	private String applysid;
	private String driversid;
	private double money;
	private String addtime;
	private String status;
	private String realname;
	private String withdrawtoWays;
	private String withdrawtoNum;
	
	
	public String getWithdrawtoWays() {
		return withdrawtoWays;
	}

	public void setWithdrawtoWays(String withdrawtoWays) {
		this.withdrawtoWays = withdrawtoWays;
	}

	public String getWithdrawtoNum() {
		return withdrawtoNum;
	}

	public void setWithdrawtoNum(String withdrawtoNum) {
		this.withdrawtoNum = withdrawtoNum;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getApplysid() {
		return applysid;
	}

	public void setApplysid(String applysid) {
		this.applysid = applysid;
	}

	public String getDriversid() {
		return this.driversid;
	}

	public void setDriversid(String driversid) {
		this.driversid = driversid;
	}
	
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
