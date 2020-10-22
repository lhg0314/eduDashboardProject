package com.eduDashboardProject.user.dto;

import lombok.Data;

public @Data class UserDto {
	private int user_number;
	private String identification;
	private String password;
	private String name;
	private String create_date;
	private String update_date;
	private int verify;
}
