package com.eduDashboardProject.user.dao;

import java.util.Map;

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

	public int checkLoginId(String inputId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.checkJoinId", inputId);
	}

	public int insertUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("userMapper.insertUser", map);
	}

}
