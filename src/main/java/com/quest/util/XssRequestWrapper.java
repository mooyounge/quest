package com.quest.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssRequestWrapper extends HttpServletRequestWrapper{

	public XssRequestWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String parameter) {
		String value = super.getParameter(parameter);
		if(value == null) {
			return null;
		}
		
		if(parameter.equals("post_content")) {
			return cleanXssForEditor(value);
		}
		return cleanXss(value);
	}
	
	

	@Override
	public String[] getParameterValues(String parameter) {
		String[] values = super.getParameterValues(parameter);
		if(values == null) {
			return null;
		}
		
		String[] encodedValues = new String[values.length];
		for(int i = 0; i < values.length; i++) {
			if(parameter.equals("post_content")) {
				encodedValues[i] = cleanXssForEditor(values[i]);
			}else {
				encodedValues[i] = cleanXss(values[i]);
			}
			
		}
		
		return encodedValues;
	}

	private String cleanXss(String value) {
		value = value.replaceAll("<", "&lt;");
		value = value.replaceAll(">", "&gt;");
		value = value.replaceAll("\\(", "&#40;");
		value = value.replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		value = value.replaceAll("<script>", "");
		
		return value;
	}
	
	private String cleanXssForEditor(String value) {
		value = value.replaceAll("onload", "");
		value = value.replaceAll("iframe", "");
		value = value.replaceAll("\\(", "&#40;");
		value = value.replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		value = value.replaceAll("<script>", "");
		return value;
	}
	
}
