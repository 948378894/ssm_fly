package com.neuedu.service;

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

public interface ArticleService {
	// 加载文章类型
	List<Articletype> loadArticleType(int authority);
	// 文章发布-1.插入文章
	int releaseArticle(Articleinfo articleinfo);
	// 文章发布-2.修改飞吻
	int updateKissNum(Articleinfo articleinfo);
	// 加载首页的文章内容
	List<Map<String,Object>> getIndexArticleInfo();
	//首页文章总数
	int getTotalCounts();
	//加载首页非置顶的文章内容
	List<Map<String, Object>> getIndexNoStick(Page page);
	//加载首页置顶的文章内容
	List<Map<String, Object>> getIndexStick();
	//看帖
	Map<String, Object> getArticleDetail(int artid);
	//删除帖子
	int delArticleById(int artid);
	//置顶
	int isStick(int artid);
	//取消置顶
	int onStick(int artid);
	//加精
	int iscream(int artid);
	//取消加精
	int nocream(int artid);
	//添加评论
	int addMainComment(Commentinfo info);
	//查询帖子的评论
	List<Map<String, Object>> getCommentByArtId(int artid);
	//删除评论
	int delComment(int commid);
	//更新评论数
	int updateCommentNum(int commid);
	//是否采纳
	int commentAccept(int commid);
	//是否结贴
	int isDone(int artid);
	//结算支付飞吻
	int offerKiss(Userinfo userinfo);
	//查询是否已已收藏
	Map<String, Object> getCollectiocById(Collectioninfo coll);
	//收藏
	int getCollectioninfo(Collectioninfo info);
	//取消收藏
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
	//加载首页非置顶的文章内容
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
	int  addReplyMessage(Messageinfo message);
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
	//检查是否签到
	int checkqiandao(int signid);
	//检查所有签到日期
	List checkdate();	
}
