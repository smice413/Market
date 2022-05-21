<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<h3>내가 쓴 리뷰</h3>

<div class="container" align="center">
<div class="vf-wide700-card">

<table class="table">
	<tr>
		<th>제목</th>
		<th>별점</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
<c:forEach var="list" items="${reviewList }">

	<tr>
		<td>
			<c:if test="${list.r_star == 0}">☆☆☆☆☆</c:if>
			<c:if test="${list.r_star == 1}">★☆☆☆☆</c:if>
			<c:if test="${list.r_star == 2}">★★☆☆☆</c:if>
			<c:if test="${list.r_star == 3}">★★★☆☆</c:if>
			<c:if test="${list.r_star == 4}">★★★★☆</c:if>
			<c:if test="${list.r_star == 5}">★★★★★</c:if>
		</td>
		<td>
			<a href="reviewDetail.do?r_no=${list.r_no }&p_no=${list.p_no}">${list.r_title }</a>
		</td>
		<td>
			<fmt:formatDate value="${list.r_writedate }" pattern="yyyy-MM-dd"/>
		</td>
		<td>${list.r_hit }</td>
	</tr>
</c:forEach>	

</table>

</div>
</div>

</body>
</html>