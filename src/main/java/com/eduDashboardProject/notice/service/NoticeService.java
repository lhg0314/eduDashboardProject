package com.eduDashboardProject.notice.service;

import java.util.List;
import java.util.Map;

import com.eduDashboardProject.notice.dto.NoticeDto;

public interface NoticeService{
	
	public List<NoticeDto> getBoard() throws Exception;
	public void insertBoard(Object map) throws Exception;
	public NoticeDto getNoticeByno(int boardno);
	public void updateNotice(Object map);
	public void deleteNotice(int boardno);

}
