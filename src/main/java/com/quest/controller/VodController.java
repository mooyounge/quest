package com.quest.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.quest.service.FileService;
import com.quest.vo.FileMeta;

@Controller
public class VodController {
	
	@Autowired 
	FileService fileService;

	LinkedList<FileMeta> files = new LinkedList<FileMeta>();
    FileMeta fileMeta = null;	
	
	@GetMapping("/vod/upload")
	public String upload() {
		
		return "vod/fileupload";
	}
	
	@PostMapping("/vod/upload")
	public String uploadpost(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws IllegalStateException, IOException{
		System.out.println(file.getSize());
		String path = req.getServletContext().getRealPath("/WEB-INF/video");
		
		String filename = fileService.saveFile(path, file);
		
		if("no_file".equals(filename)) {
			return "errorpage";
		}
		return "redirect:/vod/upload";
	}
	
	@PostMapping("/vod/uploadAjax")
	@ResponseBody
	public LinkedList<FileMeta> uploadpost(MultipartHttpServletRequest request){
		
		//1.반복자 생성
		Iterator<String> itr =  request.getFileNames();
        MultipartFile mpf = null;
        
        //2.각각의 파일 가져오기
        while(itr.hasNext()){
        	//2.1 다음 멀티파트 파일 가져오기
            mpf = request.getFile(itr.next()); 
            System.out.println(mpf.getOriginalFilename() +" uploaded! "+files.size());
        }
        //2.2 파일사이즈가 200mb보다 클시 삭제
        if(files.size() >= 200000000) {
        	files.pop();
        }
            

        //2.3 파일메타 만들기
        fileMeta = new FileMeta();
        fileMeta.setFileName(mpf.getOriginalFilename());
        fileMeta.setFileSize(mpf.getSize()/1024+" Kb");
        fileMeta.setFileType(mpf.getContentType());
        
        try {
            fileMeta.setBytes(mpf.getBytes());
            FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream("C:/files/"+mpf.getOriginalFilename()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //2.4 파일 추가
        files.add(fileMeta);
     // result will be like this
        // [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
		return files;
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
