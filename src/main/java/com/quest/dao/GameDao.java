package com.quest.dao;

import java.util.List;
import java.util.Map;

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

	public void insert(Game game) {
		session.insert("game.insert",game);
	}

	public Game getOne(String game_abb) {
		return session.selectOne("game.getOne",game_abb);
	}

	public List<Game> getList(String genre) {
		return session.selectList("game.getListbyGenre",genre);
	}

	public Game getOne2(Map<String, Object> map) {
		return session.selectOne("game.getOne2",map);
	}
}
