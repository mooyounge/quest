package com.quest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.GameDao;
import com.quest.vo.Game;

@Service
public class GameService {
	@Autowired
	private GameDao gameDao;

	public List<Game> getList() {
		return gameDao.getList();
	}

	public void insert(Game game) {
		gameDao.insert(game);
		
	}

	public Game getOne(String game_abb) {
		return gameDao.getOne(game_abb);
	}

	public List<Game> getList(String genre) {
		return gameDao.getList(genre);
	}
	
	
}
