package com.voidmain.pojo;

public class BuyRequest {

	private int requestid;
	private String userid;
	private String wharehouse;
	private int pid;
	private String rdate;
	private String description;
	private String status;
	
	public int getRequestid() {
		return requestid;
	}
	public void setRequestid(int requestid) {
		this.requestid = requestid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWharehouse() {
		return wharehouse;
	}
	public void setWharehouse(String wharehouse) {
		this.wharehouse = wharehouse;
	}
}
