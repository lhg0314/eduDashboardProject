package com.eduDashboardProject.notice.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.eduDashboardProject.notice.dto.NoticeDto;

@Repository("NoticeDao")
public class NoticeDao {
	
	@Resource(name = "sqlsessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeDto> getNotice(){
		return sqlSession.selectList("noticeMapper.getBoardList");
	}

	public void insertBoard(Object map) {
		sqlSession.insert("noticeMapper.insertBoard", map);
		
	}

	public NoticeDto selectBoardByno(int boardno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.getBoardListByno",boardno);
	}

	public void updateNotice(Object map) {
		// TODO Auto-generated method stub
		sqlSession.update("noticeMapper.updateNotice",map);
	}

	public void deleteNotice(int boardno) {
		// TODO Auto-generated method stub
		sqlSession.delete("noticeMapper.deleteNotice",boardno);
	}

}
