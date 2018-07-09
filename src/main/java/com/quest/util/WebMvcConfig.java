package com.quest.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	LoginInterceptor loginInterceptor;

	
	public void addInterceptors(InterceptorRegistry registry) {
	    //registry.addInterceptor(loginInterceptor).addPathPatterns("/postWrite");
	}
}
