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

if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
} else if(!(id.equals("admin"))){
	response.sendRedirect("../main/main.jsp");
}

MemberDAO mDAO=new MemberDAO();
List<MemberDTO> list=mDAO.getUserList();
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
	for(MemberDTO mDTO : list){
		int num = 0;
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
</div>
<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>