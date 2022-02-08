<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateBoardPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
BoardDAO bDAO=new BoardDAO();
bDAO.updateBoard(bean);

String nextJsp="boardContent.jsp?num="+bean.getNum();
response.sendRedirect(nextJsp);
%>
</body>
</html>