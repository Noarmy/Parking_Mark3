<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="e_sale.E_saleDTO"%>
<%@ page import="e_sale.E_saleDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>


  <%

   request.setCharacterEncoding("UTF-8");
   String e_car_num = null;
   String name = null;
   String e_mail = null;
   
   if(request.getParameter("e_car_num") != null ) {
	   e_car_num = request.getParameter("e_car_num");
   }
   
   if(request.getParameter("name") != null ) {
	   name = request.getParameter("name");
   }
   
   if(request.getParameter("e_mail") != null ) {
	   e_mail = request.getParameter("e_mail");
   }
   
   if(e_car_num == null || name == null || e_mail == null || e_car_num.equals("") || name.equals("")||e_mail.equals("")) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('입력이 무언가 되지않았습니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
   }
   
   E_saleDAO e_saleDAO = new E_saleDAO();
   int result = e_saleDAO.join(new E_saleDTO(e_car_num, name, e_mail,SHA256.getSHA256(e_mail),false));
   if(result == -1) {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('입차되어있거나 이미 등록된 차량번호입니다.');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
	   
   } else {
	   session.setAttribute("e_car_num", e_car_num);
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('등록이 완료되었습니다. 이메일인증을 해주세요');");
	   script.println("location.href = 'emailSendAction.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
   }
   %>