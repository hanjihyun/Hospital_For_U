package com.web.spring.carenotice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.web.spring.carenotice.model.vo.CareAttachment;
import com.web.spring.carenotice.model.vo.CareComment;
import com.web.spring.carenotice.model.vo.CareNotice;


public interface CareNoticeDao {

	List<CareNotice> careNotice(SqlSession session,int cPage,int numPerPage);
	int careCount(SqlSession session);
	List<Map<String, String>> searchContent(SqlSessionTemplate session, Map<String, String> param);


	int insertCare(SqlSession session, Map<String,String> param);
	int insertCareAttachment(SqlSession session, CareAttachment a);
	int readCount(SqlSession session,int no);
	
	CareNotice careView(SqlSession session,int cno);
	
	
	List<CareAttachment> selectCareFile(SqlSession session, int cno); 
	
	CareNotice updateView(SqlSession session,int no);
	List<CareAttachment> updateViewFile(SqlSession session,int no);
	
	int deleteCare(SqlSession session, int no);
	
	int updateCare(SqlSession session,Map<String,String> param);
	int updateCareAttachment(SqlSession session, CareAttachment a);
	
		
	int insertComment(SqlSession session, CareComment c);
	int insertComment2(SqlSession session, CareComment c);
	
	List<CareComment> commentList(SqlSession session, int no);
	int  commentCount(SqlSession session,int no);
	
	int replydelete(SqlSession session,int no);

	int replyupdate(SqlSession session,CareComment c);

}
