package com.quest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.CommentDao;
import com.quest.vo.Comment;
import com.quest.vo.Comment_like;

@Service
public class CommentService {
	
	@Autowired
	private CommentDao commentDao;

	public void insert(Comment comment) {
		commentDao.insert(comment);
	}

	public int getlikecount(Comment_like comment_like) {
		if(comment_like.getUser_id()!=null) {
			return commentDao.getlikecountbyUser_id(comment_like);
		}
		return commentDao.getlikecountbyIp(comment_like);
	}

	public void insertComment_like(Comment_like comment_like) {
		commentDao.insertcomment_like(comment_like);
		commentDao.plusLike(comment_like);
	}

	public void insertComment_dislike(Comment_like comment_like) {
		commentDao.insertcomment_dislike(comment_like);
		commentDao.plusdisLike(comment_like);
	}
}
