package com.neuedu.service;

import java.util.Map;

import com.neuedu.domain.Userinfo;

public interface UserinfoService {
	//������֤
	int regEmailCheck(String email);
	int addUserinfo(Userinfo userinfo);
	int getEmailandPass(Userinfo userinfo);
	Userinfo LoginCheck(Userinfo userInfo);
	int UpdataUserinfo(Userinfo userinfo);
	int setEmailCheck(Userinfo userinfo);
	int updatePass(Userinfo userinfo);
	int activeMail(String mailcode);
	int uploadHeadImg(Userinfo userinfo);
	//tͨ��id��ȡ������Ϣ��������
	Map<String,Object> getTaUser(int id);
}
