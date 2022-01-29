<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
<jsp:useBean id="bean" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>
<%
	MemberDAO mDAO=new MemberDAO();
	bean=mDAO.userCheck(bean);
	
	if(bean!=null){
		//DB에 같은 정보있으면 로그인(세션생성)
		session.setAttribute("id", bean.getId());
%>
		<script type="text/javascript">
			alert("<%=bean.getNick() %>님, 반갑습니다.");
			location.href="../main/main.jsp";
		</script>		
<%		
	} else {
		//없으면 다시로그인 시도
%>
		<script type="text/javascript">
			alert("로그인에 실패했습니다.");
			history.back();
		</script>		
<%	
	}
%>
</body>
</html>