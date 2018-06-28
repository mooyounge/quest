package com.quest.dao;

import java.util.List;

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
	
	
	
}
