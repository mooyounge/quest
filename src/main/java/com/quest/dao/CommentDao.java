package com.quest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Comment;
import com.quest.vo.Comment_like;

@Repository
public class CommentDao {
	@Autowired
	private SqlSession session;

	public void insert(Comment comment) {
		session.insert("comment.insert",comment);
	}

	public int getlikecountbyUser_id(Comment_like comment_like) {
		return  session.selectOne("comment_like.getlikecountbyUser_id",comment_like);
	}

	public int getlikecountbyIp(Comment_like comment_like) {
		return session.selectOne("comment_like.getlikecountbyIp",comment_like);
	}

	public void insertcomment_like(Comment_like comment_like) {
		session.insert("comment_like.insertlike",comment_like);
	}

	public void plusLike(Comment_like comment_like) {
		session.insert("comment.plusLike",comment_like);
	}

	public void insertcomment_dislike(Comment_like comment_like) {
		session.insert("comment_like.insertdislike",comment_like);
	}

	public void plusdisLike(Comment_like comment_like) {
		session.insert("comment.plusdisLike",comment_like);
	}

	public String getPassword(int comment_id) {
		return session.selectOne("comment.getPassword",comment_id);
	}

	public void delete(int comment_id) {
		session.delete("comment.delete",comment_id);
	}

	
	
}
