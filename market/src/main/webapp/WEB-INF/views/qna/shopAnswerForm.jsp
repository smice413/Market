<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuShop.jsp"%>
	<div class="container">
		<h3 class="text-primary">답글 쓰기</h3>
		<div class="vf-wide700-card">
		<form action="${path}/insert.do" method="post">
			<input type="hidden" name="p_no" value="${p_no}"> 
			<input type="hidden" name="op_no" value="${op_no}">
			<input type="hidden" name="m_email" value="${m_email}">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input type="text" name="qna_title" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="qna_question" name="qna_question" rows="10" cols="50" required="required"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="qna_secret">비밀글로 문의하기</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>