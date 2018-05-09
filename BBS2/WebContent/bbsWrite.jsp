<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String mbbsID = request.getParameter("bbsID");
		String mbbsTitle = request.getParameter("bbsTitle");
		String mbbsContent = request.getParameter("bbsContent");
	%>
	<c:set var="mbbsTitle" value="<%=mbbsTitle %>" />
	<c:set var="mbbsContent" value="<%=mbbsContent %>" />
	<header>
		<h1>게시판</h1>
	</header>
	
	<div class="container">
		<div class="bbs">
			<form method="post" <c:choose><c:when test="${ mbbsTitle == null}">action="bbsWriteAction.jsp"</c:when><c:otherwise>action="bbsModifyAction.jsp"</c:otherwise></c:choose>>
				<table>
					<tr>
						<th colspan="2">게시판 글쓰기 양식</th>
					</tr>
					<tr>
						<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<c:choose><c:when test="${ mbbsTitle == null}"></c:when><c:otherwise>${ mbbsTitle }</c:otherwise></c:choose>"></td>
					</tr>
					<tr>
						<td>
							<textarea placeholder="글 내용" name="bbsContent" maxlength="2048"><c:choose><c:when test="${ mbbsContent == null}"></c:when><c:otherwise>${ mbbsContent }</c:otherwise></c:choose></textarea>
						</td>
					</tr>
				</table>
				<div class="bbs_btn">
					<c:choose>
						<c:when test="${ mbbsTitle == null}">
							<input type="submit" class="btn_write" value="글쓰기">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="bbsID" value="<%=mbbsID %>">
							<input type="submit" class="btn_write" value="수정">
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>
</body>
</html>