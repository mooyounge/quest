package com.quest.vo;

import java.util.List;

public class Board {
	private String game_abb;
	private int board_id;
	private String board_name;
	
	private List<Post> postList;
	
	
	public String getGame_abb() {
		return game_abb;
	}
	public void setGame_abb(String game_abb) {
		this.game_abb = game_abb;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public List<Post> getPostList() {
		return postList;
	}
	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}
	
	
}
