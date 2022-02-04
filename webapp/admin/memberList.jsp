<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/memberList.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<%
String id=(String)session.getAttribute("sessionID");
//admin만 해당화면 보이기
if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
} else if(!(id.equals("admin"))){
	response.sendRedirect("../main/main.jsp");
}
%>
<div class="container mt-5 table-responsive">
<table class="table table-striped table-hover">
	<thead class="table-dark">
		<tr>
			<th scope="col">#</th>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">별명</th>
			<th scope="col">이메일</th>
			<th scope="col">주소</th>
			<th scope="col">가입일</th>
		</tr>
	</thead>	
<%
// 페이징
String pageNum=request.getParameter("pageNum");
if(pageNum==null)
	pageNum="1";
int currentPage=Integer.parseInt(pageNum);
int pageSize=2; 
int startRow=(currentPage-1)*pageSize+1;
int endRow=startRow+pageSize-1;
//페이지 이동 버트
MemberDAO mDAO=new MemberDAO();
int pageBlock=10;
int count=mDAO.getMemberCount();
int pageCount=count/pageSize + (count%pageSize==0? 0:1);
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;
//DB서 리스트 가져오기
List<MemberDTO> list=mDAO.getUserList(startRow, pageSize);
int num = 0;

	for(MemberDTO mDTO : list){
		num++;
%>	
	<tbody>	
		<tr>
			<th scope="row"><%=num %></th>
			<td><a href="../member/memberInfo.jsp?id=<%=mDTO.getId() %>"><%=mDTO.getId() %></a></td>
			<td><%=mDTO.getName() %></td>
			<td><%=mDTO.getNick() %></td>
			<td><%=mDTO.getEmail() %></td>
			<td><%=mDTO.getAddress() %></td>
			<td><%=mDTO.getJoinDate() %></td>
		</tr>
	</tbody>		
<%	}%>
</table>
<!-- 페이지 이동버튼 -->
<div>
	<nav aria-label="Page navigation" >
	  <ul class="pagination justify-content-center" >

<%	if(endPage > pageCount)
		endPage=pageCount;

	if(startPage > pageBlock){%>
		<li class="page-item">
	      <a class="page-link" href="reviewList.jsp?pageNum=<%=startPage-1 %>" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
<%	}
////////////////////////////////////////////////////////////////////////////	
%>

	    <li class="page-item"><a class="page-link" href="reviewList.jsp?pageNum="></a></li>

		
<%	if(endPage < pageCount){%>
		<li class="page-item">
	      <a class="page-link" href="reviewList.jsp?pageNum=<%=endPage+1 %>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
<%	}%>
	  </ul>
	</nav>
</div>
<!-- 페이지 이동버튼 -->
</div>
<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>