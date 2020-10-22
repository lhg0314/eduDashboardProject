package com.eduDashboardProject.user.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.eduDashboardProject.user.dto.UserDto;



@Repository("UserDao")
public class UserDao {

	@Resource(name = "sqlsessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int checkLogin(Object object) {

		return sqlSession.selectOne("userMapper.userChk",object);
	}
	
	public UserDto getUserInfo(Object object) {
		return sqlSession.selectOne("userMapper.selectUser",object);
	}

}
