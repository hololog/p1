<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/updateReviewPro.jsp</title>
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

ReviewDTO rDTO=new ReviewDTO();
rDTO.setNum(num);
rDTO.setSubject(subject);
rDTO.setContent(content);
rDTO.setFile(file);

ReviewDAO rDAO=new ReviewDAO();
rDAO.updateReview(rDTO);

String nextJsp="reviewContent.jsp?num="+rDTO.getNum();
response.sendRedirect(nextJsp);
%>
</body>
</html>