package com.quest.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{
	
	@Autowired
	IncodingInterceptor incodingInterceptor;

	
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(incodingInterceptor).addPathPatterns("/*");
	}
}
