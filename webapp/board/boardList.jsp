<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardList.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!--헤더 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!--헤더 -->
<!-- 게시판 본문 -->
<%
String pageNum=request.getParameter("pageNum"); 
if(pageNum==null){
	pageNum="1";
}
//현재페이지
int currentPage=Integer.parseInt(pageNum);
//한 페이지당 Row수
int pageSize=10;
int startRow=(currentPage-1)*pageSize+1;

BoardDAO bDAO=new BoardDAO();
List<BoardDTO> boardList=bDAO.getBoardList(startRow, pageSize);
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
//페이지이동버튼 수
int pageBlock=5;
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;
//전체 글수
int boardCount=bDAO.getBoardCount();
//전체 페이지수
int pageCount=boardCount/pageSize+(boardCount % pageSize == 0? 0:1);
%>
<div class="container mt-3">
	<table class="table table-hover" >
		 <tr>
		 	<th>글번호</th><th>글쓴이</th><th>제목</th><th>조회수</th><th>등록일</th>
		 </tr>
<%
		for(BoardDTO b : boardList){
%>
		 <tr onclick="location.href='../board/boardContent.jsp?num=<%=b.getNum() %>'"> 
		 	<td><%=b.getNum() %></td>
		 	<td><%=b.getNick() %></td>
		 	<td><%=b.getSubject() %></td>
		 	<td><%=b.getReadcount() %></td>
		 	<td><%=dateFormat.format(b.getDate()) %></td>
		 </tr> 
<% 		}%>	
 		 <tr> 
		 	<td colspan="6">
		 		<input type="button" value="문의작성" onclick="location.href='writeBoardForm.jsp'">
		 	</td>
		 </tr>	 
	</table>
</div>	
<!-- 페이지 이동버튼 -->
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
		      <a class="page-link" href="boardList.jsp?pageNum=<%=startPage-1 %>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
<% 		}
		
		for(int i=startPage; i<=endPage; i++){
%>			
	    <li class="page-item"><a class="page-link" href="boardList.jsp?pageNum=<%=i %>"><%=i %></a></li>
<%		}
		
		if(endPage < pageCount){
%>
			<li class="page-item">
		      <a class="page-link" href="boardList.jsp?pageNum=<%=endPage+1 %>" aria-label="Next">
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