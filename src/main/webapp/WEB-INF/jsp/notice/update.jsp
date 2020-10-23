<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>
<div class="login-form" style="width: 600px; margin: 0 auto;">
    <form action="/notice/updateimpl" method="post">
		

		<br>
        <h3 class="text-center">게시물 수정</h3>
        <br>
        
        <div class="form-group">
        	<input type="text" class="form-control" id="title" name="title" value="${board.title }" required="required">
        </div>
        
		<div class="form-group">
            <textarea  class="form-control" id="content" name="content" required="required">${board.comment }</textarea>
        </div> 
        
       <div class="form-group">
        	<input type="hidden" class="form-control" id="boardno" name="boardno" value="${board.board_number }" required="required">
        </div>
            
        <div class="form-group">
            <button type="submit"  class="btn btn-danger btn-lg btn-block">수정하기</button>
        </div>
		
    </form>
    

    <br><br>

</div>
</body>
</html>