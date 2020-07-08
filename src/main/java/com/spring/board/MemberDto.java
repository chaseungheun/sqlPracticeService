package com.spring.board;

public class MemberDto implements Comparable<MemberDto>{
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String sql;
	private String ok_cnt;
	private String sub_cnt;
	private String log;
	private String message;
	
	public String getOk_cnt() {
		return ok_cnt;
	}
	public void setOk_cnt(String ok_cnt) {
		this.ok_cnt = ok_cnt;
	}
	public String getSub_cnt() {
		return sub_cnt;
	}
	public void setSub_cnt(String sub_cnt) {
		this.sub_cnt = sub_cnt;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLog() {
		return log;
	}
	public void setLog(String log) {
		this.log = log;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public int compareTo(MemberDto o) {
		if(Integer.parseInt(this.getOk_cnt()) < Integer.parseInt(o.getOk_cnt())) {return 1;}
		return -1;
	}

}
