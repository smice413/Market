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

<%-- <h1>주문 목록</h1>

<c:forEach var="orderlist" items="${orderlist }" >
<div class="outline" style="width:800px; border:1px solid; margin-bottom: 30px;" >
	<div class="oinfo" style="display: flex; padding: 10px 10px 0px 10px;">
		<div class="odate">주문일자</div>
		<div style="margin-left: 20px;">
			<div><fmt:formatDate value="${orderlist.o_date }" pattern="yyyy-MM-dd"/></div>
		</div>
		<div class="odetail" style="margin-left: auto;">
			<a href="orderdetail.do?op_no=${orderlist.op_no}">주문 상세보기 ></a>
		</div>
	</div>

	<div class="delistatus" style="padding: 10px;">
		<div class="status" style="margin-left: 30px; font-size: 18pt; font-weight: bold;">
			<c:if test="${orderlist.op_status == '3'}">배송 전</c:if>
			<c:if test="${orderlist.op_status == '4'}">주문 취소</c:if>
			<c:if test="${orderlist.op_status == '7'}">배송 완료</c:if>
			<c:if test="${orderlist.op_status == '8'}">환불 요청중</c:if>
		</div>
	</div>
	
		<div class="inside" style="width:700px; border:1px solid; display: flex; margin: 0px auto 30px auto; padding: 10px;">
			<div class="thumb">
				<img src = "${orderlist.p_img}">
			</div>
						
				<div class="trio" style="margin-left: 30px;">
					<div class="pname" style="display: flex;">
						<div>상품명</div>
						<div  style="margin-left: 20px;">${orderlist.p_name }</div>
					</div>
					
					<div class="pprice" style="display: flex;">
						<div>가격</div>
						<div style="margin-left: 35px;">
						<fmt:formatNumber value="${orderlist.op_price / orderlist.op_qty }" pattern="\#,###"/>
						</div>
					</div>
					
					<div class="pqty" style="display: flex;">
						<div>수량</div>
						<div style="margin-left: 35px;">${orderlist.op_qty }</div>
					</div>
				</div>
				
				<c:if test="${orderlist.op_status != '4'}">
				<div class="buttons" style="margin: 0px 20px 0px auto;">
				<div class="button">
						<c:if test="${orderlist.op_status == '3' }">
							<!-- <input type="button" value="주문취소" onClick="cancel()"> -->
							<input type="button" value="주문취소" onClick="location='cancel.do?op_no=${orderlist.op_no}'"> 
						</c:if>
						<c:if test="${orderlist.op_status == '7' }">
							<input type="button" value="환불신청" onClick="location='refund.do?op_no=${orderlist.op_no}'"/>
						</c:if>
					</div>
					<div class="button"><input type="button" value="배송조회"/></div>					
					<div class="button"><input type="button" value="리뷰작성"/></div>
				</div>
				</c:if>
				
		</div>
</div>
</c:forEach> --%>	
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>
	<div class="container" align="center">
		
<h3>주문 목록</h3>
<div class="vf-wide700-card">
<table border="1"  align="center" class="table">
	<tr>
		<th>주문번호</th>
		<th>상품명</th>
		<th>가격</th>
		<th>수량</th>
		<th>주문상태</th>
	</tr>
	
<c:forEach var="list" items="${orderList }">
	<tr>
		<td>
		<a href="orderDetail.do?op_no=${list.op_no}&o_no=${list.o_no}">
			<fmt:formatDate value="${list.o_date }" pattern="yyyyMMdd"/> - 
			<fmt:formatNumber value="${list.o_no }" pattern="#####" minIntegerDigits="5"/>
		</a>
		</td>
		
		<td>${list.p_name}</td>
		
		<td>${list.op_price }</td>
		
		<td>${list.op_qty }</td>
		
		<td>
			<c:if test="${list.op_status == '1' }">공동구매대기</c:if>
			<c:if test="${list.op_status == '2' }">공동구매실패</c:if>
			<c:if test="${list.op_status == '3' }">배송전 
			<input type="button" class="btn btn-success" value="주문 취소" onClick="location='cancel.do?op_no=${list.op_no}'"></c:if>
			<c:if test="${list.op_status == '4' }">주문취소</c:if>
			<c:if test="${list.op_status == '5' }">품절취소</c:if>
			<c:if test="${list.op_status == '6' }">출고완료</c:if>
			<c:if test="${list.op_status == '7' }">배송완료 <input type="button" value="환불 요청"></c:if>
			<c:if test="${list.op_status == '8' }">환불요청중</c:if>
			<c:if test="${list.op_status == '9' }">환불요청중</c:if>
			<c:if test="${list.op_status == '10' }">환불거부</c:if>
			<c:if test="${list.op_status == '11' }">환불완료</c:if>
			<c:if test="${list.op_status == '11' }">거래완료</c:if>
		</td>
		
	</tr>
</c:forEach>
	
</table>
</div>
</div>
</body>
</html>