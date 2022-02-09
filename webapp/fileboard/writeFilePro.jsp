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
<title>file/wirteFilePro.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("sessionID");
String nick=(String)session.getAttribute("nick");

if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
}

String uploadPath=request.getSession().getServletContext().getRealPath("/upload");
int size=10*1024*1024;

MultipartRequest multi=new MultipartRequest
			(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
int readcount=0;

FileDAO fDAO=new FileDAO();
FileDTO fDTO=new FileDTO();

fDTO.setNum(fDAO.getNextNum());
fDTO.setNick(nick);
fDTO.setSubject(subject);
fDTO.setContent(content);
fDTO.setReadcount(readcount);
fDTO.setFile(file);

// // 글등록 샘플용
// for(int i=0; i<98;i++){
// 	fDTO.setNum(fDAO.getNextNum());
// 	fDTO.setNick(nick);
// 	fDTO.setSubject(subject);
// 	fDTO.setContent(content);
// 	fDTO.setReadcount(readcount);
// 	fDTO.setFile(file);
// 	fDAO.insertFile(fDTO);
// } 

fDAO.insertFile(fDTO);
response.sendRedirect("fileList.jsp");
%>
</body>
</html>