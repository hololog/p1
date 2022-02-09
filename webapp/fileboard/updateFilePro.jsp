<%@page import="file.FileDAO"%>
<%@page import="file.FileDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileboard/updateFilePro.jsp</title>
</head>
<body>
<%
int size=10*1024*1024;
String uploadPath=request.getSession().getServletContext().getRealPath("/upload");

MultipartRequest multi=new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
int num=Integer.parseInt(multi.getParameter("num"));
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");

FileDTO fDTO=new FileDTO();
fDTO.setNum(num);
fDTO.setSubject(subject);
fDTO.setContent(content);
fDTO.setFile(file);

FileDAO fDAO=new FileDAO();
fDAO.updateFile(fDTO);

String nextJsp="fileContent.jsp?num="+fDTO.getNum();
response.sendRedirect(nextJsp);
%>
</body>
</html>