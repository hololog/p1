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
<!-- header-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header-->
<%
int num=Integer.parseInt(request.getParameter("num"));
ReviewDAO rDAO=new ReviewDAO();
rDAO.updateReadCount(num);
ReviewDTO rDTO=rDAO.getContent(num);
%>
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
//본인이 작성한 글에만 수정하기버튼 보이기
String id=(String)session.getAttribute("sessionID");
MemberDAO mDAO=new MemberDAO();
String userNick=mDAO.getUserInfo(id).getNick();
String reviewNick=rDTO.getNick();
if(id!=null){
	if(userNick.equals(reviewNick)){
%>				 	
				 	<input type="button" value="수정" onclick="location.href='updateReviewForm.jsp?num=<%=num %>'" >
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