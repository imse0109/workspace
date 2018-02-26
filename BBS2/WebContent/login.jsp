<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
</head>
<body>
	<header>
		<h1>LOGIN</h1>
	</header>
	
	<div class="container">
		<div class="form_wrap">
			<form action="loginAction.jsp" method="post" name="loginform" onsubmit="return validateForm();">
				<div>
					<input type="text" name="userID" placeholder="아이디" maxlength="20">
				</div>
				<div>
					<input type="password" name="userPassword" placeholder="비밀번호" maxlength="20">
				</div>
				<div class="ip_btn1">
					<input type="submit" value="로그인" title="로그인">
				</div>
			</form>
		</div>
		<div class="login_rel">
			<a href="join.jsp">회원가입</a>
			<a href="join.jsp">아이디 찾기</a>
			<a href="join.jsp">비밀번호 찾기</a>
		</div>
	</div>
	
	
	<script>
	function validateForm() {
        var userid = document.loginform.userID.value;
        var password = document.loginform.userPassword.value;
        if (!userid) {
        	alert ("아이디를 입력하세요");
        	document.loginform.userID.focus();
        	return false;
        }
        else if(!password){
        	alert ("비밀번호를 입력하세요");
        	document.loginform.userPassword.focus();
            return false;
        }
        else{
        	return true;
        }
  	}
	</script>
</body>
</html>