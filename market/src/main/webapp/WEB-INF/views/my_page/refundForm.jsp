<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>환불요청</h2>
<div class="refundform" style="width: 800px;">
<form method="post" action="refundForm.do">
<input type="hidden" name="op_no" value="${op_no }">
	<div class="refund" style="display: flex;">
		<div>환불 사유</div>
		<div><textarea name="op_refund_why" id="op_refund_why" rows="8" cols="50"></textarea></div>
	</div>
	<div class="buttons">
		<div><input type="submit" value="환불 접수"></div>
		<div><input type="button" value="취소"></div>
	</div>
</form>
</div>
</body>
</html>