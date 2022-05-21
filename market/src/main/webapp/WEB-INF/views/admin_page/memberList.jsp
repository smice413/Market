<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuAdmin.jsp"%>


<div class="container" align=center>
		<div class="vf-wide700-card">
		<div id="memberlist">
		<h2 class="memberlist">회원리스트</h2>
		<form name="list" method="post" action ="memberlist.do">
		<table id="memberlist" class="table">
		<thead>
		<tr>
			<th>이메일</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>성별</th>
			<th>가입일</th>
			<th>탈퇴일</th>
		</tr>
<c:forEach var="l" items="${memberList}">
		<tr>
			<td>${l.m_email}</td>
			<td>${l.m_name}</td>
			<td>${l.m_birthday}</td>
			<td>${l.m_tel}</td>
			<td>${l.m_sex}</td>
			<td>${l.m_regdate}</td>
			<td>${l.m_deldate}</td>
		</tr>
</c:forEach>
		
</table>
</form>
</div>
</div>
</div>
</body>
</html>