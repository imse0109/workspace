<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		String userPassword = null;
		String userName = null;
		String userGender = null;
		String userEmail = null;
		String userPhone = null;
		if(request.getParameter("userID") != null){
			userID = request.getParameter("userID");
		}
		if(request.getParameter("userPassword") != null){
			userPassword = request.getParameter("userPassword");
		}
		if(request.getParameter("userName") != null){
			userName = request.getParameter("userName");
		}
		if(request.getParameter("userGender") != null){
			userGender = request.getParameter("userGender");
		}
		if(request.getParameter("userEmail") != null){
			userEmail = request.getParameter("userEmail");
		}
		if(request.getParameter("userPhone") != null){
			userPhone = request.getParameter("userPhone");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new User(userID, userPassword, userName, userGender, userEmail, userPhone, SHA256.getSHA256(userEmail),false));
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 완료')");
			script.println("location.href = 'emailSendAction.jsp'");
			script.println("</script>");			
		}
	%>
	
</body>
</html>