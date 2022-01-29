<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<!-- bootstratp css -->
<jsp:include page="../inc/bootstrap_css.jsp"></jsp:include>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- header -->
<!-- 세션으로 로그인 휴요성 검사 ----------------------------------------------------------------- -->
<!-- main -->
	<div class="container mt-5">
		<h2>문의글작성</h2>
		<form action="writePro.jsp" method="post" enctype="Multipart/form-data">
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" placeholder="제목"></td>
				</tr>
				
				<tr>
					<td><textarea name="content" class="form-control" rows="20" placeholder="여기에 내용을 적어주세요"></textarea></td>
				</tr>
				
				<tr>
					<td><input type="file" name="file" class="form-control" ></td>
				</tr>
				<tr>
				<td>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="private" id="inlineRadio1" value="공개">
					  <label class="form-check-label" for="inlineRadio1">공개</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="private" id="inlineRadio2" value="비공개" checked="checked">
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
<!-- footer -->
<!-- bootstratp js -->
<jsp:include page="../inc/bootstrap_js.jsp"></jsp:include>
</body>
</html>