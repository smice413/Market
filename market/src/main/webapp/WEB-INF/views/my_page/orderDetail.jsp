<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
</head>
<body>

<h2>주문 상세</h2>

<div class="outline" style="width:800px; border:1px solid;">
	<div class="odetail" style="display: flex; padding: 10px 10px 0px 10px;">
		<div class="odate">주문 일자</div>
			<div style="margin-left: 20px;">
				<fmt:formatDate value="${opdto.o_date }" pattern="yyyy-MM-dd"/>
			</div>
		<div class="ono" style="margin-left: 100px;">주문 번호</div>
			<div style="margin-left: 20px;">
				<fmt:formatDate value="${opdto.o_date }" pattern="yyyyMMdd"/> - <fmt:formatNumber value="${opdto.o_no }" pattern="#####" minIntegerDigits="5"/>
			</div>
	</div>
	<div class="delistatus" style="padding: 10px;">배송 상태</div>
		<div class="inside" style="width:700px; border:1px solid; display: flex; margin: 0px auto 30px auto; padding: 10px;">
			<div class="thumb">상품 사진</div>
				<div class="trio" style="margin-left: 30px;">
					<div class="pname" style="display: flex;">
						<div>상품명</div>
						<div  style="margin-left: 20px;"></div>
					</div>
					<div>가격</div>
					<div>수량</div>
				</div>
				<div class="buttons" style="margin: 0px 20px 0px auto;">
					<div class="button"><input type="button" value="배송조회"/></div>
					<div class="button"><input type="button" value="환불신청"/></div>
					<div class="button"><input type="button" value="리뷰작성"/></div>
				</div>
		</div>
	<div class="person" style="padding: 10px;">받는 사람 정보</div>	
		<div class="personinfo" style="width:700px; border:1px solid; display: flex; margin: 0px auto 30px auto; padding: 10px;">
			<div class="list">
				<div>수령인</div>
				<div>연락처</div>
				<div>주소</div>
				<div>배송 메세지</div>
			</div>
		</div>
	<div class="pay" style="padding: 10px;">결제 정보</div>
		<div class="payinfo" style="width:700px; border:1px solid; display: flex; margin: 0px auto 30px auto; padding: 10px;">
			<div class="payment">결제 수단</div>
			<div class="info" style="margin: 0px auto;">
				<div>총 상품 가격</div>
				<div>할인 가격</div>
				<div>배송비</div>
				<div>총 결제 금액</div>
			</div>
		</div>
</div>

</body>
</html>