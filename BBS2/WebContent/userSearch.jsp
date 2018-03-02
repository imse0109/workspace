<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String userSearchForm = request.getParameter("searchFormType");
	%>
	<header>
		<%
			if(userSearchForm.equals("ID")){
		%>
			<h1>아이디 찾기</h1>
		<%
			} else {
		%> 
			<h1>비밀번호 찾기</h1>
		<%
			}
		%>			
	</header>
	
	<div class="container">
		<div class="form_wrap">
			<form action="userSearchResult.jsp" method="post" name="loginform" onsubmit="return validateForm();">
				<%
					if(userSearchForm.equals("Password")){
				%>
				<div>
					<input type="text" name="userID" placeholder="아이디" maxlength="20">
				</div>
				<%
					}
				%>
				<div>
					<input type="text" name="userName" placeholder="이름" maxlength="20">
				</div>
				<div>
					<input type="text" name="userPhone" placeholder="전화번호" maxlength="12">
				</div>
				<%
				if(userSearchForm.equals("Password")){
				%>
				<div class="ip_btn1">
					<input type="submit" value="인증" title="인증">
				</div>
				<div>
					<input type="text" name="authNumber" placeholder="인증번호" maxlength="10">
				</div>
				<%
					}
				%>
				<div class="ip_btn1">
					<input type="submit" value="아이디찾기" title="아이디찾기">
				</div>
			</form>
		</div>
		<div class="login_rel">
			<a href="login.jsp">로그인</a>
			<%
				if(userSearchForm.equals("Password")){
			%>
				<a href="userSearch.jsp?searchFormType=ID">아이디 찾기</a>
			<%
				} else {
			%>
				<a href="userSearch.jsp?searchFormType=Password">비밀번호 찾기</a>
			<%
				}
			%>
		</div>
	</div>
	
	
	<script>
	function validateForm() {
        var username = document.loginform.userName.value;
        var userPhone = document.loginform.userPhone.value;

        if(!username){
        	alert ("이름을 입력하세요");
        	document.loginform.userName.focus();
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