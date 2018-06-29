package com.quest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.quest.vo.Post;

@Service
public interface PostService {
	
	List<Post> getList();

	void insert(Post post);

	Post getPost(int id);
	
}
