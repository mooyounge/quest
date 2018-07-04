package com.quest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quest.service.BoardService;
import com.quest.service.GameService;
import com.quest.service.PostService;
import com.quest.util.Paging;
import com.quest.vo.Board;
import com.quest.vo.Game;
import com.quest.vo.Post;


@Controller
public class PageController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private BoardService boardService;
	
	
	//메인
	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	//커뮤니티
	@GetMapping("/community")
	public String community(Model model,
							@RequestParam(required=false) String option,
							@RequestParam(required=false) String text,
							@RequestParam(defaultValue="1") int page,
							@RequestParam(required=false) String game_abb //game_abb
							) {
		
		String searchParam = "";
		if(option != null) {
			searchParam = "&option="+option+"&text="+text;
		}
		
        Paging paging = getPaging(page);
        
        paging.setTotalCount(postService.getSize(option,text,game_abb));
        
        List<Post> postList = postService.getList(option,text,paging,game_abb);
        
        //게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList();
		model.addAttribute("gameList",gameList);
        
        model.addAttribute("paging",paging);
		model.addAttribute("postList",postList);
		return "community";
	}
	
	//글쓰기 view로 보냄
	@GetMapping("/postWrite")
	public String postWrite(Model model) {
		
        //게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList();
		model.addAttribute("gameList",gameList);
		
		return "communitywrite";
	}
	
	//글 데이터베이스로 보냄
	@PostMapping("/postWrite")
	public String postWritepost(@ModelAttribute @Valid Post post,BindingResult result) {
		
		if(result.hasErrors()) {
			return "communitywrite";
		}
		
		postService.insert(post);
		
		return "redirect:/community";
	}
	
	//로그인
	@GetMapping("/login")
	public String loginGet() {
		return "login";
	}
	
	//회원가입
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}

	@GetMapping("/community/view")
	public String comview(Model model,@RequestParam int id,
						@RequestParam(required=false) String option,
						@RequestParam(required=false) String text,
						@RequestParam(defaultValue="1") int page,
						@RequestParam(required=false) String game_abb) {
		Post post = postService.getPost(id);
		
		String searchParam = "";
		if(option != null) {
			searchParam = "&option="+option+"&text="+text;
		}
		
        Paging paging = getPaging(page);
        
        
        List<Post> postList = postService.getList(option,text,paging); // 여기에 paging을 넣어서 DB에 접근해야한다.
        
        paging.setTotalCount(postService.getSize(option,text,game_abb));
		
        //게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList();
		model.addAttribute("gameList",gameList);
		
        model.addAttribute("paging",paging);
		model.addAttribute("post",post);
		model.addAttribute("postList",postList);
		return "communityView";
	}
	
	@PostMapping("/community/ajaxlist")
	@ResponseBody
	public Map<String,Object> ajaxlist(@RequestParam(required=false) String option,
			@RequestParam(required=false) String text,
			@RequestParam(defaultValue="1") int page) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Paging paging = getPaging(page);
		
        List<Post> postList = postService.getList(option, text,paging);

		map.put("postList", postList);
		map.put("page", page);
		return map;
	}
	
	
	private Paging getPaging(int page) {
		Paging paging = new Paging();
        paging.setPageNo(page);
        paging.setPageSize(2);
        
        return paging;
	}
	
	@GetMapping("/community/admin")
	public String communityadmin(Model model) {
		
        //게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList();
		model.addAttribute("gameList",gameList);
		
		return "adminpage";
	}
	
	@PostMapping("/community/admin/gameinsert")
	public String communitygameinsert(Model model,@ModelAttribute Game game) {
		
		//게임 집어넣고
		gameService.insert(game);
		
		//게시판 제작 전체,자유,정보
		Board board = new Board();
		
		board.setGame_abb(game.getGame_abb());
		boardService.insertAll(board);
		
		return "redirect:/community/admin";
	}
	
	
}
