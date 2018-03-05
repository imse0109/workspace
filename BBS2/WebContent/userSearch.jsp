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
			if(userSearchForm.equals("Password")){
		%>
			<h1>비밀번호 찾기</h1>
		<%
			} else {
		%> 
			<h1>아이디 찾기</h1>
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
					<input type="Email" name="userEmail" placeholder="이메일" maxlength="50">
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
					<%
						if(userSearchForm.equals("Password")){
					%>
						<input type="submit" value="비밀번호찾기" title="비밀번호찾기">
					<%
						} else {
					%>
						<input type="submit" value="아이디찾기" title="아이디찾기">
					<%
						}
					%>
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
		<%
			if(userSearchForm.equals("Password")){
		%>
			var userID = document.loginform.userID.value;
			if(!userID){
	        	alert ("아이디를 입력하세요");
	        	document.loginform.userID.focus();
	            return false;
	        }
		<%
				
			}
		%>
        
		var username = document.loginform.userName.value;
        var userEmail = document.loginform.userEmail.value;

        if(!username){
        	alert ("이름을 입력하세요");
        	document.loginform.userName.focus();
            return false;
        }
        else if(!userEmail){
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