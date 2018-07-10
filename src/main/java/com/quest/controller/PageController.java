package com.quest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quest.service.BoardService;
import com.quest.service.CommentService;
import com.quest.service.GameService;
import com.quest.service.PostService;
import com.quest.service.UserService;
import com.quest.util.Paging;
import com.quest.vo.Board;
import com.quest.vo.Comment;
import com.quest.vo.Game;
import com.quest.vo.Post;
import com.quest.vo.Post_like;
import com.quest.vo.User;


@Controller
public class PageController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
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
							@RequestParam(defaultValue="all") String game_abb,
							@RequestParam(defaultValue="all") String name
							) {
		Game game = gameService.getOne(game_abb);
		
		
		//페이징 한세트
		String searchParam = "";
		if(option != null) {
			searchParam = "&option="+option+"&text="+text;
		}
        Paging paging = getPaging(page);
        List<Post> postList = null;
        //game_abb가 없으면 전체 리스트 불러오기
		postList = postService.getList(option,text,paging,game_abb,name);
		paging.setTotalCount(postService.getSize(option,text,game_abb,name));
        //요기까지
        
        
        //게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList();
        model.addAttribute("game",game);
		model.addAttribute("gameList",gameList);
        model.addAttribute("paging",paging);
		model.addAttribute("postList",postList);
		return "community";
	}
	
	//글쓰기 view로 보냄
	@GetMapping("/postWrite")
	public String postWrite(Model model,@RequestParam(defaultValue="all") String game_abb) {
		Game game = gameService.getOne(game_abb);
       
		//게임 이름 불러오기 comnav
		List<Game> gameList = gameService.getList(game.getGenre());
		model.addAttribute("gameList",gameList);
		
		return "communitywrite";
	}
	
	//글쓰기 view ajax 통신
	@PostMapping("/postWrite/gameName")
	@ResponseBody
	public List<Game> postWriteGameName(String genre) {
		
		//게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList(genre);
		
		return gameList;
	}
	
	//글 데이터베이스로 보냄
	@PostMapping("/postWrite")
	public String postWritepost(@ModelAttribute @Valid Post post,BindingResult result,
								@RequestParam(required=false) String game_abb) {
		
		if(result.hasErrors()) {
			return "communitywrite";
		}
		
		postService.insert(post);
		if(game_abb != null) {
			return "redirect:/community?game_abb="+game_abb;
		}
		return "redirect:/community";
	}
	
	//글 좋아요 ajaxPost
	@PostMapping("/community/post/like")
	@ResponseBody
	public String postlike(HttpServletRequest request,@ModelAttribute Post_like post_like,@RequestParam String type) {
		
		//ip 구하기
		String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        post_like.setUser_ip(ip);
        
        //user id 구하기
        User user = null;
        user =(User)request.getSession().getAttribute("user");
        if(user!=null) {
        	post_like.setUser_id(user.getId());
        }
        
        
        int count = -1;
        count = postService.getlikecount(post_like);
        if(count==0) {
        	//더하는 작업
        	if("like".equals(type)) {
        		postService.insertPost_like(post_like);
        	}else if("dislike".equals(type)) {
        		postService.insertPost_dislike(post_like);
        	}
        	return "success";
        }else if(count==-1) {
        	//서버오류
        	return "error";
        }else {
        	//이미 추천한거
        	return "fail";
        }
        
	}
	
	//로그인
	@GetMapping("/login")
	public String loginGet() {
		return "login";
	}
	//로그인 Post
	@PostMapping("/login")
	public String loginPost(@ModelAttribute User user,BindingResult result,HttpServletRequest request,Model model) {
		User saveduser = userService.getOne(user.getId()); 
		if(saveduser == null || !saveduser.getPassword().equals(user.getPassword()) ) {
			result.addError(new FieldError("notExsitId", "id", "존재하지 않는 아이디 이거나 비밀번호가 일치하지 않습니다."));
		}
		
		if(result.hasErrors()) {
			//model.addAttribute(member);
			return "login";
		}
		
		request.getSession().invalidate();
		request.getSession().setAttribute("user",user);
		
		return "redirect:/community";
	}
	//로그인
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	//회원가입
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}

	@GetMapping("/community/view")
	public String comview(Model model,
						@RequestParam(defaultValue="") int id,
						@RequestParam(required=false) String option,
						@RequestParam(required=false) String text,
						@RequestParam(defaultValue="1") int page,
						@RequestParam(defaultValue="all") String game_abb,
						@RequestParam(defaultValue="all") String name) {
		Post post = postService.getPost(id);
		
		//페이징 한세트
				String searchParam = "";
				if(option != null) {
					searchParam = "&option="+option+"&text="+text;
				}
		        Paging paging = getPaging(page);
		        List<Post> postList = null;
		        //game_abb가 없으면 전체 리스트 불러오기
        		postList = postService.getList(option,text,paging,game_abb,name);
        		paging.setTotalCount(postService.getSize(option,text,game_abb,name));
		        //요기까지
		
        //게임 이름 불러오기 comnav
        List<Game> gameList = gameService.getList();
		model.addAttribute("gameList",gameList);
		
        model.addAttribute("paging",paging);
		model.addAttribute("post",post);
		model.addAttribute("postList",postList);
		return "communityView";
	}
	
	//댓글 POST
	@PostMapping("/community/comment/insert")
	public String commentInsert(@ModelAttribute @Valid Comment comment,BindingResult result,HttpServletRequest request) {
		
		String url = request.getHeader("referer");
		
		if(result.hasErrors()) {
			return "redirect:"+url;
		}
		commentService.insert(comment);
		return "redirect:"+url;
	}
	
	@PostMapping("/community/ajaxlist")
	@ResponseBody
	public Map<String,Object> ajaxlist(@RequestParam(required=false) String option,
			@RequestParam(required=false) String text,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="all") String game_abb,
			@RequestParam(defaultValue="all") String name) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Paging paging = getPaging(page);
		
        List<Post>  postList = postService.getList(option,text,paging,game_abb,name);

		map.put("postList", postList);
		map.put("page", page);
		return map;
	}
	
	
	private Paging getPaging(int page) {
		Paging paging = new Paging();
        paging.setPageNo(page);
        paging.setPageSize(4);
        
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
