package com.hd.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.dao.StudentDao;
import com.hd.model.Student;
import com.hd.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService{	
	@Autowired
	private StudentDao dao;
	public List<Student> query(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.query(map);
	}
	public List<Student> se(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.se(map);
	}
	public int count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

}
