package com.quest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.UserDao;
import com.quest.vo.User;

@Service
public class UserService {
	@Autowired
	UserDao userDao;

	public User getOne(String id) {
		
		return userDao.getOne(id);
	}
	
	
}
