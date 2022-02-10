<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="member.MemberDAO"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/wirteReviewRro.jsp</title>
</head>
<body>
<%
//세션확인
String id=(String)session.getAttribute("sessionID");
String nick=(String)session.getAttribute("nick");

if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
}
//deprecated
// String uploadPath=request.getRealPath("/upload");
String uploadPath=request.getSession().getServletContext().getRealPath("/upload");

int size=10*1024*1024;

MultipartRequest multi=new MultipartRequest
			(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
int readcount=0;
//닉네임 가져오기
// MemberDAO mDAO=new MemberDAO();
// String nick=mDAO.getUserInfo(id).getNick();
//게시물번호
ReviewDAO rDAO=new ReviewDAO();
ReviewDTO rDTO=new ReviewDTO();

rDTO.setNum(rDAO.getNextNum());
rDTO.setNick(nick);
rDTO.setSubject(subject);
rDTO.setContent(content);
rDTO.setReadcount(readcount);
rDTO.setFile(file);

// // 글등록 샘플용
// for(int i=0; i<50;i++){
// 	rDTO.setNum(rDAO.getNextNum());
// 	rDTO.setNick(nick);
// 	rDTO.setSubject(subject);
// 	rDTO.setContent(content);
// 	rDTO.setReadcount(readcount);
// 	rDTO.setFile(file);
// 	rDAO.insertReview(rDTO);
// } 

//글등록메서드
rDAO.insertReview(rDTO);
response.sendRedirect("reviewList.jsp");
%>
</body>
</html>