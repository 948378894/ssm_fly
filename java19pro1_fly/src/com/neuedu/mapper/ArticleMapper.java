package com.neuedu.mapper;

import java.util.List;
import java.util.Map;



import com.neuedu.domain.Articleinfo;
import com.neuedu.domain.Articletype;
import com.neuedu.domain.Collectioninfo;
import com.neuedu.domain.Commentinfo;
import com.neuedu.domain.Messageinfo;
import com.neuedu.domain.Page;
import com.neuedu.domain.Signinfo;
import com.neuedu.domain.Userinfo;


public interface ArticleMapper {
	// 加载文章类型
	List<Articletype> loadArticleType(int authority);
	// 文章发布-1.插入文章
	int releaseArticle(Articleinfo articleinfo);
	// 文章发布-2.修改飞吻
	int updateKissNum(Articleinfo articleinfo);
	// 加载首页的文章内容
	List<Map<String,Object>> getIndexArticleInfo();
	int getTotalCounts();
	List<Map<String, Object>> getIndexNoStick(Page page);
	List<Map<String, Object>> getIndexStick();
	Map<String, Object> getArticleDetail(int artid);
	int delArticleById(int artid);
	int addPageView(int artid);
	int isStick(int artid);
	int onStick(int artid);
	int iscream(int artid);
	int nocream(int artid);
	int addMainComment(Commentinfo info);
	int addCommentNum(Commentinfo info);
	List<Map<String, Object>> getCommentByArtId(int artid);
	int delComment(int commid);
	int updateCommentNum(int commid);
	int commentAccept(int commid);
	int isDone(int artid);
	int offerKiss(Userinfo userinfo);
	int findAuthorid(int commid);
	Map<String, Object> getCollectiocById(Collectioninfo info);
	int getCollectioninfo(Collectioninfo info);
	int delcollection(Collectioninfo info);
	//收藏总数
	int getCollectionNum(int id);
	//第一页收藏内容
	List<Map<String, Object>> getIndexCollection(Page page);
	//发帖总数
	int getPostNum(int id);
	//第一页发帖内容
	List<Map<String, Object>> getIndexPost(Page page);
	// 文章发布-1.插入文章
	int editArticle(Articleinfo articleinfo);
	List<Map<String, Object>> getIndexNoStick2(int minid);
	//获取所有文字内容
	List<Map<String, Object>> getAllIndex(int minid);
	//获取未结贴内容
	List<Map<String, Object>> getnoDoneIndex(int minid);
	//获取采纳内容
	List<Map<String, Object>> getAcceptIndex(int minid);
	//获取精帖内容
	List<Map<String, Object>> getCreamIndex(int minid);
	//获取我的帖子内容
	List<Map<String, Object>> getMypostIndex(int minid);
	//获取前5条帖子内容
	List<Map<String, Object>> getPostIndex2(int id);
	//获取前3条回复内容
	List<Map<String, Object>> getCommIndex(int id);		
	//添加回复评论
	int addReplyMessage(Messageinfo message);
	//查询某人所有回复
	List<Map<String, Object>> getMessageById(Page page);
	//通过ID的昵称
	String getNameBYyId(int id);
	//删除消息
	int delMessById(int messid);
	//通过id查询消息数量
	int getMessnumById(int id);
	//清除所有消息
	int delAllMess(int id);
	//回复榜12
	List<Map<String, Object>> getReplyTop();	
	//热帖榜
	List<Map<String, Object>> getHotnote();	
	//热议榜
	List<Map<String, Object>> getHotcomm();
	//签到
	int addqiandao(Signinfo sign);
	//检查今天是否签到
	int checkqiandao(int signid);
	//检查所有签到日期
	List checkdate();	
}
