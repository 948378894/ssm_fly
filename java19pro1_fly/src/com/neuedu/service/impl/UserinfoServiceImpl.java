package com.neuedu.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.domain.Userinfo;
import com.neuedu.mapper.UserinfoMapper;
import com.neuedu.service.UserinfoService;
import com.neuedu.util.SqlSessionFactoryUtil;
@Service
public class UserinfoServiceImpl implements UserinfoService {
	@Autowired //自动装配
	UserinfoMapper um;
	@Override
	public int regEmailCheck(String email) {
		
		return um.regEmailCheck(email);
	}
	@Override
	@Transactional //控制事务原子性，要么全成功，要么全失败
	public int addUserinfo(Userinfo userinfo) {
		int count=um.addUserinfo(userinfo);
		
		return count;
	}
	@Override
	public int getEmailandPass(Userinfo userinfo) {
		
		return um.getEmailandPass(userinfo);
	}
	@Override
	public Userinfo LoginCheck(Userinfo userInfo) {
	
		return um.LoginCheck(userInfo);
	}
	@Override
	@Transactional
	public int UpdataUserinfo(Userinfo userinfo) {
		int count=um.UpdataUserinfo(userinfo);
		
		return count;
	}
	@Override
	public int setEmailCheck(Userinfo userinfo) {
		// TODO Auto-generated method stub
		return um.setEmailCheck(userinfo);
	}
	@Override
	@Transactional
	public int updatePass(Userinfo userinfo) {
		int count=um.updatePass(userinfo);
		
		return count;
	
	}
	@Override
	@Transactional
	public int activeMail(String mailcode) {
		int count=um.activeMail(mailcode);
		
		return count;
	}
	@Override
	@Transactional
	public int uploadHeadImg(Userinfo userinfo) {
		int count=um.uploadHeadImg(userinfo);
		
		return count;
	}
	@Override
	public Map<String, Object> getTaUser(int id) {
		// TODO Auto-generated method stub
		return um.getTaUser(id);
	}
	
}
