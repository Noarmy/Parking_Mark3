<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="park.parkDTO"%>
<%@ page import="park.parkDAO"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>card</title>
</head>
<body>

<% 
		String car_num = request.getParameter("car_num");
		System.out.println(car_num);
      parkDAO parkDAO = new parkDAO();
     
       parkDAO.outstring(car_num);
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('결제가 완료되었습니다 안녕히 가십시요');");
	   script.println("location.href = 'welcome.jsp'");
	   script.println("</script>");
	   script.close();
	  
	
%>

</body>
</html>
