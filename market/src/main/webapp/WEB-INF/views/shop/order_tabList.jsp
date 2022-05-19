<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/viewConfiguration.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 주문 확인</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menuShop.jsp" %>
<div class="container" align="center">
	<h2 class="text-primary">주문확인</h2>
	<table class="table table-hover">
		<tr>
			<td>주문번호</td>
			<td>회원이메일</td>
			<td>총주문액</td>
			<td>결제방법</td>
			<td>주문일자</td>
			<td>기타</td>
		</tr>
		<c:forEach var="o" items="${olist}">
			<tr>
			<td>${o.o_no}</td>
			<td>${o.m_email}</td>
			<td>${o.o_total_price}</td>
			<td>${o.o_pay_type}</td>
			<td>
				<fmt:formatDate value="${o.o_date}" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			<td>
				배송번호 : &nbsp;&nbsp;
				<input type="text" maxlength="8">
				<input type=button value="입력">
				<input type=button value="주문취소"
				 onclick="if(confirm('취소하시겠습니까?'))location.href=
				 'OrderCancel.do?o_no=${o.o_no}'">
			</td>
			</tr>
		
		</c:forEach>
	</table>
<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>