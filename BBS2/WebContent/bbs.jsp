<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		BbsDAO BbsDAO = new BbsDAO();
		ArrayList<Bbs> list = BbsDAO.getLists();
		request.setAttribute("bbsList", list);
	%>
	<header>
		<a href="main.jsp" class="main">MAIN</a>
		<h1>게시판</h1>
	</header>
	
	<div class="container">
		<div class="bbs">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:choose>
				<c:when test="${ bbsList == '[]'}">
				<tr>
					<td colspan="4" class="no_board">등록된 글이 없습니다.</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="bbsList" items="${ bbsList }">
					<tr>
						<td>${ bbsList.bbsID }</td>
						<td><a href="bbsView.jsp?bbsID=${ bbsList.bbsID }">${ bbsList.bbsTitle }</a></td>
						<td>${ bbsList.userID }</td>
						<td>${ bbsList.bbsDate }</td>
					</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</table>
			<div class="bbs_paging">
				<a href="#">이전</a>
				<a href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">다음</a>
			</div>
			<div class="bbs_btn">
				<a href="bbsWrite.jsp" class="btn_write">글쓰기</a>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	$(document).ready(function(){
		var bbsLength = $(".bbs tr").length;
		console.log(bbsLength);
		
	});	
	</script>
</body>
</html>