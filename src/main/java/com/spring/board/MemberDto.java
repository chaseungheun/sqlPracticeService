package com.spring.board;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String sql;
	private String p_cnt;
	private String log;
	public String getP_cnt() {
		return p_cnt;
	}
	public void setP_cnt(String p_cnt) {
		this.p_cnt = p_cnt;
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

}
