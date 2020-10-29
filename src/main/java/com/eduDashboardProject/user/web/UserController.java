package com.eduDashboardProject.user.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eduDashboardProject.user.dto.UserDto;
import com.eduDashboardProject.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource(name="UserService")
	private UserService userService;
	
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public String checkUser(@RequestParam String userId,@RequestParam String userPw,HttpSession session) {
		Map<String,String> map=new HashMap<String, String>();
		
		map.put("id", userId);
		map.put("pw", userPw);
		
		int chk_result=userService.loginCheck(map);
		UserDto user=null;
		
		
		if(chk_result == 1) {//로그인 정보가 있을때
			user=userService.getUserInfo(map);
			session.setAttribute("userInfo", user);//사용자의 정보를 세션에 저장
		}
		
		return chk_result+"";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		session.invalidate();
		return "redirect:/user/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public int checkId(@RequestParam String inputId) {
		int res=userService.checkJoinId(inputId);
		
		
		if(res>0) {
			return 0;
		}else {
			return 1;
		}
	}
	
	
	@RequestMapping("/insert")
	public ModelAndView insertUser(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String, Object>();
		
		map.put("id", req.getParameter("id"));
		map.put("pw", req.getParameter("password"));
		map.put("name", req.getParameter("memberName"));
		
		int res=userService.insertUser(map);
		
		if(res>0) {//success insert
			mav.setViewName("/notice/result");
			mav.addObject("alertMsg", "회원가입이 완료 되었습니다. 로그인 해주세요");
			mav.addObject("url", "/user/login");
			
		}else {//fail insert
			mav.setViewName("/notice/result");
			mav.addObject("alertMsg", "회원가입 실패. 다시 회원가입 해주세요");
			mav.addObject("url", "/user/join");
		}
		
	
		
		return mav;
	}
	

}
