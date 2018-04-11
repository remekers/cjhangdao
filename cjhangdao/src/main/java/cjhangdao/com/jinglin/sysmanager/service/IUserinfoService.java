package cjhangdao.com.jinglin.sysmanager.service;

import cjhangdao.com.jinglin.sysmanager.model.Userinfo;

public interface IUserinfoService {
    int deleteByPrimaryKey(Integer user_id);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(Integer user_id);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
}
