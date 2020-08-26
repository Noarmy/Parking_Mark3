<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="e_sale.E_saleDTO"%>
<%@ page import="e_sale.E_saleDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>


  <%

   request.setCharacterEncoding("UTF-8");
   String e_car_num = null;
   String name = null;
   
   if(request.getParameter("e_car_num") != null ) {
	   e_car_num = request.getParameter("e_car_num");
   }
   
   if(request.getParameter("name") != null ) {
	   name = request.getParameter("name");
   }

   if(e_car_num == null || name == null) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('입력이 무언가 되지않았습니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
   }
   
   E_saleDAO e_saleDAO = new E_saleDAO();
   int result = e_saleDAO.login(e_car_num, name);
   if(result == 1) {
	   session.setAttribute("e_car_num", e_car_num);
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("location.href ='index.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
	   
   } else if (result == 0){
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('성함이 맞지않습니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
	   
   } else if (result == -1){
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('전기차로 등록되어있지 않습니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
	   
   } else if (result == -2){
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('데이터베이스의 오류입니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
   }
   %>