package com.quest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.BoardDao;
import com.quest.vo.Board;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;

	public void insertAll(Board board) {
		boardDao.insertAll(board);
	}
	
}
