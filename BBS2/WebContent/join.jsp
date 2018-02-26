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
		<h1>JOIN</h1>
	</header>
	
	<div class="container">
		<div class="form_wrap">
			<form action="joinAction.jsp" method="post">
				<div>
					<input type="text" name="userID" placeholder="아이디" maxlength="20">
				</div>
				<div>
					<input type="password" name="userPassword" placeholder="비밀번호" maxlength="20">
				</div>
				<div>
					<input type="text" name="userName" placeholder="이름" maxlength="20">
				</div>
				<div class="ip_chk1">
					<label>남자<input type="radio" name="userGender" value="남자"></label>
					<label>여자<input type="radio" name="userGender" value="여자"></label>
				</div>
				<div>
					<input type="email" name="userEmail" placeholder="이메일" maxlength="50">
				</div>
				<div class="ip_btn1">
					<input type="submit" value="회원가입" title="회원가입">
				</div>
			</form>
		</div>
		<div class="login_rel">
			<a href="login.jsp">로그인</a>
			<a href="join.jsp">회원가입</a>
		</div>
	</div>
	
</body>
</html>