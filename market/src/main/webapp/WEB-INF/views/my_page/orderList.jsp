<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
</head>
<body>

<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container" align="center">
		
<h3 style="font-weight: bold;" >주문 목록</h3>
<div class="vf-wide700-card" style="width: 900px;">
<table align="center" class="table">
	<tr>
		<th style="text-align: center;">주문번호</th>
		<th style="text-align: center;">상품명</th>
		<th style="text-align: center;">가격</th>
		<th style="text-align: center;">수량</th>
		<th colspan="2" style="text-align: center;">주문상태</th>
	</tr>
	
<c:forEach var="list" items="${orderList }">
	<tr>
		<td style="text-align: center;">
		<a href="orderDetail.do?op_no=${list.op_no}&o_no=${list.o_no}">
			<fmt:formatDate value="${list.o_date }" pattern="yyMMdd"/> - 
			<fmt:formatNumber value="${list.o_no }" pattern="#####" minIntegerDigits="5"/>
		</a>
		</td>
		
		<td style="text-align: center;">${list.p_name}</td>
		
		<td style="text-align: center;"><fmt:formatNumber value="${list.op_price }" pattern="#,###"/> 원</td>
		
		<td style="text-align: center;">${list.op_qty }</td>
		
		<td style="text-align: center;">
			<c:if test="${list.op_status == '1' }">공동구매대기</c:if>
			<c:if test="${list.op_status == '2' }">공동구매실패</c:if>
			<c:if test="${list.op_status == '3' }">배송전 </c:if>
			<c:if test="${list.op_status == '4' }">주문취소</c:if>
			<c:if test="${list.op_status == '5' }">품절취소</c:if>
			<c:if test="${list.op_status == '6' }">출고완료</c:if>
			<c:if test="${list.op_status == '7' }">배송완료 </c:if>
			<c:if test="${list.op_status == '8' }">환불요청중</c:if>
			<c:if test="${list.op_status == '9' }">환불거부</c:if>
			<c:if test="${list.op_status == '10' }">환불완료</c:if>
			<c:if test="${list.op_status == '11' }">거래완료</c:if>
		</td>
		<td>
			<c:if test="${list.op_status == '3' }">
				<input type="button" class="btn btn-success" value="주문 취소" onClick="location='cancel.do?op_no=${list.op_no}'">
			</c:if>
			<c:if test="${list.op_status == '7' }">
				<input type="button" class="btn btn-success" value="구매 확정" onClick="location='confirm.do?op_no=${list.op_no}&s_no=${list.s_no }'">
				<input type="button" class="btn btn-outline-success" value="리뷰 작성">
				<input type="button" class="btn btn-outline-success" value="환불 요청" onClick="location='refund.do?op_no=${list.op_no}'">
			</c:if>
		</td>
		
	</tr>
</c:forEach>
	
</table>
</div>
</div>
</body>
</html>