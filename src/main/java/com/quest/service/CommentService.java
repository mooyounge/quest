package com.quest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.CommentDao;
import com.quest.vo.Comment;

@Service
public class CommentService {
	
	@Autowired
	private CommentDao commentDao;

	public void insert(Comment comment) {
		commentDao.insert(comment);
	}
}
