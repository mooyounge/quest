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
	
	
	@GetMapping("/login")
	public String loginGet() {
		return "login";
	}
	
	@GetMapping("/community/view")
	public String comview() {
		return "communityView";
	}
	
}
