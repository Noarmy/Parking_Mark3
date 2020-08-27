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
request.setCharacterEncoding("UTF-8");
String car_num = request.getParameter("car_num");


if(car_num == "") {
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력을 똑바로해주세요');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}


parkDAO parkDAO = new parkDAO();
int resu = parkDAO.park(car_num);




if(resu == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입차가 되지 않았거나 출차가 되지않았습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close(); 
}

	
if(resu == 0){
		parkDAO.outstring(car_num);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('결제하실 필요가없습니다 안녕히가십시요');");
		script.println("location.href = 'welcome.jsp'");
		script.println("</script>");
		script.close(); 
	}


%>
  <div class= text-center>
  <p class = "font-weight-bold ">주차장을 이용하신 금액은 <p class = "font-weight-bold text-primary"> <%=resu%>원</p> 요금은 분당 백원으로 계산됩니다.</p>
	
<form action = "gesangi.jsp">
계산할 금액을 입력하세요 <input type = "text" name="cash">
<div class = text-center>
 <input type="submit" class="btn btn-outline-success my-2 my-sm-1" value="현찰로내기">
  <input type="hidden" class="btn btn-outline-warning my-2 my-sm-1" name = "resu" value="<%=resu%>">
  <input type="hidden" class="btn btn-outline-warning my-2 my-sm-1" name = "car_num" value="<%=car_num%>">
  </div>
 </form>
 
  <form action="card.jsp">
 <input type="submit" class="btn btn-outline-warning my-2 my-sm-1" value="카드결제">
 <input type="hidden" class="btn btn-outline-warning my-2 my-sm-1" name = "car_num" value="<%=car_num%>">
 </form>
	</div>
 
</body>
<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
 Copyright &copy; 2020 HyunJong Lee All Rights Reserved.
 </footer>
</html>