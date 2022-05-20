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

<div class="container" align="center">
	<c:if test="${not empty keyword}">
		<h3 class="text-primary">검색조건 : ${keyword }</h3>
	</c:if>	
	<c:if test="${empty list}">
		<table class="table table-hover">
			<tr>
				<td colspan="8" align=center><br>검색하신 조건에 해당되는 상품이 없습니다</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty list}"> 
	<table width=95% style="font-size:12px">
		<tr>
			<td>검색된 상품개수 : ${pp.total}</td>
			<td align=right><a href="${path }/productSearchList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_regdate_DESC">최신순</a> | 
				<a href="${path }/productSearchList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_hit_DESC">조회순</a> | 
				<a href="${path }/productSearchList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_sell_ASC">낮은가격순</a> | 
				<a href="${path }/productSearchList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_sell_DESC">높은가격순</a> | 
				<a href="${path }/productSearchList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_name_ASC">상품명순</a>
			</td>
		</tr>
	</table>
	
		<c:forEach var="p" items="${list }">

			<div class="${p.p_no}" style="float: left;">
				<table style="font-size:14px">
					<tr>
						<td style="padding:8px">
							<a href="${path }/productView.do?p_no=${p.p_no}">
							<img src="${path}/images/${p.p_img}" width=210px height=210px></a></td>
					</tr>
					<tr>
						<td style="padding:0 8 8 8">[${p.s_name}]<br>
						<b>${p.p_name}</b><br>
						일반구매가 : ${p.p_sell_price}원<br>
						<font color=red>공동구매가 : ${p.p_group_price}원</font><br>
						<font color=blue>팔로워특가 : ${p.p_follow_price}원</font></td>
					</tr>
				</table>
			</div>
		</c:forEach>
 	</c:if>
</div>

<div class="container" align="center">
		<ul class="pagination">
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/productSearchList.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}&orderCond=${orderCond}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/productSearchList.do?pageNum=${i}&search=${search}&keyword=${keyword}&orderCond=${orderCond}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/productSearchList.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}&orderCond=${orderCond}">다음</a></li>
				</c:if>
			</c:if>
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/productSearchList.do?pageNum=${pp.startPage - 1}&&orderCond=${orderCond}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/productSearchList.do?pageNum=${i}&orderCond=${orderCond}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/productSearchList.do?pageNum=${pp.endPage + 1}&orderCond=${orderCond}">다음</a></li>
				</c:if>
		  </c:if>
		</ul>


</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
