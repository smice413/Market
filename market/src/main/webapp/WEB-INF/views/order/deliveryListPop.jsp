<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/viewConfiguration.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 선택</title>
</head>
<body>
<h3 class="page-header" style="text-align:center;">배송지 목록</h3>

<div class="container">
	<!-- 저장된 주소지가 있는 경우 -->
	<c:if test="${not empty deliveryList}">
		<table class="table">
			<thead>
				<tr>
					<th>배송지</th>
					<th>주소</th>
					<th>연락처</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="dl" items="${deliveryList }">
				<tr>
					<td>
						<label style="font-size:18px;">${dl.d_cate}</label> 	
						<c:if test="${dl.d_default == 'Y'}">
						<label style="color:#218838">[기본 배송지]</label>	
						</c:if> <br>
						${dl.d_name}
					</td>
					<td>
						${dl.d_post} <br>
						${dl.d_address} <br>
						${dl.d_detail_address}
					</td>
					<td>${dl.d_tel}</td>
<%-- 					<td>
					  <form method="post" action="UpdateDefaultAddr.do">
					  	<input type="hidden" name="d_no" value="${dl.d_no}">
						<button class="select_btn btn btn-outline-success">선택</button>
					  </form>
					</td> --%>
					<td>
						<button class="select_btn btn btn-outline-success">선택</button>
						
						<script>

						$(document).ready(function(){
							// 선택 버튼 클릭시 팝업창 닫기
							$(".select_btn").click(function(){
								var d_no = ${dl.d_no};
								
								$.post("UpdateDefaultAddr.do",{ d_no : d_no },function(){
										opener.document.location.reload();
										self.close();
								}); //post() end
							});
						});
						</script>	
					
					</td>
				</tr>
				</c:forEach>
		    </tbody>
		</table>
	</c:if>
	<c:if test="${empty deliveryList}">
		<div class="table_empty">
			<label style="font-size:22px; margin-top:50px;margin-left:32%">등록된 주소지가 없습니다 :)</label>
		</div>
	</c:if>
</div>

	
</body>
</html>