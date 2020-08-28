<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="park.parkDTO"%>
<%@ page import="park.parkDAO"%>
<%@ page import="java.io.PrintWriter"%>

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
 <%request.setCharacterEncoding("UTF-8"); %>
 <style type = "text/css">
  .jumbotron {
   
   background-image: url('images/false.jpg');
   background-repeat : no-repeat;
   background-size: 40% 100%;
   background-position : center;

   text-shadow: blue 0.2em 0.2em 0.2em;
   color : #ffde05;
 }
</style>
 <div class = "text-center jumbotron font-weight-bold" >
입차되어있지 않은 차량입니다.
<form action="index.jsp">
 <input type="submit" class="btn btn-outline-primary my-2 my-sm-1" value="주차장으로 돌아가기">
 </form>
	</div>

 
 <%
String car_num = null;

if(request.getParameter("car_num") != null) {
	car_num = (String) request.getParameter("car_num");
}

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
int result = parkDAO.out(car_num);
int check = parkDAO.outcheck(car_num);

if(check == 1) {
	parkDAO.outcheck(car_num);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 출차된차량입니다.');");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
	
}else
if(result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('계산을 해주세요.');");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}

if(result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입차가 되지않은 차량입니다');");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}





%>
 
</body>
</html>