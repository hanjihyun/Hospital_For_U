package com.web.spring.ask.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.ask.model.dao.AskDao;
import com.web.spring.ask.model.vo.Ask;
import com.web.spring.ask.model.vo.AskReply;
import com.web.spring.member.model.vo.Member;

@Service
public class AskServiceImpl implements AskService {

	
	@Autowired
	private SqlSessionTemplate session;

	@Autowired
	private AskDao dao;

//selectList 및 페이징처리
	@Override
	public int selectAskCount() {
		return dao.selectAskCount(session);
	}

	@Override
	public List<Ask> selectAskList(int cPage, int numPerpage) {
		return dao.selectAskList(session,cPage,numPerpage);
	}

//insert
	@Override
	public int insertAsk(Ask ask) {
		return dao.insertAsk(session,ask);
	}
//selectOne
	@Override
	public Ask selectAskView(int no) {
		return dao.selectAskView(session,no);
	}
//update
	@Override
	public int updateAsk(Ask ask) {
		return dao.updateAsk(session,ask);
	}
//delete
	@Override
	public int deleteAsk(int no) {
		return dao.deleteAsk(session,no);
	}

//askList 검색
	@Override
	public List<Map<String, String>> searchAsk(Map<String, String> param) {
		return dao.searchAsk(session,param);
	}

//검색 페이징처리카운트	
@Override
	public int searchAskCount() {
		return dao.searchAskCount(session);
	}

//검색
@Override
public List<Ask> searchList(Map<String, String> param) {
	return dao.searchList(session,param);
}

	

//-------------------------Reply------------------------------------------------


	//insert
	@Override
	public int insertReply(AskReply reply) {
		return dao.insertReply(session,reply);
	}
//selectOne
	@Override
	public AskReply selectReplyView(int no) {
		return dao.selectReplyView(session,no);
	}
//delete
	@Override
	public int deleteReply(int no) {
		return dao.deleteReply(session,no);
	}

	/*
	 * @Override public int updateReply(AskReply reply) { return
	 * dao.updateReply(session,reply); }
	 */
//update	
	@Override
	public int updateReply(Map<String, Object> param) {
		return dao.updateReply(session,param);
	}
	
//ReplyCount
	@Override
	public int selectReplyCount() {
		return dao.selectReplyCount(session);
	}
	
//selectList
@Override
public List<AskReply> selectReplyList(int cPage, int numPerpage) {
	return dao.selectReplyList(session,cPage,numPerpage);
}

//답변 완료 replycnt+1
@Override
public int replyCnt(int no) {
	return dao.replyCnt(session,no);
}

//답변 완료 replycnt-1
@Override
public int deleteReplyCnt(int no) {
	return dao.deleteReplyCnt(session,no);
}







	
	
}
