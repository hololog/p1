<%@page import="file.FileDTO"%>
<%@page import="file.FileDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileboard/fileList.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!--헤더 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!--헤더 -->
<%
String pageNum=request.getParameter("pageNum");

if(pageNum==null){
	pageNum="1";
}

int pageSize=10;
int currentPage=Integer.parseInt(pageNum);
int startRow=pageSize*(currentPage-1)+1;

FileDAO fDAO=new FileDAO();
List<FileDTO> list=fDAO.getFileList(pageSize, startRow);

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>
<!-- 게시판 본문 -->
<div class="container mt-3">
	<table class="table table-hover" >
		 <tr>
		 	<th>#</th><th>제목</th><th>글쓴이</th><th>파일</th><th>조회수</th><th>등록일</th>
		 </tr>
<%
		for(FileDTO r :list){
%>		 
		 <tr onclick="location.href='fileContent.jsp?num=<%=r.getNum() %>'"> 
		 	<td><%=r.getNum() %></td>
		 	<td><%=r.getSubject() %></td>
		 	<td><%=r.getNick() %></td>
		 	<td><a href="../upload/<%=r.getFile() %>" download><%=r.getFile() %></a></td>
		 	<td><%=r.getReadcount() %></td>
		 	<td><%=dateFormat.format(r.getDate())  %></td>
		 </tr>
<%		}%>
		 <tr> 
		 	<td colspan="6">
		 		<input type="button" value="새글작성" onclick="location.href='writeFileForm.jsp'">
		 	</td>
		 </tr>
	</table>
</div>
<!-- 게시판 본문 -->
<!-- 페이징 -->
<%
int pageBlock=5;
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;
int count=fDAO.getFileCount();
int pageCount=count/pageSize + (count % pageSize == 0? 0:1);
%>	 
<!-- pagination -->
<div>
	<nav aria-label="Page navigation" >
	  <ul class="pagination justify-content-center" >
<%
		if(endPage>pageCount){
			endPage=pageCount;
		}		
		if(startPage > pageBlock){
%>			
			<li class="page-item">
		      <a class="page-link" href="fileList.jsp?pageNum=<%=startPage-1 %>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
<% 		}
		
		for(int i=startPage; i<=endPage; i++){
%>			
	    <li class="page-item"><a class="page-link" href="fileList.jsp?pageNum=<%=i %>"><%=i %></a></li>
<%		}
		
		if(endPage < pageCount){
%>
			<li class="page-item">
		      <a class="page-link" href="fileList.jsp?pageNum=<%=endPage+1 %>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
<%		}	
%>	   
	  </ul>
	</nav>
</div>
<!-- 페이지 이동버튼 -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>