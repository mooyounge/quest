package com.quest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Post;
import com.quest.vo.Post_like;

@Repository
public class PostDao {

	@Autowired
	private SqlSession session;


	public void insert(Post post) {
		session.insert("post.insert",post);
		
	}

	public Post getPost(int id) {
		return session.selectOne("post.getPost",id);
		
	}

	public int getSize(Map<String, Object> map) {
		return session.selectOne("post.getSize",map);
	}

	public List<Post> getList(Map<String, Object> map) {
		return session.selectList("post.getList",map);
	}

	public List<Post> getAllList(Map<String, Object> map) {
		return session.selectList("post.getAllList",map);
	}

	public void insertPost_like(Post_like post_like) {
		session.insert("post_like.insertlike",post_like);
	}

	public void insertPost_dislike(Post_like post_like) {
		session.insert("post_like.insertdislike",post_like);
	}

	public int getlikecountbyUser_id(Post_like post_like) {
		return session.selectOne("post_like.getlikecountbyUser_id",post_like);
	}

	public int getlikecountbyIp(Post_like post_like) {
		return session.selectOne("post_like.getlikecountbyIp",post_like);
	}

}
