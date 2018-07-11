package com.quest.vo;

import java.util.List;

import javax.validation.constraints.Size;


public class Post {
	private int rnum;
	
	private String game_abb;
	
	private int post_id;
	private int board_id;
	private String user_id;
	
	@Size(min=3,max=15,message="3~15글자 이내로 작성해 주세요.")
	private String post_title;
	
	@Size(min=3,max=500,message="3~500글자 이내로 작성해 주세요")
	private String post_content;
	
	private String post_regdate;
	private int post_like;
	private int post_dislike;
	private int post_info_like;
	private int post_info_dislike;
	private int post_lookup;
	
	private List<Comment> commentList;
	
	
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public String getGame_abb() {
		return game_abb;
	}
	public void setGame_abb(String game_abb) {
		this.game_abb = game_abb;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
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
	
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
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
	public int getPost_info_like() {
		return post_info_like;
	}
	public void setPost_info_like(int post_info_like) {
		this.post_info_like = post_info_like;
	}
	public int getPost_info_dislike() {
		return post_info_dislike;
	}
	public void setPost_info_dislike(int post_info_dislike) {
		this.post_info_dislike = post_info_dislike;
	}
	public void setPost_dislike(int post_dislike) {
		this.post_dislike = post_dislike;
	}
	
}
