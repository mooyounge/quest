package com.quest.vo;

public class Post_like {
	private int post_like_id;
	private String user_id;
	private String user_ip;
	private int post_id;
	private String post_like;
	private String post_info_like;
	public int getPost_like_id() {
		return post_like_id;
	}
	public void setPost_like_id(int post_like_id) {
		this.post_like_id = post_like_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getPost_like() {
		return post_like;
	}
	public void setPost_like(String post_like) {
		this.post_like = post_like;
	}
	public String getPost_info_like() {
		return post_info_like;
	}
	public void setPost_info_like(String post_info_like) {
		this.post_info_like = post_info_like;
	}
}
