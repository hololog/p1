<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file/writeFileForm.jsp</title>
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
%>
<!-- main -->
	<div class="container mt-5">
		<h2>file 업로드작성</h2>
		<form action="writeFilePro.jsp" method="post" enctype="Multipart/form-data">
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" placeholder="제목" required></td>
				</tr>
				
				<tr>
					<td><textarea name="content" class="form-control" rows="20" placeholder="여기에 내용을 적어주세요" required></textarea></td>
				</tr>
				<tr>
					<td>
                      <label for="inputFile">첨부파일</label>
                      <input type="file" name="file" id="inputFile" class="form-control">
                    </td>
				</tr>
				<tr>
					<td>
						<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='fileList.jsp'">
						<input type="submit" value="작성" class="btn btn-primary">
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