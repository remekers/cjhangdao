package cjhangdao.com.jinglin.sysmanager.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cjhangdao.com.jinglin.sysmanager.model.Userinfo;
import cjhangdao.com.jinglin.sysmanager.service.impl.UserinfoServiceImpl;
import cjhangdao.com.jinglin.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/cjhangdao/userinfo")
public class UserinfoAction {
	@Autowired
	private UserinfoServiceImpl userinfoService;
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	@RequestMapping("/userinfo")
	public String userinfo(){
		return "userinfo";
	}
	
	@RequestMapping("/page")
	public void userinfo( 	@RequestParam(value="pageindex",required=false,defaultValue="1")Integer pageindex,
            				@RequestParam(value="pagesize",required=false,defaultValue="5")Integer pagesize,
            				HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pageindex", (pageindex-1)*pagesize);//起始行号
		map.put("pagesize", pagesize);
		List<Userinfo> selectByPage = userinfoService.selectByPage(map);
		for (Userinfo userinfo : selectByPage) {
			System.out.println(userinfo);
		}
		int datacount=userinfoService.getcount();//总个数
		int pagecount = (int) Math.ceil(datacount*1.0/pagesize);//分页总数
		JSONArray jsonrows = JSONArray.fromObject(selectByPage);
		JSONObject jsonobject =new JSONObject();
	    jsonobject.put("result", jsonrows);//数据集合
	    jsonobject.put("datacount",datacount);//数据总数
	    jsonobject.put("pagecount",pagecount);//总的页数
	    jsonobject.put("currenpage", pageindex);//当前页
		try {
			ResponseUtil.write(response, jsonobject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/delete")
	public String del(HttpServletRequest request){
		String user_id1 = request.getParameter("user_id");
		int user_id = Integer.parseInt(user_id1);
		userinfoService.deleteByPrimaryKey(user_id);
		return "redirect:userinfo";
	}
	
	@RequestMapping("/add")
	public void add(HttpServletRequest request){
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String role_id1 = request.getParameter("role_id");
		int role_id=Integer.parseInt(role_id1);
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String status1 = request.getParameter("status");
		int status=Integer.parseInt(status1);
		String usernature = request.getParameter("usernature");
		String belongName1 = request.getParameter("belongName1");
		String belongName2 = request.getParameter("belongName2");
		String note = request.getParameter("note");
		String belongName;
		if(belongName1==null){
			belongName=belongName2;
		}else{
			belongName=belongName1;
		}	
		Userinfo userinfo=new Userinfo();
		userinfo.setBelongName(belongName);
		userinfo.setName(name);
		userinfo.setNote(note);
		userinfo.setPassword(password);
		userinfo.setPhone(phone);
		userinfo.setRole_id(role_id);
		userinfo.setStatus(status);
		userinfo.setUsernature(usernature);
		userinfo.setUsername(username);
		userinfoService.insertSelective(userinfo);		
	}
	@RequestMapping("/update")
	public String update(HttpServletRequest request){
		String name = request.getParameter("name");
		String user_id1 = request.getParameter("userid");
		int user_id = Integer.parseInt(user_id1);
		String password = request.getParameter("password");
		String role_id1 = request.getParameter("role_id");
		int role_id=Integer.parseInt(role_id1);
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String status1 = request.getParameter("status");
		int status=Integer.parseInt(status1);
		String usernature = request.getParameter("usernature");
		String belongName1 = request.getParameter("belongName1");
		String belongName2 = request.getParameter("belongName2");
		String note = request.getParameter("note");
		String belongName;
		if(belongName1==null){
			belongName=belongName2;
		}else{
			belongName=belongName1;
		}	
		Userinfo userinfo=new Userinfo();
		userinfo.setUser_id(user_id);
		userinfo.setBelongName(belongName);
		userinfo.setName(name);
		userinfo.setNote(note);
		userinfo.setPassword(password);
		userinfo.setPhone(phone);
		userinfo.setRole_id(role_id);
		userinfo.setStatus(status);
		userinfo.setUsernature(usernature);
		userinfo.setUsername(username);
		userinfoService.updateByPrimaryKeySelective(userinfo);
		return "redirect:userinfo";
	}
	@RequestMapping("/redpwd")
	public String redpwd(HttpServletRequest request){
		String user_id1 = request.getParameter("user_id");
		int user_id = Integer.parseInt(user_id1);
		userinfoService.redpwd(user_id);
		return "redirect:userinfo";
	}
	
	
}
