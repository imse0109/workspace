<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
		String bbsID = request.getParameter("bbsID");
		BbsDAO BbsDAO = new BbsDAO();
		Bbs bbs = BbsDAO.getChoiceLists(bbsID);
%>
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
		<a href="main.jsp" class="main">MAIN</a>
		<h1>게시판</h1>
	</header>
	
	<div class="container">
		<div class="bbs">
			<table>
				<tr>
					<th colspan="2">BBSView</th>
				</tr>
				<tr>
					<td><%=bbs.getUserID() %></td>
					<td><%=bbs.getBbsDate() %></td>
				</tr>
				<tr>
					<td colspan="2"><%=bbs.getBbsTitle() %></td>
				</tr>
				<tr>
					<td colspan="2"><%=bbs.getBbsContent() %></td>
				</tr>
			</table>
			<div class="bbs_btn">
				<form method="post" action="bbsWriteAction.jsp">
					<input type="submit" class="btn_write" value="수정">
				</form>
				<form method="post" action="bbsDeleteAction.jsp" name="bbsdeleteform">
					<input type="hidden" name="bbsID" value="<%=bbs.getBbsID() %>">
					<input type="submit" class="btn_write" value="삭제">
				</form>
			</div>
		</div>
	</div>
</body>
</html>