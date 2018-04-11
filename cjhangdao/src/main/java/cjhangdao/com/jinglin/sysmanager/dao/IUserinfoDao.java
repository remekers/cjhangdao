package cjhangdao.com.jinglin.sysmanager.dao;

import java.util.List;

import cjhangdao.com.jinglin.sysmanager.model.Userinfo;

public interface IUserinfoDao {
    int deleteByPrimaryKey(Integer user_id);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(Integer user_id);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
}
