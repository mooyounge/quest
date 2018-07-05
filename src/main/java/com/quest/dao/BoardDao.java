package com.quest.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession session;

	public void insertAll(Board board) {
		session.insert("board.insertFree",board);
		session.insert("board.insertInfo",board);
	}

	public int getBoardFreeId(String game_abb) {
	  return session.selectOne("board.getBoardFreeId",game_abb);
	}
	public int getBoardInfoId(String game_abb) {
		return session.selectOne("board.getBoardInfoId",game_abb);
	}

	public int getBoardId(Map<String, Object> map) {
		return session.selectOne("board.getBoardId",map);
		
	}
}
