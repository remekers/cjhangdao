package cjhangdao.com.jinglin.sysmanager.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cjhangdao/userinfo")
public class UserinfoAction {
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	@RequestMapping("/userinfo")
	public String userinfo(){
		return "userinfo";
	}
	
	@RequestMapping("/add")
	public String add(){
		return "userinfo";
	}
}
