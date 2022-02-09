<%@page import="file.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileboard/deleteFilePro.jsp</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));

FileDAO rDAO=new FileDAO();
rDAO.deleteFile(num);
response.sendRedirect("fileList.jsp");
%>
</body>
</html>