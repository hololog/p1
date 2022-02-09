<%@page import="file.FileDTO"%>
<%@page import="file.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileboard/updateFileForm.jsp</title>
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
FileDAO fDAO=new FileDAO();
FileDTO fDTO=fDAO.getContent(num);

String nick=(String)session.getAttribute("nick");
if(!(nick.equals(fDTO.getNick()))){
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
		<h2>파일수정</h2>
		<form action="updateFilePro.jsp" method="post" enctype="Multipart/form-data">
			<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" value="<%=fDTO.getSubject() %>" required></td>
				</tr>
				<tr>
					<td>
						<a href="../upload/<%=fDTO.getFile() %>" download><%=fDTO.getFile() %></a><br><br><br>
						<textarea name="content" class="form-control" rows="20" required><%=fDTO.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td>
                        <label for="inputFile">첨부파일</label>
                        <input type="file" name="file" id="inputFile" class="form-control">
                    </td>
				</tr>
				<tr>
					<td>
						<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='fileContent.jsp?num=<%=num %>'">
						<input type="submit" value="수정" class="btn btn-primary">
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