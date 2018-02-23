<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
</head>
<body>
	<header>
		<h1>loginPage</h1>
		<a href="login.jsp" class="on">로그인</a>
		<a href="join.jsp">회원가입</a>
	</header>
	<form action="loginAction.jsp" method="post">
		<div>
			<input type="text" name="userID" placeholder="아이디" maxlength="20">
		</div>
		<div>
			<input type="password" name="userPassword" placeholder="비밀번호" maxlength="20">
		</div>
		<div>
			<input type="submit" value="로그인" title="로그인">
		</div>
	</form>
</body>
</html>