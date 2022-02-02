<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!--헤더 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!--헤더 -->
<!-- 게시판 본문 -->
<div class="container mt-3">
	<table class="table table-stripe" >
		 <tr>
		 	<th>글번호</th><th>글쓴이</th><th>제목</th><th>조회수</th><th>등록일</th>
		 </tr>
		 <tr> 
		 	<td></td>
	
		 </tr> 
	</table>
	<!--페이징  -->
	<nav aria-label="Page navigation example" >
	  <ul class="pagination justify-content-center" >
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
<!-- footer -->
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>