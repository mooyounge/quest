package com.quest.vo;

public class Post {
	private int post_id;
	private int board_id;
	private String user_id;
	private String post_title;
	private String content;
	private String post_regdate;
	private int post_like;
	private int post_dislike;
	private int post_lookup;
	public int getPost_lookup() {
		return post_lookup;
	}
	public void setPost_lookup(int post_lookup) {
		this.post_lookup = post_lookup;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPost_regdate() {
		return post_regdate;
	}
	public void setPost_regdate(String post_regdate) {
		this.post_regdate = post_regdate;
	}
	public int getPost_like() {
		return post_like;
	}
	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
	public int getPost_dislike() {
		return post_dislike;
	}
	public void setPost_dislike(int post_dislike) {
		this.post_dislike = post_dislike;
	}
	
}
