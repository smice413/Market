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
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container">
		<h3 class="text-primary">배송관련,주문(취소/교환/환불)관련 문의</h3>
		<div class="vf-wide700-card">
		<form id="insert_form" method="post" action="${path}/qnaInsert.do" >
			<input type="hidden" name="p_no" value="18">
			<input type="hidden" name="m_email" value="${sessionScope.m_email }">
			<input type="hidden" name="qna_answer" value="답변대기">		
			<input type="hidden" name="s_no" value="${product.s_no}">
			<table class="table">
				<tr>
					<td>상품</td>
					<td>[${product.s_name}] ${product.p_name}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input class="form-control" type="text" size=40 name="qna_title" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" id="qna_question" name="qna_question" rows="10" cols="50" required="required"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="qna_secret" value="Y"> 비밀글로 문의하기</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="insert_btn btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	
<br><br><br><br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
	