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
<title>member/updatePassPro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String newPass=request.getParameter("pass2");
	String newPass1=request.getParameter("pass3");
	MemberDAO mDAO=new MemberDAO();
 	bean=mDAO.userCheck(bean);
 	
//  	int result=0;
	if(!(newPass.equals(newPass1))) {
%>
		<script type="text/javascript">
			alert("새비밀번호가 일치하지 않습니다.");
			history.back();
		</script>	
		
<%	} else if(bean==null){%>

		<script type="text/javascript">
			alert("기존 비밀번호를 다시확인해주세요.");
			history.back();
		</script>
			
<%	} else {
		bean.setPass2(newPass);
		int result=mDAO.updatePass(bean);
		
		if(result==0){
%>			<script type="text/javascript">
				alert("비밀번호가 정상적으로 변경되었습니다.");
				location.href="memberInfo.jsp";
			</script>
	  <%} else {%>
			<script type="text/javascript">
				alert("오류가 발생했습니다.");
				history.back();
			</script>
<%      }
    }
%>
</body>
</html>