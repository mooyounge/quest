package com.quest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quest.dao.TagDao;
import com.quest.vo.Tag;

@Service
public class TagService {
	@Autowired
	TagDao tagDao;

	public void insert(Tag tag) {
		tagDao.add(tag);
	}
	
}
