<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="park.parkDTO"%>
<%@ page import="park.parkDAO"%>
<%@ page import="java.io.PrintWriter"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PARK_Mark_Three</title>
<!-- 부트스트랩 css추가 -->
<link rel = "stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가 -->
<link rel = "stylesheet" href="./css/custom.css">
</head>
<body>
 <% String e_car_num = null;
   if(session.getAttribute("e_car_num") != null) {
	   e_car_num = (String) session.getAttribute("e_car_num");
   }
%>
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
 <%
  if(e_car_num == null) {
%> 
<a class = "dropdown-item" href="e_saleLogin.jsp">전기차회원입차</a>
<a class = "dropdown-item" href="e_saleJoin.jsp"> 전기차회원등록</a>
<%
  } else {
%> 
<a class = "dropdown-item" href="e_saleLogout.jsp"> 전기차회원출차</a>

 <%
  }
%>
</div>
</li>
</ul>
<formm class="form-inline my-2 my-lg-0">
 <input class="form-control mr-sm-2" type="Search" placeholder="입차후 출차를 하고 계산합시다" aria-label="Search">
 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
</formm>
</div>
</nav>

<% 
String car_num = request.getParameter("car_num");
parkDAO parkDAO = new parkDAO();
String result = request.getParameter("resu");
String cash = request.getParameter("cash");
parkDAO.outstring(car_num);

int resu = Integer.parseInt(result);
int cash1 = Integer.parseInt(cash);

int nokori = resu-cash1;

%>
  <div class="text-center">
  <p class ="font-weight-bold">친환경 주차장을 이용해주셔서 감사합니다.</p>
  <p class ="font-weight-bold text-primary">거스름돈은 <%=-nokori%>원 입니다.</p>
	

 <form action="index.jsp">
 <input type="submit" class="btn btn-outline-warning my-2 my-sm-1" value="주차장으로 돌아가기">
 </form>
	</div>
 
</body>
<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
 Copyright &copy; 2020 HyunJong Lee All Rights Reserved.
 </footer>
</html>