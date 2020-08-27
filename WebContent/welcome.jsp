<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale="1">
<title>welcome to the 주차장</title>
<!-- 부트스트랩 css추가 -->
<link rel = "stylesheet" href="css/bootstrap.min.css">
<!-- 커스텀 css 추가 -->
<link rel = "stylesheet" href="css/custom.css">

</head>
<body>

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

</ul>
<formm class="form-inline my-2 my-lg-0">
 <input class="form-control mr-sm-2" type="Search" placeholder="입차후 출차를 하고 계산합시다" aria-label="Search">
 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
</formm>
</div>
</nav>


<style type = "text/css">
  .jumbotron {
   
   background-image: url('images/welcome.jpg');
   background-repeat : no-repeat;
   background-size: 100% 100%;
   

   text-shadow: black 0.2em 0.2em 0.2em;
   color : white;
 }
</style>


<div class = "container">
 <div class = "jumbotron">
  <h1 class = "text-center"> Welcome to the <p class = "font-weight-bold text-success">"친환경주차장"</p></h1>
   <p class = "text-center">이 주차장 시스템은 획기적인 시스템으로써, 다양한 기능이 존재한다고 믿어의심하고있습니다.</p>
   <p class = "text-center">환경을 위해 정부의 돈을 지원받아 전기차를 타고다니시는 분들을 위해,가입만하면 무료로 사용이가능합니다. </p>
   <p class = "text-center">환경을 생각않는 전기차외 일반자동차는 이용료 분당 100원씩 받겠습니다. 동의하신다면 들어와주세요</p>
   <p class = "text-center"><a class="btn btn-primary btn-lg" href="index.jsp" role="button">주차장들어가기</a></p>
 </div>
</div>
</body>
 <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
 Copyright &copy; 2020 HyunJong Lee All Rights Reserved.
 </footer>
</html>