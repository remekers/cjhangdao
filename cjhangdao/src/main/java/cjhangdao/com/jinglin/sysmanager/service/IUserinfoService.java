package cjhangdao.com.jinglin.sysmanager.service;

import java.util.List;
import java.util.Map;

import cjhangdao.com.jinglin.sysmanager.model.Userinfo;

public interface IUserinfoService {
    int deleteByPrimaryKey(Integer user_id);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(Integer user_id);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
    
    List<Userinfo> selectByPage(Map<String,Object> map);

    int getcount();
    void redpwd(int user_id);
}
