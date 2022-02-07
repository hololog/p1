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
<script type="text/javascript">
	function clickDel(num) {
		location.replace("deletePro.jsp?num="+num);
	}
</script>
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
				 	<input type="button" class="btn btn-primary" value="목록" onclick="history.back()" >
<%
	//본인이 작성한 글에만 수정삭제하기버튼 보이기
	String id=(String)session.getAttribute("sessionID");
	MemberDAO mDAO=new MemberDAO();
	if(id!=null){
		String reviewNick=rDTO.getNick();
		String userNick=mDAO.getUserInfo(id).getNick();
		
		if(userNick.equals(reviewNick)){
%>				 	
				 	<button type="button" class="btn btn-primary" onclick="location.href='updateReviewForm.jsp?num=<%=num %>'">수정</button>
				 	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal">삭제</button>
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
<!-- Modal -->
<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title" id="ModalLabel">게시물 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body py-0">
        이 게시물을 삭제하시겠습니까?
      </div>
      <div class="modal-footer flex-column border-top-0 ">
        <button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2" onclick="clickDel('<%=num%>')">삭제2</button>
       	<button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2" onclick="location.href='deleteReviewPro.jsp?num=<%=num%>'">삭제</button> 
       	<button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<!-- main contents -->
<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>