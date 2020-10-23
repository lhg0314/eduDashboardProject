package com.eduDashboardProject.notice.dto;

import lombok.Data;

public @Data class NoticeDto {
	private int board_number;
	private int user_number;
	private String title;
	private String comment;
	private String identification;
	private String create_date;
}
