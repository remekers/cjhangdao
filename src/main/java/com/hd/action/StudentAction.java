package com.hd.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hd.model.PageInfo;
import com.hd.model.Student;
import com.hd.service.StudentService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/student")
public class StudentAction {
	@Autowired
	private StudentService service;
	
	@RequestMapping("/query")
	public String query(Model model,HttpServletRequest request){
		String name = request.getParameter("name");
		String xueke=request.getParameter("xueke");
		System.out.println("============"+request.getParameter("stuname"));
		String a1=request.getParameter("age1");
		String a2=request.getParameter("age2");		
		Map<String,Object> map=new HashMap<String,Object>();
		if(""!=a1&&a1!=null){
			Integer age1=Integer.parseInt(a1);
			map.put("name", name);
			map.put("xueke", xueke);
			map.put("age1", age1);
			if(""!=a2&&a2!=null){
				Integer age2=Integer.parseInt(a2);
				map.put("age2", age2);
			}
			List<Student> query = service.query(map);
			for (Student student : query) {
				System.out.println(student);
			}
			model.addAttribute("list", query);
		}else if(""!=name&&name!=null){
			map.put("name", name);
			map.put("xueke", xueke);
			List<Student> query = service.query(map);
			for (Student student : query) {
				System.out.println(student);
			}
			model.addAttribute("list", query);
		}else if(""!=xueke&&xueke!=null){
			map.put("xueke", xueke);
			List<Student> query = service.query(map);
			for (Student student : query) {
				System.out.println(student);
			}
			model.addAttribute("list", query);
		}else{
			return "/WEB-INF/index.jsp";
		}				
		return "/WEB-INF/index.jsp";
	}
	@RequestMapping("/se")
	public void se(HttpServletRequest request){
		String stuname = request.getParameter("stuname");
		String xueke = request.getParameter("subjectname");
		String age1 = request.getParameter("age1");
		String age2 = request.getParameter("age2");
		String conditional = request.getParameter("conditional");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("stuname", stuname);
		map.put("xueke", xueke);
		map.put("conditional", conditional);
		List<Student> query = service.se(map);
		System.out.println(stuname+"---"+xueke+"---"+age1+"--"+age2+"--"+conditional);
	}
	@RequestMapping("/ss")
	public void ss(
			HttpServletResponse response,
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows,
			@RequestParam(value="conditional",required=false,defaultValue="") String conditional,
	Student s) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("stuname", s.getName());
		map.put("subjectname", s.getXueke());
		PageInfo<Student> stuPage=new PageInfo<Student>();
		Integer pageSize=Integer.parseInt(rows);
		stuPage.setPageSize(pageSize);		
		String pageIndex = page;
		if (pageIndex == null || pageIndex == "") {
			pageIndex = "1";
		}
		stuPage.setPageIndex((Integer.parseInt(pageIndex) - 1)* pageSize);
		 if(conditional!=null && !conditional.equals("")) {
	        	map.put("conditional", conditional);
	     }
		int count = service.count(map);
		System.out.println("11111111:"+count);
		stuPage.setCount(count);
		map.put("pageIndex", stuPage.getPageIndex());
		map.put("pageSize", stuPage.getPageSize());
		List<Student> query = service.se(map);
		JSONObject json = new JSONObject();//用以构建键值对的数据
		// 把List格式转换成JSON（集合数据)
		JSONArray jsonArray = JSONArray.fromObject(query);
		json.put("rows", jsonArray);//必须传给easyui的rows，集合
		json.put("total", count);//总的数据量
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(json.toString());
	}
	
}
