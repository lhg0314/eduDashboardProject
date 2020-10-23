package com.eduDashboardProject.notice.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eduDashboardProject.notice.dto.NoticeDto;
import com.eduDashboardProject.notice.service.NoticeService;
import com.eduDashboardProject.user.dto.UserDto;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	
	@Resource(name="NoticeService")
	NoticeService noticeService;

	@RequestMapping("/list")
	public String getBoard(Model model) throws Exception {
		List<NoticeDto> boardList=noticeService.getBoard();
		model.addAttribute("boardList", boardList);
		return "notice/list";
	}
	
	@RequestMapping("/write")
	public String writeNotice() {
		return "notice/write";
	}
	
	@RequestMapping("/insert")
	public String insertNotice(@RequestParam String title,@RequestParam String content,HttpSession session) throws Exception {
		Map <String,Object> map=new HashMap<String, Object>();
		UserDto user=(UserDto) session.getAttribute("userInfo");
		
		
		map.put("title", title);
		map.put("content", content);
		map.put("userInfo",user);
		
		noticeService.insertBoard(map);
		
		
		return "redirect:/notice/list";
		
	}
	
	@RequestMapping("/detail")
	public String detailNotice(HttpServletRequest req,Model model) {
		int boardno=Integer.parseInt(req.getParameter("boardno"));
		NoticeDto board=noticeService.getNoticeByno(boardno);
//		System.out.println(board);
		model.addAttribute("board",board);
		
		return "notice/detail";
		
	}
	
	
	@RequestMapping("/update")
	public String updateNotice(HttpServletRequest req,Model model) {
		int boardno=Integer.parseInt(req.getParameter("boardno"));
		NoticeDto board=noticeService.getNoticeByno(boardno);
		model.addAttribute("board",board);
		return "notice/update";
	} 
	
	@RequestMapping("/updateimpl")
	
	public String updateNoticeImpl(@RequestParam int boardno, @RequestParam String title,@RequestParam String content) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("title",title);
		map.put("comment",content);
		map.put("boardno",boardno);
		
		noticeService.updateNotice(map);
		
		
		return "redirect:/notice/detail?boardno="+boardno;
	}
	
	@RequestMapping("/delete")
	public String deleteNotice(@RequestParam int boardno) {
		noticeService.deleteNotice(boardno);
		return "redirect:/notice/list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
