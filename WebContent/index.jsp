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
<a class="navbar-brand" href="welcome.jsp">주차장Mark.3</a>
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
 <input class="form-control mr-sm-2" type="Search" placeholder="추후업데이트" aria-label="Search">
 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
</formm>
</div>
</nav>

<style type = "text/css">
  .jumbotron {
   
   background-image: url('images/parking.jpg');
   background-repeat : no-repeat;
   background-size: 100% 100%;
   

   text-shadow: black 0.2em 0.2em 0.2em;
   color : white;
 }
</style>
 <div class = "text-center jumbotron" >
 <p class="">입차 -> 출차 -> 계산 이순서대로 해주셔야됩니다.</p>
  <p class="">00x0000 <- 이 양식을 지켜서 입차및 출차 부탁드립니다.</p>
 <form action="./userJoinAction.jsp" method="post">
입차할 차량번호를 입력해주세요. <input type = "text" name="car_num" pattern="(\d{2})([가-힣])(\d{4})">
 <input class="btn btn-outline-primary my-2 my-sm-1" type="submit" value="차량번호등록">
 </form>
 
  <form action="./payment.jsp" method="post">
계산할 차량번호를 입력해주세요. <input type = "text" name="car_num" pattern="(\d{2})([가-힣])(\d{4})">
 <input type="submit" class="btn btn-outline-warning my-2 my-sm-1" value="차량번호등록">
 </form>
 
 
  <form action="./userOutAction.jsp" method="post">
출차할 차량번호를 입력해주세요. <input type = "text" name="car_num" pattern="(\d{2})([가-힣])(\d{4})">
 <input type="submit" class="btn btn-outline-danger my-2 my-sm-1" value="차량번호등록">
 </form>
 </div>

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