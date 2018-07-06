package com.quest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.User;

@Repository
public class UserDao {
	@Autowired
	SqlSession session;

	public User getOne(String id) {
		return session.selectOne("user.getOne",id);
	}
	
	
	
}
