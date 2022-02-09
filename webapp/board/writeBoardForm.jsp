<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writeBoardForm.jsp</title>
<!-- bootstratp css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header -->
<%
String nick=(String)session.getAttribute("nick");
if(nick==null){
	response.sendRedirect("../member/loginForm.jsp");
}
%>
<!-- main -->
	<div class="container mt-5">
		<h2>QnA</h2>
		<form action="writeBoardPro.jsp" method="post">
			<input type="hidden" name="nick" value=<%=nick %>>
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" placeholder="제목" required></td>
				</tr>
				
				<tr>
					<td><textarea name="content" class="form-control" rows="20" placeholder="문의할 내용을 적어주세요"></textarea></td>
				</tr>
				<tr>
				<td>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="open" id="inlineRadio1" value="public">
					  <label class="form-check-label" for="inlineRadio1">공개</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="open" id="inlineRadio2" value="private" checked="checked">
					  <label class="form-check-label" for="inlineRadio2">비공개</label>
					</div>
				</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="돌아가기" class="btn btn-primary" onclick="histoy.back()">
						<input type="submit" value="글쓰기" class="btn btn-primary">
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