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
        //�õ������ļ���
        
		try {
			inputStream = Resources.getResourceAsStream(resource);
		    //�����Ự����,����Mybatis�������ļ���Ϣ
	        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        //����usermapper����,mybatis�Զ����ɴ������
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
