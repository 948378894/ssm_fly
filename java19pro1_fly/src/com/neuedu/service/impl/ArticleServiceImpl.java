package com.neuedu.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.domain.Articleinfo;
import com.neuedu.domain.Articletype;
import com.neuedu.domain.Collectioninfo;
import com.neuedu.domain.Commentinfo;
import com.neuedu.domain.Messageinfo;
import com.neuedu.domain.Page;
import com.neuedu.domain.Signinfo;
import com.neuedu.domain.Userinfo;
import com.neuedu.mapper.ArticleMapper;
import com.neuedu.service.ArticleService;
import com.neuedu.util.SqlSessionFactoryUtil;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired //自动装配
	ArticleMapper am ;
	@Override 
	public List<Articletype> loadArticleType(int authority) {
		return am.loadArticleType(authority);
	}
	@Override
	@Transactional//控制事务原子性，要么全成功，要么全失败
	public int releaseArticle(Articleinfo articleinfo) {
		am.updateKissNum(articleinfo);
		am.releaseArticle(articleinfo);
		
		return 1;
	}
	@Override
	public List<Map<String, Object>> getIndexArticleInfo() {
		return am.getIndexArticleInfo();
	}
	@Override
	public int updateKissNum(Articleinfo articleinfo) {
		// TODO Auto-generated method stub
		return am.updateKissNum(articleinfo);
	}
	@Override
	public int getTotalCounts() {
		
		return am.getTotalCounts();
	}
	@Override
	public List<Map<String, Object>> getIndexNoStick(Page page) {
		// TODO Auto-generated method stub
		return am.getIndexNoStick(page);
	}
	@Override
	public List<Map<String, Object>> getIndexStick() {
		// TODO Auto-generated method stub
		return am. getIndexStick();
	}
	@Override
	@Transactional
	public Map<String, Object> getArticleDetail(int artid) {
		am.addPageView(artid);
		
		return am.getArticleDetail(artid);
	}
	@Override
	@Transactional
	public int delArticleById(int artid) {
		int count=am.delArticleById(artid);
		
		return count ;
	}
	

	@Override
	@Transactional
	public int isStick(int artid) {
		int count=am.isStick(artid);
		
		return count;
	}
	@Override
	@Transactional
	public int onStick(int artid) {
		int count=am.onStick(artid);
		
		return count;
	}
	@Override
	@Transactional
	public int addMainComment(Commentinfo info) {
		am.addMainComment(info);
		am.addCommentNum(info);
		
		return 1;
	}
	@Override
	public List<Map<String, Object>> getCommentByArtId(int artid) {
		
		return am.getCommentByArtId(artid);
	}
	@Override
	@Transactional
	public int iscream(int artid) {
		int count=am.iscream(artid);
		
		return count;
	}
	@Override
	@Transactional
	public int nocream(int artid) {
		int count=am.nocream(artid);
		
		return count;
	}
	@Override
	@Transactional
	public int delComment(int commid) {
		int count=am.delComment(commid);
		
		return count;
	}
	@Override
	@Transactional
	public int updateCommentNum(int commid) {
		int count=am.updateCommentNum(commid);
		
		return count;
	}
	@Override
	@Transactional
	public int commentAccept(int commid) {
		int count=am.findAuthorid(commid);
				am.commentAccept(commid);
		
		return count;
	}
	@Override
	@Transactional
	public int isDone(int artid) {
		
		int count=am.isDone(artid);
		
		return count;
	}
	@Override
	@Transactional
	public int offerKiss(Userinfo userinfo) {
		int count=am.offerKiss(userinfo);
		
		return count;
	}
	@Override
	public Map<String, Object> getCollectiocById(Collectioninfo info) {
		
		return am.getCollectiocById(info);
	}
	@Override
	@Transactional
	public int getCollectioninfo(Collectioninfo info) {
		int count=am.getCollectioninfo(info);
		
		return count;
	}
	@Override
	@Transactional
	public int delcollection(Collectioninfo info) {
		int count=am.delcollection(info);
		
		return count;
	}
	@Override
	public int getCollectionNum(int id) {
		
		return am.getCollectionNum(id);
	}
	@Override
	public List<Map<String, Object>> getIndexCollection(Page page) {
		
		return am.getIndexCollection(page);
	}
	@Override
	public int getPostNum(int id) {
	
		return am.getPostNum(id);
	}
	@Override
	public List<Map<String, Object>> getIndexPost(Page page) {
		
		return am.getIndexPost(page);
	}
	@Override
	@Transactional
	public int editArticle(Articleinfo articleinfo) {
		int count=am.editArticle(articleinfo);
		
		return count;
	}
	@Override
	public List<Map<String, Object>> getIndexNoStick2(int minid) {
		
		return am.getIndexNoStick2(minid);
	}
	@Override
	public List<Map<String, Object>> getAllIndex(int minid) {
		// TODO Auto-generated method stub
		return am.getAllIndex(minid);
	}
	@Override
	public List<Map<String, Object>> getnoDoneIndex(int minid) {
		// TODO Auto-generated method stub
		return am.getnoDoneIndex(minid);
	}
	@Override
	public List<Map<String, Object>> getAcceptIndex(int minid) {
		// TODO Auto-generated method stub
		return am.getAcceptIndex(minid);
	}
	@Override
	public List<Map<String, Object>> getCreamIndex(int minid) {
		// TODO Auto-generated method stub
		return am.getCreamIndex(minid);
	}
	@Override
	public List<Map<String, Object>> getMypostIndex(int minid) {
		// TODO Auto-generated method stub
		return am.getMypostIndex(minid);
	}
	@Override
	@Transactional
	public int addReplyMessage(Messageinfo message) {
		int count=am.addReplyMessage(message);
		
		return count;
	}
	@Override
	public List<Map<String, Object>> getMessageById(Page page) {
		// TODO Auto-generated method stub
		return am.getMessageById(page);
	}
	@Override
	public String getNameBYyId(int id) {
		return am.getNameBYyId(id);
	}

	@Override
	@Transactional
	public int delMessById(int messid) {
		am.delMessById(messid);
		return 1;
	}
	@Override
	public List<Map<String, Object>> getPostIndex2(int id) {
		return am.getPostIndex2(id);
	}
	@Override
	public List<Map<String, Object>> getCommIndex(int id) {
		// TODO Auto-generated method stub
		return am.getCommIndex(id);
	}
	@Override
	public int getMessnumById(int id) {
		// TODO Auto-generated method stub
		return am.getMessnumById(id);
	}
	@Override
	@Transactional
	public int delAllMess(int id) {
		int count=am.delAllMess(id);
		return count;
	}
	@Override
	public List<Map<String, Object>> getReplyTop() {
		// TODO Auto-generated method stub
		return am.getReplyTop();
	}
	@Override
	public List<Map<String, Object>> getHotnote() {
		// TODO Auto-generated method stub
		return am.getHotnote();
	}
	@Override
	public List<Map<String, Object>> getHotcomm() {
		// TODO Auto-generated method stub
		return am.getHotcomm();
	}
	@Override
	@Transactional
	public int addqiandao(Signinfo sign) {
		int count=am.addqiandao(sign);
		return count;
	}
	@Override
	public int checkqiandao(int signid) {
		
		return am.checkqiandao(signid);
	}
	@Override
	public List checkdate() {
		// TODO Auto-generated method stub
		return am.checkdate();
	}

	
}