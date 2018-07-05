package com.quest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.quest.util.Paging;
import com.quest.vo.Post;

public interface PostService {
	
	List<Post> getList(String option, String text, Paging paging, String game_abb);

	void insert(Post post);

	Post getPost(int id);
	
	int getSize(String option, String text, String game_abb);

	List<Post> getList(String option, String text, Paging paging);

	List<Post> getAllList(String option, String text, Paging paging);

	int getSize(String option, String text, String game_abb, String name);

	List<Post> getList(String option, String text, Paging paging, String game_abb, String name);

}
