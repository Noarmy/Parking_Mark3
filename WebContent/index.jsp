<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "e_sale.E_saleDAO" %>   

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
<section class="container">

<form method="get" action="./index.jsp" class="form-inline mt-3">
<select name="lectureDivide" class="form-control mx-2 mt-2">
<option value="전체">전기차외 차량 주차</option>
</select>
</form>
</section>
 
 
 <form action="./userJoinAction.jsp" method="post">
입차할 차량번호를 입력해주세요. <input type = "text" name="car_num">
 <input class="btn btn-outline-primary my-2 my-sm-1" type="submit" value="차량번호등록">
 </form>
 
  <form action="./payment.jsp" method="post">
계산할 차량번호를 입력해주세요. <input type = "text" name="car_num">
 <input type="submit" class="btn btn-outline-warning my-2 my-sm-1" value="차량번호등록">
 </form>
 
 
  <form action="./userOutAction.jsp" method="post">
출차할 차량번호를 입력해주세요. <input type = "text" name="car_num">
 <input type="submit" class="btn btn-outline-danger my-2 my-sm-1" value="차량번호등록">
 </form>
 

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