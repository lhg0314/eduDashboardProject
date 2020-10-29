<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <style>
/* .help-block 을 일단 보이지 않게 설정 */
#myForm .help-block {
	display: none;
}
/* glyphicon 을 일단 보이지 않게 설정 */
#myForm .glyphicon {
	display: none;
}
#myForm {
	width: 450px;
	margin: 30px auto;
	top: 0;
	
	background-color: rgba(255, 255, 255, 0.075);
}
body {
	
	
	background-size: cover;
	background-position: top center;
}
#con {
	
}
</style>
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
<div class="container" id="con">
    <h3 align="center">회원가입</h3>
    <form action="/user/insert" method="post" id="myForm" >
        <div class="form-group has-feedback">
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/>
            <span id="overlapErr" class="help-block">사용할 수 없는 아이디 입니다.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="memberName">이름</label>
            <input class="form-control" type="text" name="memberName" id="memberName"/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="password" id="password"/>
            <span id="pwdRegErr" class="help-block">8글자 이상 입력하세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="rePwd">비밀번호 재확인</label>
            <input class="form-control" type="password" name="rePwd" id="rePwd"/>
            <span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        
        
        <button class="btn btn-success" type="submit">가입</button>
        <button class="btn btn-success" type="reset">취소</button>
    </form>
</div>
<script>
    //아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
    $("#id").keyup(function(){
        //입력한 문자열을 읽어온다.
        var id=$(this).val();
        //ajax 요청을 해서 서버에 전송한다.
        $.ajax({
            method:"post",
            url:"/user/idCheck",
            data:{inputId:id},
            success:function(data){
                
                if(data){//사용 가능한 아이디 라면 
                    $("#overlapErr").hide();
                    // 성공한 상태로 바꾸는 함수 호출
                    successState("#id");
                    
                }else{//사용 가능한 아이디가 아니라면 
                    $("#overlapErr").show();
                    errorState("#id");
                }
            }
        });
    });
    $("#password").keyup(function(){
        var pwd=$(this).val();
        // 비밀번호 검증할 정규 표현식
        var reg=/^.{8,}$/;
        if(reg.test(pwd)){//정규표현식을 통과 한다면
                    $("#pwdRegErr").hide();
                    successState("#password");
        }else{//정규표현식을 통과하지 못하면
                    $("#pwdRegErr").show();
                    errorState("#password");
        }
    });
    $("#rePwd").keyup(function(){
        var rePwd=$(this).val();
        var pwd=$("#password").val();
        // 비밀번호 같은지 확인
        if(rePwd==pwd){//비밀번호 같다면
            $("#rePwdErr").hide();
            successState("#rePwd");
        }else{//비밀번호 다르다면
            $("#rePwdErr").show();
            errorState("#rePwd");
        }
    });
  
    // 성공 상태로 바꾸는 함수
    function successState(sel){
        $(sel)
        .parent()
        .removeClass("has-error")
        .addClass("has-success")
        .find(".glyphicon")
        .removeClass("glyphicon-remove")
        .addClass("glyphicon-ok")
        .show();
 
        $("#myForm button[type=submit]")
                    .removeAttr("disabled");
    };
    // 에러 상태로 바꾸는 함수
    function errorState(sel){
        $(sel)
        .parent()
        .removeClass("has-success")
        .addClass("has-error")
        .find(".glyphicon")
        .removeClass("glyphicon-ok")
        .addClass("glyphicon-remove")
        .show();
 
        $("#myForm button[type=submit]")
                    .attr("disabled","disabled");
    };
</script>    
</body>
</html>