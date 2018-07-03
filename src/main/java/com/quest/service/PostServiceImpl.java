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
	public List<Post> getList() {
		return postDao.getList();
	}

	@Override
	public void insert(Post post) {
		postDao.insert(post);
	}

	@Override
	public Post getPost(int id) {
		return postDao.getPost(id);
	}

	@Override
	public int getSize() {
		return postDao.getSize();
	}

	@Override
	public List<Post> getList(Paging paging) {
		
		Map<String,Object> map = getSearchMap(paging);
		
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
	
}
