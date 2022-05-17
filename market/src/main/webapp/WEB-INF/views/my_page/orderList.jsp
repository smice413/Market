<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>



</head>
<body>

<h1>주문 목록</h1>

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
			<div class="thumb">상품 사진</div>
			
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
</c:forEach>	


</body>
</html>