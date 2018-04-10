package com.hd.model;

public class Student {
	private String id;
	private String name;
	private int age;
	private String xueke;
	private int score;

	public Student(String id, String name, int age, String xueke, int score) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.xueke = xueke;
		this.score = score;
	}
	public Student() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getXueke() {
		return xueke;
	}
	public void setXueke(String xueke) {
		this.xueke = xueke;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", xueke=" + xueke + ", score=" + score + "]";
	}
	
}
