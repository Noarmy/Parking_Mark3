<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="e_sale.E_saleDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>


  <%
  
   E_saleDAO e_saleDAO = new E_saleDAO();
   String e_car_num = null;
   
   if(session.getAttribute("e_car_num") != null){
	   e_car_num = (String) session.getAttribute("e_car_num");
   }
   
   if(e_car_num == null) {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('전기차 이용객이시면 입차를해주세요');");
	   script.println("location.href = 'e_saleLogin.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
	   }

 
   boolean e_mailcheck = e_saleDAO.getE_mailcheck(e_car_num);
   if(e_mailcheck == true) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('이미 인증된 전기차입니다.');");
	   script.println("location.href = 'index.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
	   
   } 
   
   String host = "http://localhost:8080/ParkingMarkThree/";
   String from = "noarmy12@gmail.com";
   String to = e_saleDAO.getE_mail(e_car_num);
   String subject = "전기차 등록을 위한 이메일 인증 메일입니다";
   String content = "다음 링크에 접속하셔서 이메일 인증을 진행해주세요 전기차가 아닌데 전기차로 등록하시면 법적인 처벌을 가하겠습니다" +
   "<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
   
   Properties p = new Properties();
   p.put("mail.smtp.user", from);
   p.put("mail.smtp.host", "smtp.googlemail.com");
   p.put("mail.smtp.port", "465");
   p.put("mail.smtp.starttls.enable", "true");
   p.put("mail.smtp.auth", "true");
   p.put("mail.smtp.debug", "true");
   p.put("mail.smtp.socketFactory.port", "465");
   p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
   p.put("mail.smtp.socketFactory.fallback", "false");

   try {
	   Authenticator auth = new Gmail();
	   Session ses = Session.getInstance(p, auth);
	   ses.setDebug(true);
	   MimeMessage msg = new MimeMessage(ses);
	   msg.setSubject(subject);
	   Address fromAddr = new InternetAddress(from);
	   msg.setFrom(fromAddr);
	   Address toAddr = new InternetAddress(to);
	   msg.addRecipient(Message.RecipientType.TO, toAddr);
	   msg.setContent(content, "text/html;charset=UTF-8");
	   Transport.send(msg);
	   
	   
   } catch (Exception e) {
	   e.printStackTrace();
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('오류입니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
   }
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PARK_Mark_Three</title>
<!-- 부트스트랩 css추가 -->
<link rel = "stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가 -->
<link rel = "stylesheet" href="./css/custom.css">
   
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a class="navbar-brand" href="index.jsp">주차장Mark.3</a>
<button class ="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
<span class="navbar-toggler-icon"></span>
</button>
<div id="navbar" class="collapse navbar-collapse">
<ul class="navbar-nav mr-auto">
<li class=nav-item active">
<a class = "nav-link" href="index.jsp">메인</a>
</li>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
전기차 등록관리
</a>
<div class="dropdown-menu" aria-labelledby="dropdown">
<a class = "dropdown-item" href="e_saleLogin.jsp">전기차회원입차</a>
<a class = "dropdown-item" href="e_saleJoin.jsp"> 전기차회원등록</a>
<a class = "dropdown-item" href="e_saleLogout.jsp"> 전기차회원출차</a>
</div>
</li>
</ul>
<formm class="form-inline my-2 my-lg-0">
 <input class="form-control mr-sm-2" type="Search" placeholder="입력하지마세요" aria-label="Search">
 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
</formm>
</div>
</nav>
<section class="container mt-3" style="max-width: 540px;">
  <div class = "alert alert-success mt-4" role="alert">
  이메일 주소 인증메일이 전송되었습니다. 전기차가입시 입력했던 이메일에 들어가서 인증해주세요.
  </div>
</section>
 
 

 <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
 Copyright &copy; 2020 HyunJong Lee All Rights Reserved.
 </footer>
 
 <!-- 제이쿼리 자바스크립트 추가하기 -->
 <script src="./js/jquery.min.js"></script>
 <!-- 파퍼 자바스크립트 추가하기 -->
 <script src="./js/pooper.js"></script>
 <!-- 부트스트랩 자바스크립트 추가하기 -->
 <script src="./js/bootstrap.min.js"></script>
 
</body>
</html>