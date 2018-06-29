package com.quest.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.quest.service.PostService;
import com.quest.vo.Post;


@Controller
public class PageController {
	
	@Autowired
	PostService postService;
	
	//메인
	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	//커뮤니티
	@GetMapping("/community")
	public String community(Model model) {
		
		List<Post> postList = postService.getList();
		model.addAttribute("postList",postList);
		return "community";
	}
	
	//글쓰기 view로 보냄
	@GetMapping("/postWrite")
	public String postWrite() {
		return "communitywrite";
	}
	
	//글 데이터베이스로 보냄
	@PostMapping("/postWrite")
	public String postWritepost(@ModelAttribute @Valid Post post,BindingResult result) {
		
		if(result.hasErrors()) {
			return "communitywrite";
		}
		
		System.out.println(post.getPost_title());
		System.out.println(post.getContent());
		
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
	
}
