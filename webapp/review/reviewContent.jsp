<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/reviewContent.jsp</title>
<!-- bootstrap css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));
ReviewDAO rDAO=new ReviewDAO();
rDAO.updateReadCount(num);
ReviewDTO rDTO=rDAO.getContent(num);
%>
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<!-- main contents -->
<div class="container mt-3">
	<div>
		<table class="table ">
			<thead>
				<tr>
				 <th><%=rDTO.getSubject() %></th><td><%=rDTO.getReviewDate() %></td>
				</tr>
				<tr>
				 <td><%=rDTO.getNick() %></td><td><%=rDTO.getReadcount() %></td>
				</tr>
			</thead>
			<tbody>
				<tr>
				 <td colspan="2">
					 <img src="../upload/<%=rDTO.getFile() %>"><br>
					 <%=rDTO.getContent() %></td>
				</tr>
				<tr>
				 <td colspan="2">
				 	<input type="button" value="목록" onclick="location.href='reviewList.jsp'" >
<%
String id=(String)session.getAttribute("sessionID");
MemberDAO mDAO=new MemberDAO();
if(id!=null){
	MemberDTO mDTO=mDAO.getUserInfo(id);
 	if(id.equals(mDTO.getId())){
%>				 	
				 	<input type="button" value="수정" onclick="location.href='updateReviewForm.jsp'" >
<%
 	}
}
%>				 	
				 </td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>