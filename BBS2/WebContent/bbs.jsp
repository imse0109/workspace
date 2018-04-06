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
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td>1</td>
					<td>테스트입니다.</td>
					<td>테스터</td>
					<td>2018-04-06</td>
				</tr>
			</table>
			<div class="bbs_btn">
				<a href="bbsWrite.jsp" class="btn_write">글쓰기</a>
			</div>
		</div>
	</div>
</body>
</html>