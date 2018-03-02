<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		User result = userDAO.getUser(userID);
	%>
	<c:set var="userGender" value="<%=result.getUserGender() %>" />
	<c:set var="userEmail" value="<%=result.getUserEmail() %>" />
	<c:set var="userPhone" value="<%=result.getUserPhone() %>" />
	<header>
		<h1>내 정보</h1>
	</header>
	
	<div class="container">
		<div class="form_wrap">
			<form action="mypageAction.jsp" method="post" name="loginform" onsubmit="return validateForm();">
				<p><%=result.getUserID() %></p>
				<p><%=result.getUserName() %></p>
				<div>
					<input type="hidden" name="userID" value="<%=result.getUserID() %>">
				</div>
				<div class="ip_chk1">
					<label>남자<input type="radio" name="userGender" value="남자" <c:if test="${ userGender == '남자'}">checked="checked"</c:if> ></label>
					<label>여자<input type="radio" name="userGender" value="여자" <c:if test="${ userGender == '여자'}">checked="checked"</c:if> ></label>
				</div>
				<div>
					<input type="email" name="userEmail" placeholder="이메일" maxlength="50" value="<c:choose><c:when test="${ userEmail == null}"></c:when><c:otherwise>${ userEmail }</c:otherwise></c:choose>">
				</div>
				<div>
					<input type="text" name="userPhone" placeholder="전화번호" maxlength="11" value="<c:choose><c:when test="${ userPhone == null}"></c:when><c:otherwise>${ userPhone }</c:otherwise></c:choose>">
				</div>
				<div class="ip_btn1">
					<input type="submit" value="정보수정" title="정보수정">
				</div>
			</form>
			
			<form action="deleteAction.jsp" method="post" name="deleteform">
				<div>
					<input type="hidden" name="userID" value="<%=result.getUserID() %>">
				</div>
				<div class="ip_btn1">
					<input type="submit" value="회원탈퇴" title="회원탈퇴">
				</div>
			</form>
		</div>
	</div>
	
	
	<script>
	function validateForm() {
        var useremail = document.loginform.userEmail.value;
        var userPhone = document.loginform.userPhone.value;
        
        if(!document.loginform.userGender[0].checked && !document.loginform.userGender[1].checked){
        	alert ("성별을 체크하세요");
        	document.loginform.userGender[0].focus();
        	return false;
        }
        else if(!useremail){
        	alert ("이메일을 입력하세요");
        	document.loginform.userEmail.focus();
            return false;
        }
        else if(!userPhone){
        	alert ("전화번호를 입력하세요");
        	document.loginform.userPhone.focus();
            return false;
        }
        else{
        	return true;
        }
  	}
	</script>
</body>
</html>