<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/deleteReviewPro.jsp</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));

ReviewDAO rDAO=new ReviewDAO();
rDAO.deleteReview(num);
response.sendRedirect("reviewList.jsp");
%>
</body>
</html>