<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/deleteBoardPro.jsp</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));

BoardDAO bDAO=new BoardDAO();
bDAO.deleteBoard(num);
response.sendRedirect("boardList.jsp");
%>
</body>
</html>