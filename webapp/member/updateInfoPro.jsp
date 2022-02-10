<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateInfoPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>	
<jsp:useBean id="bean" class="member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
MemberDAO mDAO=new MemberDAO();
mDAO.updateInfo(bean);
//닉네임 세션값 변경
session.setAttribute("nick", bean.getNick());
response.sendRedirect("memberInfo.jsp");
%>
</body>
</html>