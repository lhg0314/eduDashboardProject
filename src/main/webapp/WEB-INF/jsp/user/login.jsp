<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
function loginCheck(){
	
	userId=$("#userId").val();
	
	userPw=$("#userPw").val();
	
	
	$.ajax({
		type:"POST",
		url:"/user/check",
		data:{"userPw":userPw,"userId":userId},
		success:function(data){
			if(data=="0"){//db테이블에 회원정보가 없을때
				document.querySelector("#login-check-msg").innerHTML = "아이디 또는 비밀번호가 일치하지 않습니다.";
			}else{//성공했을때
				window.location.href="/notice/list";
			}
		}
		
	});
}

</script>


<body>
<div class="login-form" style="width: 300px; margin: 0 auto;">
    <form action="/user/check" method="post">
		
<!-- 			<img src="/examples/images/avatar.png" alt="Avatar"> -->
<!-- 			
			<div class="lcb-float">
				<i class="fa fa-users fa-4x"></i>
			</div>
-->
		<br>
        <h3 class="text-center">로그인 페이지</h3>
        <br>
        
        <div class="form-group">
        	<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디 입력" required="required">
        </div>
        
		<div class="form-group">
            <input type="password" class="form-control" id="userPw" name="userPw" placeholder="패스워드 입력" required="required">
        </div> 
        
        <span id="login-check-msg" class="login-check-msg" style="font-size: 8px; text-align: center;"></span>
            
        <div class="form-group">
            <button type="button" id="loginBtn" name="idBtn" onclick="loginCheck()" class="btn btn-primary btn-lg btn-block">로그인</button>
        </div>
		
    </form>
    

    <br><br>

</div>
</body>
</html>