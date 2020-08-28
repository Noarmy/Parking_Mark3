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
 <%request.setCharacterEncoding("UTF-8"); %>
입차되어있지 않은 차량입니다.
 <%=request.getParameter("car_num") %>
  


 
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
System.out.println(car_num);
 parkDAO parkDAO = new parkDAO();
int result = parkDAO.check(car_num);

if(result == 1) {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('입차되어있거나 출차가되지않았습니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
}



int result1 = parkDAO.join(car_num,0);


if(result1 == 1) {
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('원하는곳에 주차를하세요');");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}




%>
 
</body>
</html>