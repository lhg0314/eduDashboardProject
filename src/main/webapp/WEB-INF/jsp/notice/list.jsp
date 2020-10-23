<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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


</head>
<body>

	<br>
	<h3 class="text-center">게시판</h3>
	<br>
	<button style="margin-left: 10px;" class="btn pull-right" onclick="location.href='/notice/write'">글쓰기</button>
	<button class="btn btn-danger pull-right" onclick="location.href='/user/logout'">로그아웃</button>
	<br><br>
	<table class="table table-hover center">
		<tr>
			<th>id</th>
			<th>board_number</th>
			<th>title</th>
			<th>create_date</th>
			<th>user_number</th>

		</tr>

		<c:forEach items="${boardList }" var="l">
			<tr>
				<td>${l.identification }</td>
				<td>${l.board_number }</td>
				<td><a href="/notice/detail?boardno=${l.board_number }">${l.title }</a></td>
				<td>${l.create_date }</td>
				<td>${l.user_number }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>