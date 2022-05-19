<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불요청</title>
</head>
<body>

<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container" align="center">
<h3 style="font-weight: bold;">환불 요청</h3>

<div class="vf-wide700-card">

<form method="post" action="refundForm.do">
<input type="hidden" name="op_no" value="${op_no }">
<table align="center" class="table">
	<tr>
		<td style="text-align: center; font-weight: bold;">환불 사유</td>
		<td style="text-align: center;">
			<textarea name="op_refund_why" id="op_refund_why" rows="10" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="등록" class="btn btn-outline-success">
			<input type="button" value="취소" class="btn btn-outline-warning">
		</td>
	</tr>
</table>
</form>

</div>
</div>

</body>
</html>