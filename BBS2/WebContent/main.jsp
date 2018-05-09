<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />

<jsp:include page="header.jsp"></jsp:include>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} else {
			response.sendRedirect("login.jsp");
		}
	%>

	<header>
		<h1>MAIN</h1>
	</header>
	
	<div class="container">
		<div class="main">
			<p><span><%=userID %></span> 환영합니다.</p>
			<a href="bbs.jsp">게시판</a>
		</div>
		<div class="login_rel">
			<a href="#" onclick="confirmLogout();">로그아웃</a>
			<a href="mypage.jsp">내정보</a>
		</div>
	</div>
	
	<script>
	function confirmLogout() {
		var check = confirm("로그아웃 하시겠습니까?");
        if(check){
        	location.href = "logout.jsp";
        }
    }
	</script>
	
</body>
</html>