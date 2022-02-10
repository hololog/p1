<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/reviewList.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!--헤더 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!--헤더 -->
<%
ReviewDAO rDAO=new ReviewDAO();
//한 페이지당 게시물 수
int pageSize=8;
//총 페이지수
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
//현재 화면에 보여지는 페이지
int currentPage=Integer.parseInt(pageNum);
//해당 페이지의 게시물의 시작열
int startRow=pageSize*(currentPage-1)+1;
List<ReviewDTO> list=rDAO.getReviewList(pageSize, startRow);

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
SimpleDateFormat todayFormat=new SimpleDateFormat("HH:mm:ss");
Date nowTime = new Date();
%>
<!-- 게시판 본문 -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
	<div class="w3-row-padding w3-padding-16 w3-center">
<%
		for(int i=0; i<list.size(); i++){
			ReviewDTO bDTO=list.get(i);
%>	
	    <div class="w3-quarter">
	      <img src="../upload/<%=bDTO.getFile() %>" alt="<%=bDTO.getFile() %>" style="width:100%">
	      <h3><a href="reviewContent.jsp?num=<%=bDTO.getNum() %>"><%=bDTO.getSubject() %></a></h3>
	      <p><%=bDTO.getNick() %> <%=bDTO.getReadcount() %><br>
		 	 <%=dateFormat.format(bDTO.getReviewDate()) %></p>
	    </div>
<% 
			if((i+1)%4==0){
				%></div><div class="w3-row-padding w3-padding-16 w3-center"><%
			}
		}
%>	    
	    <div>
	    	<hr>
	 		<input type="button" value="리뷰작성" onclick="location.href='writeReviewForm.jsp'">
	    </div>
	</div>
</div>
<!-- 게시판 본문 -->
<%
int pageBlock=5;
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;
//전체 글갯수
int reviewCount=rDAO.getReviewCount();
//전체 페이지수
int pageCount=reviewCount/pageSize + (reviewCount % pageSize == 0? 0:1);
%>	 
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
		      <a class="page-link" href="reviewList.jsp?pageNum=<%=startPage-1 %>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
<% 		}
		
		for(int i=startPage; i<=endPage; i++){
%>			
	    <li class="page-item"><a class="page-link" href="reviewList.jsp?pageNum=<%=i %>"><%=i %></a></li>
<%		}
		
		if(endPage < pageCount){
%>
			<li class="page-item">
		      <a class="page-link" href="reviewList.jsp?pageNum=<%=endPage+1 %>" aria-label="Next">
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