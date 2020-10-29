package com.eduDashboardProject.user.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.eduDashboardProject.user.dao.UserDao;
import com.eduDashboardProject.user.dto.UserDto;

@Service("UserService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="UserDao")
	private UserDao userDao;

	//사용자 확인
	@Override
	public int loginCheck(Object map) {
		// TODO Auto-generated method stub
		return userDao.checkLogin(map);
	}

	@Override
	public UserDto getUserInfo(Object map) {
		// TODO Auto-generated method stub
		return userDao.getUserInfo(map);
	}

	@Override
	public int checkJoinId(String inputId) {
		// TODO Auto-generated method stub
		return userDao.checkLoginId(inputId);
	}

	@Override
	public int insertUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDao.insertUser(map);
	}

}
