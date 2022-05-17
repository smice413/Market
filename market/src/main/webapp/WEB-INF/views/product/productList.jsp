<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuShop.jsp"%>
	<div class="container" align="center">

		<h3 class="text-primary">상품 목록</h3>

		<!-- 폭이 넓은 스크린 -->
		<div class="vf-wide-screen">

		<table width=100%>
			<tr><td align=left>정렬 박스 들어갈 곳</td>
				<td align=right>
				<form action="${path}/productList.do?pageNum=1">
					<select name="search">
						<option value="p_status">판매중</option>
						<option value="p_status">일시판매중지</option>
						<option value="p_status">판매완료</option>
						<option value="p_status">판매정지</option>
					</select> 
				</form>
				</td>
			</tr>
		</table>

		</div>
		<div class="vf-wide-screen">
		<table class="table table-hover">
			<tr>
				<td>상품번호</td>
				<td>상품명</td>
				<td>일반판매가</td>
				<td>공동구매가</td>
				<td>팔로워할인가</td>
				<td>재고</td>
				<td>상품상태</td>
				<td>상품상태변경</td>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="8">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="p" items="${list }">
					<tr>
						<td>${p.p_no}</td>
						<td><a href="productView.do?p_no=${p.p_no}">${p.p_name}</a></td>
						<td>${p.p_sell_price}</td>
						<td>${p.p_group_price}</td>
						<td>${p.p_follow_price}</td>
						<td>${p.p_stock}</td>
						<td><c:if test="${p.p_status =='1'}">판매중</c:if></td>
						<td><input type="button" value="상품상태변경" class="btn btn-success"></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
		
		<!-- 폭이 좁은 스크린 -->
		<div class="vf-less-wide-screen">
		<table width=100%>
			<tr><td align=left>정렬 박스 들어갈 곳</td>
				<td align=right>
				<form action="${path}/productList.do?pageNum=1">
					<select name="search">
						<option value="p_status">판매중</option>
						<option value="p_status">일시판매중지</option>
						<option value="p_status">판매완료</option>
						<option value="p_status">판매정지</option>
					</select> 
				</form>
				</td>
			</tr>
		</table>
		</div>
		<div class="vf-less-wide-screen">
		<table class="table table-hover">
			<tr>
				<td>상품번호</td>
				<td>상품명</td>
				<td>재고</td>
				<td>상품상태</td>
				<td>상품상태변경</td>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="8">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="p" items="${list }">
					<tr>
						<td>${p.p_no}</td>
						<td><a href="productUpdateForm.do?p_no=${p.p_no}">${p.p_name}</a></td>
						<td>${p.p_stock}</td>
						<td><c:if test="${p.p_status =='1'}">판매중</c:if></td>
						<td><input type="button" value="상품상태변경" class="btn btn-success"></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
		
		
		<form action="${path}/productList.do?pageNum=1">
			<select name="search">
				<option value="p_name"
					<c:if test="${search=='p_name'}">selected="selected" </c:if>>상품명</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="확인">
		</form>
		<ul class="pagination">
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/productList.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/productList.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/productList.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/productList.do?pageNum=${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/productList.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/productList.do?pageNum=${pp.endPage + 1}">다음</a></li>
				</c:if>
		  </c:if>
		</ul>
		<div align="center">
			<a href="${path}/productInsertForm.do" class="btn btn-success">상품 등록</a>
		</div>
	</div>
	
	
<br><br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
