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
	<header>
		<h1>게시판</h1>
	</header>
	
	<div class="container">
		<div class="bbs">
			<form method="post" action="bbsWriteAction.jsp">
				<table>
					<tr>
						<th colspan="2">게시판 글쓰기 양식</th>
					</tr>
					<tr>
						<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048"></textarea></td>
					</tr>
				</table>
				<div class="bbs_btn">
					<input type="submit" class="btn_write" value="글쓰기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>