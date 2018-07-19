package com.quest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.BoardDao;
import com.quest.dao.GameDao;
import com.quest.dao.PostDao;
import com.quest.dao.TagDao;
import com.quest.util.Paging;
import com.quest.vo.Game;
import com.quest.vo.Post;
import com.quest.vo.Post_like;
import com.quest.vo.Tag;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private GameDao gameDao;
	
	@Autowired
	private TagDao tagDao;
	
	@Override
	public void insert(Post post,String name) {
		int board_id = 1;
		if("info".equals(name)) {
			board_id = boardDao.getBoardInfoId(post.getGame_abb());
		}else {
			board_id = boardDao.getBoardFreeId(post.getGame_abb());
		}
		
		if(post.getTags()!=null) {
			for(Tag tag : post.getTags()) {
				tag.setPost_id(post.getPost_id());
				tagDao.add(tag);
			}
		}
		
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
	public int getlikecount(Post_like post_like) {
		if(post_like.getUser_id()!=null) {
			return postDao.getlikecountbyUser_id(post_like);
		}
		return postDao.getlikecountbyIp(post_like);
		
	}

	@Override
	public void insertPost_like(Post_like post_like) {
		postDao.insertPost_like(post_like);
	}
	
	@Override
	public void insertPost_dislike(Post_like post_like) {
		postDao.insertPost_dislike(post_like);
	}

	@Override
	public List<Post> getList(Map<String, Object> map) {
				
				//여기서는 board_id 가 아니라 board_id list 를 받아야한다.
				int board_id = 0;
				if("all".equals((String)map.get("game_abb"))) {
					List<Integer> list = null;
					if(map.get("genre")!=null) {
						List<Game> gameList = gameDao.getList((String)map.get("genre"));
						map.put("gameList",gameList);
						list = boardDao.getBoardIdListbygameList(map);
					}else {
						list = boardDao.getBoardIdList((String) map.get("name"));
					}
					
					
					map.put("board_id",board_id);
					map.put("board_idList", list);
					return postDao.getList(map);
				}
				//여기서는 board_id 가 아니라 board_id list 를 받아야한다.

				//name 으로 all,free,info 중 파악해서 전달해야함.
				if("free".equals((String) map.get("name"))||"info".equals((String) map.get("name"))) {
					board_id = boardDao.getBoardId(map);
					
				}
				map.put("board_id",board_id);
				
				return postDao.getList(map);
	}

	@Override
	public int getSize(Map<String, Object> map) {
		
		//여기서는 board_id 가 아니라 board_id list 를 받아야한다.
		int board_id = 0;
		if("all".equals(map.get("game_abb"))) {
			List<Integer> list = null;
			
			//장르로 리스트 구하기
			if(map.get("genre")!=null) {
				List<Game> gameList = gameDao.getList((String)map.get("genre"));
				map.put("gameList",gameList);
				list = boardDao.getBoardIdListbygameList(map);
			}else {
				list = boardDao.getBoardIdList((String) map.get("name"));
			}
			
			map.put("board_id",board_id);
			map.put("board_idList", list);
			return postDao.getSize(map);
		}
		//여기서는 board_id 가 아니라 board_id list 를 받아야한다.
		
		//name 으로 all,free,info 중 파악해서 전달해야함.
		if("free".equals((String)map.get("name"))||"info".equals((String)map.get("name"))) {
			board_id = boardDao.getBoardId(map);
		}
		map.put("board_id",board_id);
		
		return postDao.getSize(map);
	}


}
