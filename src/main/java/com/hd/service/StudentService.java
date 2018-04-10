package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.Student;

public interface StudentService {
	List<Student> se(Map<String,Object> map);
	List<Student> query(Map<String,Object> map);
	int count(Map<String,Object> map);
}
