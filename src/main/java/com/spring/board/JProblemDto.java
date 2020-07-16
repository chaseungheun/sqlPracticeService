package com.spring.board;

public class JProblemDto {

	private int p_num;
	private String p_title;
	private String p_body;
	private String p_answer;
	private String ok_cnt;
	private String sub_cnt;
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_body() {
		return p_body;
	}
	public void setP_body(String p_body) {
		this.p_body = p_body;
	}
	public String getP_answer() {
		return p_answer;
	}
	public void setP_answer(String p_answer) {
		this.p_answer = p_answer;
	}
	public String getSub_cnt() {
		return sub_cnt;
	}
	public void setSub_cnt(String sub_cnt) {
		this.sub_cnt = sub_cnt;
	}
	public String getOk_cnt() {
		return ok_cnt;
	}
	public void setOk_cnt(String ok_cnt) {
		this.ok_cnt = ok_cnt;
	}
}
