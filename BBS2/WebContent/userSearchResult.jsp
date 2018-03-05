<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		UserDAO userDAO = new UserDAO();
		User result = userDAO.searchUserID(user.getUserName(), user.getUserEmail());
	%>
	<header>
		<h1>아이디 찾기</h1>
	</header>
	
	<div class="container">
		<div class="form_wrap">
			<p><%=result.getUserID() %></p>
		</div>
		<div class="login_rel">
			<a href="login.jsp">로그인</a>
			<a href="userSearch.jsp?searchFormType=Password">비밀번호 찾기</a>
		</div>
	</div>
</body>
</html>