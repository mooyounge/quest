package com.quest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quest.vo.Tag;

@Repository
public class TagDao {
	@Autowired
	SqlSession session;

	public void add(Tag tag) {
		session.insert("tag.add",tag);
	}
	
	
	
}
