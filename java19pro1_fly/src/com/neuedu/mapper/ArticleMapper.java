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
	// ������������
	List<Articletype> loadArticleType(int authority);
	// ���·���-1.��������
	int releaseArticle(Articleinfo articleinfo);
	// ���·���-2.�޸ķ���
	int updateKissNum(Articleinfo articleinfo);
	// ������ҳ����������
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
	//�ղ�����
	int getCollectionNum(int id);
	//��һҳ�ղ�����
	List<Map<String, Object>> getIndexCollection(Page page);
	//��������
	int getPostNum(int id);
	//��һҳ��������
	List<Map<String, Object>> getIndexPost(Page page);
	// ���·���-1.��������
	int editArticle(Articleinfo articleinfo);
	List<Map<String, Object>> getIndexNoStick2(int minid);
	//��ȡ������������
	List<Map<String, Object>> getAllIndex(int minid);
	//��ȡδ��������
	List<Map<String, Object>> getnoDoneIndex(int minid);
	//��ȡ��������
	List<Map<String, Object>> getAcceptIndex(int minid);
	//��ȡ��������
	List<Map<String, Object>> getCreamIndex(int minid);
	//��ȡ�ҵ���������
	List<Map<String, Object>> getMypostIndex(int minid);
	//��ȡǰ5����������
	List<Map<String, Object>> getPostIndex2(int id);
	//��ȡǰ3���ظ�����
	List<Map<String, Object>> getCommIndex(int id);		
	//��ӻظ�����
	int addReplyMessage(Messageinfo message);
	//��ѯĳ�����лظ�
	List<Map<String, Object>> getMessageById(Page page);
	//ͨ��ID���ǳ�
	String getNameBYyId(int id);
	//ɾ����Ϣ
	int delMessById(int messid);
	//ͨ��id��ѯ��Ϣ����
	int getMessnumById(int id);
	//���������Ϣ
	int delAllMess(int id);
	//�ظ���12
	List<Map<String, Object>> getReplyTop();	
	//������
	List<Map<String, Object>> getHotnote();	
	//�����
	List<Map<String, Object>> getHotcomm();
	//ǩ��
	int addqiandao(Signinfo sign);
	//�������Ƿ�ǩ��
	int checkqiandao(int signid);
	//�������ǩ������
	List checkdate();	
}
