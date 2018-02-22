<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>joinPage</h1>
		<a href="login.jsp">로그인</a>
		<a href="join.jsp">회원가입</a>
	</header>
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
		<div>
			<label>남자<input type="radio" name="userGender"></label>
			<label>여자<input type="radio" name="userGender"></label>
		</div>
		<div>
			<input type="text" name="userEmail" placeholder="이메일" maxlength="50">
		</div>
		<div>
			<input type="submit" value="회원가입" title="회원가입">
		</div>
	</form>
</body>
</html>