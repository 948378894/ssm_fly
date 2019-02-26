package com.neuedu.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.neuedu.mapper.UserinfoMapper;

public class SqlSessionFactoryUtil {
	private static SqlSessionFactoryUtil ssfu;
	InputStream inputStream=null;
	private SqlSessionFactoryUtil() {}
	public static SqlSessionFactoryUtil getInstance() {
		if(ssfu==null) {
			ssfu=new SqlSessionFactoryUtil();
		}
		return ssfu;
	}
	public SqlSession getSqlSession() {
	    String resource = "SqlMapConfig.xml";
        //得到配置文件流
        
		try {
			inputStream = Resources.getResourceAsStream(resource);
		    //创建会话工厂,传入Mybatis的配置文件信息
	        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        //创建usermapper对象,mybatis自动生成代理对象
	        return sqlSession;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public void colse() {
		if(inputStream!=null) {
			try {
				inputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
