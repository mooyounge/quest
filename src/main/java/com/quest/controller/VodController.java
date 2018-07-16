package com.quest.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class VodController {

	@GetMapping("/vod/upload")
	public String upload() {
		
		return "vod/fileupload";
	}
	
	@PostMapping("/file/upload")
	@ResponseBody
	public List<FileMeta> upload(
	    @RequestParam(value = "files[]", required = false) MultipartFile[] files) throws IllegalStateException, IOException {

	  List<FileMeta> fileMetas = new ArrayList()<FileMeta>();
	  for (MultipartFile file : files) {
	    File uploadFile = new File("/", file.getOriginalFilename());
	    file.transferTo(uploadFile);
	    FileMeta fileMeta = new FileMeta(uploadFile.getAbsolutePath(), file.getSize(), "");
	    fileMetas.add(fileMeta);
	  }

	  return fileMetas;
	}
	
}
