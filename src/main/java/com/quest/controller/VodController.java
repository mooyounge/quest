package com.quest.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.quest.service.FileService;

@Controller
public class VodController {
	
	@Autowired 
	FileService fileService;

	@GetMapping("/vod/upload")
	public String upload() {
		
		return "vod/fileupload";
	}
	
/*	@PostMapping("/vod/upload")
	public String uploadpost(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws IllegalStateException, IOException{
		System.out.println(file.getSize());
		String path = req.getServletContext().getRealPath("/WEB-INF/video");
		
		String filename = fileService.saveFile(path, file);
		
		if("no_file".equals(filename)) {
			return "errorpage";
		}
		return "redirect:/vod/upload";
	}*/
	
	@PostMapping("/vod/upload")
	@ResponseBody
	public String uploadpostAjax(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws IllegalStateException, IOException{
		System.out.println(file.getSize());
		String path = req.getServletContext().getRealPath("/WEB-INF/video");
		
		String filename = fileService.saveFile(path, file);
		
		if("no_file".equals(filename)) {
			//return "errorpage";
			return "fail";
		}
		//return "redirect:/vod/upload";
		return "success";
	}
	
	
	@GetMapping("/vod/main")
	public String main() {
		return "vod/vodmain";
	}
	
	@GetMapping("/vod/in")
	public String vodin() {
		return "vod/vodin";
	}
}
