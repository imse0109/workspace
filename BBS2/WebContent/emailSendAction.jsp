<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		UserDAO userDAO = new UserDAO();
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		System.out.println(session.getAttribute("userID"));
		System.out.println(userID);
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");			
		}
		boolean emailChecked = userDAO.getUserEmailChecked(userID);
		if(emailChecked == true){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 인증 된 회원입니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		
		
		String host = "http://localhost:8080/BBS2/";
		String from = "kisslsch@gmail.com";
		System.out.println("test");
		System.out.println(userDAO.getUserEmail(userID));
		System.out.println("test");
		String to = "imse0109@naver.com";
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + 
			"<a href='" + host + "emailCheckAction.jsp?code" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>" ;
			
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		//p.put("mail.smtp.EnableSSL.enable","true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		
		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address formAddr = new InternetAddress(from);
			msg.setFrom(formAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
		} catch(Exception e){
			System.out.println("#####");
			e.printStackTrace();
			System.out.println("#####");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back();");
			script.println("</script>");			
		}
		
	%>
	
</body>
</html>