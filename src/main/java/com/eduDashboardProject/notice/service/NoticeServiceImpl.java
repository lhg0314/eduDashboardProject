package com.eduDashboardProject.notice.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.eduDashboardProject.notice.dao.NoticeDao;
import com.eduDashboardProject.notice.dto.NoticeDto;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Resource(name="NoticeDao")
	private NoticeDao noticeDao;

	@Override
	public List<NoticeDto> getBoard() {
		// TODO Auto-generated method stub
		
		return noticeDao.getNotice();
	}

	@Override
	public void insertBoard(Object map) throws Exception {
		noticeDao.insertBoard(map);
		
	}

	@Override
	public NoticeDto getNoticeByno(int boardno) {
		return noticeDao.selectBoardByno(boardno);
		
	}

	

}
