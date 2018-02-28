<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		String userGender1 = result.getUserGender();
		out.println(userGender1);
		pageContext.setAttribute("test1", userGender1);
	%>
	<!--<c:out value="${userGender1}" />-->
	<header>
		<h1>내 정보</h1>
	</header>
	
	<div class="container">
		<div class="form_wrap">
			<form action="joinAction.jsp" method="post" name="loginform" onsubmit="return validateForm();">
				<div>
					<input type="text" name="userID" placeholder="아이디" maxlength="20" value="<%=result.getUserID() %>">
				</div>
				<div>
					<input type="password" name="userPassword" placeholder="비밀번호" maxlength="20">
				</div>
				<div>
					<input type="text" name="userName" placeholder="이름" maxlength="20" value="<%=result.getUserName() %>">
				</div>
				<div class="ip_chk1">
					<label>남자<input type="radio" name="userGender" value="남자" <%-- <c:if test="${ userGender1 == '남자'}">checked="checked"</c:if> --%> ></label>
					<label>여자<input type="radio" name="userGender" value="여자" <%-- <c:if test="${ userGender1 == '여자'}">checked="checked"</c:if> --%> ></label>
				</div>
				<div>
					<input type="email" name="userEmail" placeholder="이메일" maxlength="50" value="<%=result.getUserEmail() %>">
				</div>
				<div class="ip_txt1">
					<input type="text" name="userPhone1" maxlength="4"> - 
					<input type="text" name="userPhone1" maxlength="4"> - 
					<input type="text" name="userPhone1" maxlength="4">
				</div>
				<div class="ip_btn1">
					<input type="submit" value="정보수정" title="정보수정">
				</div>
				<div class="ip_btn1">
					<input type="submit" value="회원탈퇴" title="회원탈퇴">
				</div>
			</form>
		</div>
	</div>
	
	
	<script>
	function validateForm() {
        var userid = document.loginform.userID.value;
        var password = document.loginform.userPassword.value;
        var username = document.loginform.userName.value;
        var useremail = document.loginform.userEmail.value;
        
        if (!userid) {
        	alert ("아이디를 입력하세요");
        	document.loginform.userID.focus();
        	return false;
        }
        else if(!password){
        	alert ("비밀번호를 입력하세요");
        	document.loginform.userPassword.focus();
            return false;
        }
        else if(!username){
        	alert ("이름을 입력하세요");
        	document.loginform.userName.focus();
            return false;
        }
        else if(!document.loginform.userGender[0].checked && !document.loginform.userGender[1].checked){
        	alert ("성별을 체크하세요");
        	document.loginform.userGender[0].focus();
        	return false;
        }
        else if(!useremail){
        	alert ("이메일을 입력하세요");
        	document.loginform.userEmail.focus();
            return false;
        }
        else{
        	return true;
        }
  	}
	</script>
</body>
</html>