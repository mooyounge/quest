package com.quest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.PostDao;
import com.quest.vo.Post;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;

	@Override
	public List<Post> getList() {
		return postDao.getList();
	}

	@Override
	public void insert(Post post) {
		postDao.insert(post);
	}
	
}
