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


<div class="container" align="center">
<div class="vf-wide700-card">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">내가 쓴 리뷰 목록</h3>

<div align="right">리뷰 개수 : ${reviewCount }</div>
<table class="table">
	<tr>
		<th style="text-align: center;">제목</th>
		<th style="text-align: center;">별점</th>
		<th style="text-align: center;">작성일</th>
		<th style="text-align: center;">조회수</th>
	</tr>
	
<c:forEach var="list" items="${reviewList }">

	<tr>
		<td style="text-align: center;">
			<a href="reviewDetail.do?r_no=${list.r_no }&p_no=${list.p_no}">${list.r_title }</a>
		</td>
		<td style="text-align: center;">
			<c:if test="${list.r_star == 0}">☆☆☆☆☆</c:if>
			<c:if test="${list.r_star == 1}">★☆☆☆☆</c:if>
			<c:if test="${list.r_star == 2}">★★☆☆☆</c:if>
			<c:if test="${list.r_star == 3}">★★★☆☆</c:if>
			<c:if test="${list.r_star == 4}">★★★★☆</c:if>
			<c:if test="${list.r_star == 5}">★★★★★</c:if>
		</td>
		
		<td style="text-align: center;">
			<fmt:formatDate value="${list.r_writedate }" pattern="yyyy-MM-dd"/>
		</td>
		<td style="text-align: center;">${list.r_hit }</td>
	</tr>
</c:forEach>	

</table>

</div>
</div>

</body>
</html>