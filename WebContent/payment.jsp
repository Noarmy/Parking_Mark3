<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="park.parkDTO"%>
<%@ page import="park.parkDAO"%>
<%@ page import="java.io.PrintWriter"%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 


 
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
int result = parkDAO.park(car_num);





if(result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입차가 되지 않았거나 출차가 되지않았습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close(); 
}

	int resu = result;
%>

	
	
	금액은 <%=resu%>원 입니다. 요금은 분당 백원으로 계산됩니다.
	
 
</body>
</html>