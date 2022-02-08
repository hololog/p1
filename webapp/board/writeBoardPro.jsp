<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writeBoardPro.jsp</title>
</head>
<body>
<%
BoardDAO bDAO=new BoardDAO();
//게시물번호 업데이트
// bean.setNum(bDAO.getNextNum());
//조회수 0
bean.setReadcount(0);
//샘플
for(int i=0;i<80;i++){
	bean.setNum(bDAO.getNextNum());
	bean.setSubject("문의글"+i);
	bean.setContent("문의글"+i);
	bDAO.insertBoard(bean);
}

// bDAO.insertBoard(bean);
response.sendRedirect("boardList.jsp");//목록으로
%>
</body>
</html>
