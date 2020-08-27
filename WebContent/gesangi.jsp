<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="park.parkDTO"%>
<%@ page import="park.parkDAO"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gesangi</title>
</head>
<body>

<% 
String car_num = request.getParameter("car_num");
String result = request.getParameter("resu");
String cash = request.getParameter("cash");

int resu = Integer.parseInt(result);
int cash1 = Integer.parseInt(cash);

if(resu > cash1) {
	
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('금액이 모자랍니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
	
}

//결제 완료
if(resu <= cash1) {
	
	parkDAO parkDAO = new parkDAO();
	
	
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('결제가 완료되었습니다');");
	   script.println("location.href = 'cash.jsp?resu="+resu+"&cash="+cash1+"&car_num="+car_num+"'");
	   script.println("</script>");
	   script.close();
	   return;
	
}





%>

</body>
</html>

