package com.quest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Comment;

@Repository
public class CommentDao {
	@Autowired
	private SqlSession session;

	public void insert(Comment comment) {
		session.insert("comment.insert",comment);
	}
	
}
