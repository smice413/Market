<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
</head>
<body>

<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container" align="center">
<div class="vf-wide700-card" align="center">

<h3 style="font-weight: bold;">주문 상품 목록</h3>

<table align="center" class="table">
	<tr>
		<th style="text-align: center;">:-)</th>
		<th style="text-align: center;">상품명</th>
		<th style="text-align: center;">수량</th>
		<th style="text-align: center;">가격</th>
		<th style="text-align: center;">주문 상태</th>
	</tr>
<c:forEach var="list"  items="${detailList }">
	<tr>
		<td style="text-align: center;"><img src="${path}/images/${list.p_img}" width=100px></td>
		<td style="text-align: center;">${list.p_name }</td>
		<td style="text-align: center;">${list.op_qty }</td>
		<td style="text-align: center;"><fmt:formatNumber value="${list.op_price }" pattern="#,###"/> 원</td>		
		<td style="text-align: center;">
			
		</td>		
	</tr>
</c:forEach>
</table>
</div>

<div class="vf-wide500-card" style="width: 400px;" align="center">

<h3 style="font-weight: bold;">수령인 정보</h3>

<table align="center" class="table">
	<tr>
		<td width=100px>수령인</td>
		<td>${detail.d_name }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${detail.d_tel }</td>
	</tr>
	<tr>
		<td>배송지 주소</td>
		<td>${detail.d_address }  (${detail.d_post })</td>
	</tr>
	<tr>
		<td>배송 메세지</td>
		<td>
			${detail.d_msg }
		</td>
	</tr>
</table>
</div>

<div class="vf-wide500-card" style="width: 400px;" align="center">

<h3 style="font-weight: bold;">결제 정보</h3>

<table table align="center" class="table">
	<tr>
		<td>상품 가격</td>
		<td style="text-align: right"><fmt:formatNumber value="${detail.o_total_price }" pattern="#,###"/> 원</td>
	</tr>
	<tr>
		<td>할인 금액</td>
		<td style="text-align: right">- <fmt:formatNumber value="${detail.o_sale_price }" pattern="#,###"/> 원</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td style="text-align: right"><fmt:formatNumber value="${detail.o_deli_price }" pattern="#,###"/> 원</td>
	</tr>
	<tr>
		<td>결제 방식</td>
		<td style="text-align: right">${detail.o_pay_type }</td>
	</tr>
	<tr>
		<td>총 결제 금액</td>
		<td style="text-align: right"><fmt:formatNumber value="${detail.o_pay_price }" pattern="#,###"/> 원</td>
	</tr>
</table>
</div>
</div>
</body>
</html>