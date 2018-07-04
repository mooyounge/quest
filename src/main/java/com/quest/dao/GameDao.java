package com.quest.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Game;

@Repository
public class GameDao {
	
	@Autowired
	private SqlSession session;

	public List<Game> getList() {
		return session.selectList("game.getList");
	}
}
