<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<li class=nav-item">
<a class = "nav-link" href="index.jsp">메인</a>
</li>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
전기차 등록관리
</a>
<div class="dropdown-menu" aria-labelledby="dropdown">
<a class = "dropdown-item" href="e_saleLogin.jsp">전기차회원입차</a>
<a class = "dropdown-item active" href="e_saleJoin.jsp"> 전기차회원등록</a>
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
 <form method="post" action="./e_saleLoginAction.jsp">
  <div class="form-group">
  <lable>전기차번호입력</lable>
  <input type="text" name="e_car_num" class="form-control">
  </div>
  <div class="form-group">
  <label>성함입력</label>
  <input type="text" name="name" class="form-control">
  </div>
 <button type="submit" class="btn btn-primary">전기차입차</button>
 </form>
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