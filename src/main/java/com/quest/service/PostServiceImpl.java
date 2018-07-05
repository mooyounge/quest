package com.quest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.BoardDao;
import com.quest.dao.PostDao;
import com.quest.util.Paging;
import com.quest.vo.Post;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void insert(Post post) {
		int board_id = boardDao.getBoardFreeId(post.getGame_abb());
		post.setBoard_id(board_id);
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
		
		//name 으로 all,free,info 중 파악해서 전달해야함.
		int board_id = 0;
		map.put("board_id",board_id);
		
		return postDao.getSize(map);
	}
	@Override
	public int getSize(String option, String text, String game_abb, String name) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("text", text);
		map.put("game_abb", game_abb);
		map.put("name",name);
		
		//여기서는 board_id 가 아니라 board_id list 를 받아야한다.
		int board_id = 0;
		if("all".equals(game_abb)) {
			List<Integer> list = null;
			list = boardDao.getBoardIdList(name);
			map.put("board_id",board_id);
			map.put("board_idList", list);
			return postDao.getSize(map);
		}
		//여기서는 board_id 가 아니라 board_id list 를 받아야한다.
		
		//name 으로 all,free,info 중 파악해서 전달해야함.
		if("free".equals(name)||"info".equals(name)) {
			board_id = boardDao.getBoardId(map);
		}
		map.put("board_id",board_id);
		
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

	@Override
	public List<Post> getAllList(String option, String text, Paging paging) {
		Map<String,Object> map = getSearchMap(paging);
		
		map.put("option", option);
		map.put("text", text);
		
		return postDao.getAllList(map);
	}



	@Override
	public List<Post> getList(String option, String text, Paging paging, String game_abb, String name) {
		Map<String,Object> map = getSearchMap(paging);
		map.put("option", option);
		map.put("text", text);
		map.put("game_abb", game_abb);
		map.put("name",name);
		
		
		
		//여기서는 board_id 가 아니라 board_id list 를 받아야한다.
		int board_id = 0;
		if("all".equals(game_abb)) {
			List<Integer> list = null;
			list = boardDao.getBoardIdList(name);
			
			for( int a : list) {
				System.out.println(a);
			}
			
			map.put("board_id",board_id);
			map.put("board_idList", list);
			return postDao.getList(map);
		}
		//여기서는 board_id 가 아니라 board_id list 를 받아야한다.

		//name 으로 all,free,info 중 파악해서 전달해야함.
		if("free".equals(name)||"info".equals(name)) {
			board_id = boardDao.getBoardId(map);
			
		}
		map.put("board_id",board_id);
		
		return postDao.getList(map);
	}


}
