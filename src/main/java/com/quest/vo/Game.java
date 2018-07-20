package com.quest.vo;

import java.util.List;

public class Game {
	private String game_line;
	
	private String genre;
	private String game_name;
	private String game_abb;
	
	public List<Board> boardList;
	

	
	public String getGame_line() {
		return game_line;
	}
	public void setGame_line(String game_line) {
		this.game_line = game_line;
	}
	public String getGame_abb() {
		return game_abb;
	}
	public void setGame_abb(String game_abb) {
		this.game_abb = game_abb;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public List<Board> getBoardList() {
		return boardList;
	}
	public void setBoardList(List<Board> boardList) {
		this.boardList = boardList;
	}
	
}
