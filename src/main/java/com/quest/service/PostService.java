package com.quest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.quest.util.Paging;
import com.quest.vo.Post;

public interface PostService {
	
	List<Post> getList();

	void insert(Post post);

	Post getPost(int id);
	
	int getSize(String option, String text);

	List<Post> getList(String option, String text, Paging paging);

}
