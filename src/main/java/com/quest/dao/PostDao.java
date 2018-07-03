package com.quest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Post;

@Repository
public class PostDao {

	@Autowired
	private SqlSession session;

	public List<Post> getList() {
		return session.selectList("post.getList");
	}

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
	
	
	
}
