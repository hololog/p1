<%@page import="member.MemberDAO"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
	<jsp:useBean id="bean" class="member.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="bean"/>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>member/joinPro.jsp</title> -->
<!-- </head> -->
<!-- <body> -->
<%
	MemberDAO mDAO=new MemberDAO();
	mDAO.insertMember(bean);
	
	response.sendRedirect("loginForm.jsp");
%>
<!-- </body> -->
<!-- </html> -->