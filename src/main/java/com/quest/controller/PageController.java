package com.quest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PageController {
	
	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	@GetMapping("/community")
	public String community() {
		return "community";
	}
	
	
}
