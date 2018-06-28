package com.quest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.quest.service.PostService;
import com.quest.vo.Post;


@Controller
public class PageController {
	
	@Autowired
	PostService postService;
	
	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	@GetMapping("/community")
	public String community(Model model) {
		
		List<Post> postList = postService.getList();
		model.addAttribute("postList",postList);
		return "community";
	}
	@GetMapping("/postWrite")
	public String postWrite() {
		return "communitywrite";
	}
	
	@GetMapping("/login")
	public String loginGet() {
		return "login";
	}
	
}
