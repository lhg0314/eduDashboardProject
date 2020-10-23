<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<body>

<br>
	<h3 class="text-center">게시물 상세</h3>
	<br><br>
	<c:if test="${board.user_number eq userInfo.user_number }">
	<button style="margin-left: 10px;" class="btn  pull-right" onclick="location.href='/notice/update?boardno=${board.board_number}'">수정</button>
	<button style="margin-left: 10px;" class="btn pull-right" onclick="location.href='/notice/delete?boardno=${board.board_number}'">삭제</button> 
	</c:if>
	<button class="btn pull-right" onclick="location.href='/notice/list'">목록</button>
	<br><br>
<table class="table">
<tr>
<th>작성자</th>
<td>${board.identification }</td>
</tr>

<tr>
<th>게시물 번호</th>
<td>${board.board_number }</td>
</tr>

<tr>
<th>제목</th>
<td>${board.title }</td>
</tr>

<tr>
<th>작성일자</th>
<td>${board.create_date }</td>
</tr>

<tr>
<th>내용</th>
<td>${board.comment }</td>
</tr>


</table>
</body>
</html>