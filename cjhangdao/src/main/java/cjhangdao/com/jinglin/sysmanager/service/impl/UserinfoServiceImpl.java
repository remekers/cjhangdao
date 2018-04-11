package cjhangdao.com.jinglin.sysmanager.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cjhangdao.com.jinglin.sysmanager.dao.IUserinfoDao;
import cjhangdao.com.jinglin.sysmanager.model.Userinfo;
import cjhangdao.com.jinglin.sysmanager.service.IUserinfoService;

@Service
public class UserinfoServiceImpl implements IUserinfoService{
	@Resource
	private IUserinfoDao dao;

	public int deleteByPrimaryKey(Integer user_id) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(user_id);
	}


	public int insert(Userinfo record) {
		// TODO Auto-generated method stub
		return dao.insert(record);
	}

	
	public int insertSelective(Userinfo record) {
		// TODO Auto-generated method stub
		return dao.insertSelective(record);
	}

	
	public Userinfo selectByPrimaryKey(Integer user_id) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(user_id);
	}


	public int updateByPrimaryKeySelective(Userinfo record) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKeySelective(record);
	}


	public int updateByPrimaryKey(Userinfo record) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKey(record);
	}

}
