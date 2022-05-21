<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입점신청내역</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuAdmin.jsp"%>
<table>
		<tr>
			<th>email</th>
			<th>상호명</th>
			<th>대표자명</th>
			<th>사업자번호</th>
			<th>통신판매업번호</th>
			<th>서류첨부</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>은행명</th>
			<th>정산계좌</th>
			<th>가입일</th>
			<th>상태</th>
		</tr>
	<c:forEach var="shop" items="${shoplist}">
	
		<tr>
		 	<td>${shop.s_email}</td>
		 	<td>${shop.s_name}</td>
		 	<td>${shop.s_ceo}</td>
		 	<td>${shop.s_bizno}</td>
		 	<td>${shop.s_tonsin}</td>
		 	<td>${shop.s_file}</td>
		 	<td>${shop.s_post}</td>
		 	<td>${shop.s_address}</td>
		 	<td>${shop.s_tel}</td>
		 	<td>${shop.s_bank}</td>
		 	<td>${shop.s_account}</td>
		 	<td>${shop.s_regdate}</td>
		 	<td>${shop.s_status}</td>
			
		</tr>
	</table>

</c:forEach>


</body>
</html>