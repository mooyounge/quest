package com.quest.service;

import java.util.List;
import java.util.Map;

import com.quest.util.Paging;
import com.quest.vo.Post;
import com.quest.vo.Post_like;

public interface PostService {
	
	List<Post> getList(String option, String text, Paging paging, String game_abb);

	void insert(Post post);

	Post getPost(int id);
	
	int getSize(String option, String text, String game_abb);

	List<Post> getAllList(String option, String text, Paging paging);

	int getSize(String option, String text, String game_abb, String name);

	List<Post> getList(String option, String text, Paging paging, String game_abb, String name);

	int getlikecount(Post_like post_like);

	void insertPost_like(Post_like post_like);

	void insertPost_dislike(Post_like post_like);

	List<Post> getList(Map<String, Object> map);

	int getSize(Map<String, Object> map);


}
