<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>


<div class="container" align="center">

<div class="vf-wide700-card">

<table class="table">
		<tr>
			<td>상품명</td>
			<td>${product.p_name }</td>
		</tr>
		<tr>
			<td>제 목</td>
			<td>${review.r_title }</td>
			<td>작성일</td>
			<td>
				<fmt:formatDate value="${review.r_writedate }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<td>별 점</td>
			<td>
				<c:if test="${review.r_star == 0}">☆☆☆☆☆</c:if>
				<c:if test="${review.r_star == 1}">★☆☆☆☆</c:if>
				<c:if test="${review.r_star == 2}">★★☆☆☆</c:if>
				<c:if test="${review.r_star == 3}">★★★☆☆</c:if>
				<c:if test="${review.r_star == 4}">★★★★☆</c:if>
				<c:if test="${review.r_star == 5}">★★★★★</c:if>
			</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>${content }</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="button" value="수정">
				<input type="button" value="삭제">
				<input type="button" value="목록으로">
			</td>
		</tr>
	</table>

</div>

</div>

</body>
</html>