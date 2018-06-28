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
		System.out.println(postList.size());
		System.out.println(postList.get(0).getPost_id());
		model.addAttribute("postList",postList);
		return "community";
	}
	
	
}
