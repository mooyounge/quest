package com.quest.vo;

import javax.validation.constraints.Pattern;

public class User {
	@Pattern(regexp="[A-Za-z0-9]{4,15}", 
			 message="아이디는 영대소문자 및 숫자만 가능, 길이:4~15글자")
	private String id;
	@Pattern(regexp="[A-Za-z0-9]{4,15}", 
			 message="아이디는 영대소문자 및 숫자만 가능, 길이:4~15글자")
	private String password;
	@Pattern(regexp="[A-Za-z0-9가-힣]{2,30}", 
			 message="닉네임은 한글, 영대소문자 및 숫자만 가능, 길이:2~30글자")
	private String nicname;
	private int ban_confirm;
	private String ban_time;
	
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
	public int getBan_confirm() {
		return ban_confirm;
	}
	public void setBan_confirm(int ban_confirm) {
		this.ban_confirm = ban_confirm;
	}
	public String getBan_time() {
		return ban_time;
	}
	public void setBan_time(String ban_time) {
		this.ban_time = ban_time;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	
	
}
