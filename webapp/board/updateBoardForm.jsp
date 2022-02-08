<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateBoardForm.jsp</title>
<!-- bootstratp css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header -->
<%
String id=(String)session.getAttribute("sessionID");
//사용자 로그인 확인
if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
}
int num=Integer.parseInt(request.getParameter("num"));

BoardDAO bDAO=new BoardDAO();
BoardDTO bDTO=bDAO.getContent(num);

String nick=(String)session.getAttribute("nick");
//멤버의 닉이랑 리뷰의 닉이 같을때만 수정화면보이기 
if(!(nick.equals(bDTO.getNick()))){
%>	
	<script type="text/javascript">
		alert("본인의 게시물이 아닙니다.");
		location.href="../board/boardList.jsp";
	</script>
<%
}
%>
<!-- main -->
	<div class="container mt-5">
		<h2>문의글수정</h2>
		<form action="updateBoardPro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" value="<%=bDTO.getSubject() %>" required></td>
				</tr>
				<tr>
					<td>
						<textarea name="content" class="form-control" rows="20" required><%=bDTO.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='reviewContent.jsp?num=<%=num %>'">
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