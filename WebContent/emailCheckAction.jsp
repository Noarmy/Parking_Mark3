<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="e_sale.E_saleDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>


  <%

   request.setCharacterEncoding("UTF-8");
   String code = null;
   
   if(request.getParameter("code") != null ) {
	   code = request.getParameter("code");
   }
   
   
   
   E_saleDAO e_saleDAO = new E_saleDAO();
   String e_car_num = null;
   
   if(session.getAttribute("e_car_num") != null ) {
	   e_car_num = (String) session.getAttribute("e_car_num");
   }
   
    if(e_car_num == null) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('전기차인증을 해주세요');");
	   script.println("location.href = 'e_saleLogin.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
   }
    
    String e_mail = e_saleDAO.getE_mail(e_car_num);
    boolean isRight = (new SHA256().getSHA256(e_mail).equals(code)) ? true : false;
   
    if(isRight == true) {
    	   e_saleDAO.setE_mailcheck(e_car_num);
    	   PrintWriter script = response.getWriter();
    	   script.println("<script>");
    	   script.println("alert('전기차 인증에 성공하셨습니다.');");
    	   script.println("location.href = 'index.jsp'");
    	   script.println("</script>");
    	   script.close();
    	   return;
    	   }
       
       else {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('유효하지않은 코드입니다');");
	   script.println("location.href = 'index.jsp'");
	   script.println("</script>");
	   script.close();
	   return;
   }
   %>