package com.quest.vo;

import javax.validation.constraints.Size;

public class Comment {
    private int comment_id;
    private int post_id;
    private String user_id;
	@Size(min=2,max=10,message="2~10글자 이내로 작성해 주세요.")
    private String user_name;
	@Size(min=4,max=10,message="4~10글자 이내로 작성해 주세요.")
    private String password;
	@Size(min=3,max=200,message="3~200글자 이내로 작성해 주세요")
    private String comment_content;
    private String regdate;
    private int comment_like;
    private int comment_dislike;
    
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getComment_like() {
		return comment_like;
	}
	public void setComment_like(int comment_like) {
		this.comment_like = comment_like;
	}
	public int getComment_dislike() {
		return comment_dislike;
	}
	public void setComment_dislike(int comment_dislike) {
		this.comment_dislike = comment_dislike;
	}
    
    
}
