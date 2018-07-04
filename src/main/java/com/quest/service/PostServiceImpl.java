package com.quest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.PostDao;
import com.quest.util.Paging;
import com.quest.vo.Post;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;

	@Override
	public void insert(Post post) {
		postDao.insert(post);
	}

	@Override
	public Post getPost(int id) {
		return postDao.getPost(id);
	}

	@Override
	public int getSize(String option, String text,String game_abb) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("text", text);
		map.put("game_abb", game_abb);
		
		return postDao.getSize(map);
	}
	
	@Override
	public List<Post> getList(String option, String text, Paging paging) {
		
		Map<String,Object> map = getSearchMap(paging);
		
		map.put("option", option);
		map.put("text", text);
		
		return postDao.getList(map);
	}
	
	
	
	private Map<String, Object> getSearchMap(
			Paging paging){
	int start = (paging.getPageNo()-1) * paging.getPageSize() +1;
	int end = start + paging.getPageSize() -1;
	
	Map<String, Object> searchMap = new HashMap<>();
	searchMap.put("start", start);
	searchMap.put("end", end);
	
	return searchMap;
	}

	@Override
	public List<Post> getList(String option, String text, Paging paging, String game_abb) {
		Map<String,Object> map = getSearchMap(paging);
		
		map.put("option", option);
		map.put("text", text);
		map.put("game_abb", game_abb);
		
		return postDao.getList(map);
	}


}
