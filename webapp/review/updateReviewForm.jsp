<%@page import="member.MemberDAO"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/updateReviewForm.jsp</title>
<!-- bootstratp css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header -->
<%
String id=(String)session.getAttribute("sessionID");
if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
}
int num=Integer.parseInt(request.getParameter("num"));
ReviewDAO rDAO=new ReviewDAO();
ReviewDTO rDTO=rDAO.getContent(num);

MemberDAO mDAO=new MemberDAO();
String userNick=mDAO.getUserInfo(id).getNick();
String reviewNick=rDTO.getNick();

//멤버의 닉이랑 리뷰의 닉이 같을때만 수정화면보이기 
if(!(userNick.equals(reviewNick))){
%>	
	<script type="text/javascript">
		alert("본인의 게시물이 아닙니다.");
		location.href="../review/reviewList.jsp";
	</script>
<%
}
%>
<!-- main -->
	<div class="container mt-5">
		<h2>리뷰수정</h2>
		<form action="updateReviewPro.jsp" method="post" enctype="Multipart/form-data">
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" placeholder="리뷰할 메뉴" required></td>
				</tr>
				
				<tr>
					<td><textarea name="content" class="form-control" rows="20" placeholder="여기에 후기를 적어주세요" required></textarea></td>
				</tr>
				
				<tr>
					<td>
                      <label for="inputImage">첨부이미지</label>
                      <input type="file" name="file" id="inputImage" class="form-control">
                    </td>
				</tr>
				<tr>
					<td>
						<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='reviewList.jsp'">
						<input type="submit" value="리뷰작성" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</form>
	</div>
<!-- main -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>