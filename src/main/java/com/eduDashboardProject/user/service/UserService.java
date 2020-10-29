package com.eduDashboardProject.user.service;

import java.util.Map;

import com.eduDashboardProject.user.dto.UserDto;

public interface UserService {
	
	public int loginCheck(Object map);
	
	public UserDto getUserInfo(Object map);

	public int checkJoinId(String inputId);

	public int insertUser(Map<String, Object> map);

}
