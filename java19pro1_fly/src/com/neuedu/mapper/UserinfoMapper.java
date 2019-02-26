package com.neuedu.mapper;

import java.util.List;
import java.util.Map;

import com.neuedu.domain.Userinfo;

public interface UserinfoMapper {
	int regEmailCheck(String email);
	int addUserinfo(Userinfo userinfo);
	int getEmailandPass(Userinfo userinfo);
	Userinfo LoginCheck(Userinfo userInfo);
	int UpdataUserinfo(Userinfo userinfo);
	int setEmailCheck(Userinfo userinfo);
	int updatePass(Userinfo userinfo);
	int activeMail(String mailcode);
	int uploadHeadImg(Userinfo userinfo);
	//t通过id获取他人信息所有内容	
	Map<String,Object> getTaUser(int id);	
}
