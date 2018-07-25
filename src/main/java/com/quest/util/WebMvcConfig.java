package com.quest.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;
import com.quest.filter.XssFilter;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	LoginInterceptor loginInterceptor;

	
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(loginInterceptor).addPathPatterns("/postWrite");
	}
	
	@Bean
	public FilterRegistrationBean getFilterRegistrationBean2()
	{
		FilterRegistrationBean registrationBean = new FilterRegistrationBean(new XssFilter());
		registrationBean.addUrlPatterns("/*"); // 서블릿 등록 빈 처럼 패턴을 지정해 줄 수 있다.
		return registrationBean;
	}
	
    /*@Bean
    public FilterRegistrationBean getFilterRegistrationBean(){
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new XssEscapeServletFilter());
        registrationBean.setOrder(1);
        registrationBean.addUrlPatterns("/*", "/");    //filter를 거칠 url patterns
        return registrationBean;
    }*/
}
