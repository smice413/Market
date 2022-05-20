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

<div class="container" align=center>
	<c:if test="${not empty keyword}">
		<c:if test="${not empty listCategory}"> 
		
		<div  class="container" style="width:100%;  border-radius: 10px; border-style: dotted; border-width: 2px;">
			<c:forEach var="c" items="${listCategory }">
				<div style="width: 115px; float: left; text-align: center; font-weight: bold; padding:7 0 7 0; ">
				<a href="${path}/productCategoryList.do?search=cate_small&keyword=${c.cate_small }">${c.cate_small }</a>
				</div>
			</c:forEach>
		</div>
		
		</c:if>
	</c:if>	
	<c:if test="${empty list}">
		<table class="table table-hover">
			<tr>
				<td align=center><br>해당 카테고리에는 상품이 없습니다</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty list}">
	<table style="font-size:13px; width:100%">
		<tr>
			<td style="padding:5 0 0 10;">검색된 상품개수 : ${pp.total}</td>
			<td  style="padding:5 10 0 0;" align=right><a href="${path }/productCategoryList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_regdate_DESC">최신순</a> | 
				<a href="${path }/productCategoryList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_hit_DESC">조회순</a> | 
				<a href="${path }/productCategoryList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_sell_ASC">낮은가격순</a> | 
				<a href="${path }/productCategoryList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_sell_DESC">높은가격순</a> | 
				<a href="${path }/productCategoryList.do?pageNum=1&search=${search}&keyword=${keyword}&orderCond=p_name_ASC">상품명순</a>
			</td>
		</tr>
	</table>
		<c:forEach var="p" items="${list }">

			<div class="${p.p_no}" style="float: left;">
				<table style="font-size:14px">
					<tr>
						<td style="padding:9px">
							<a href="${path }/productView.do?p_no=${p.p_no}">
							<img src="${path}/upload/product/${p.p_img}" width=210px height=210px></a></td>
					</tr>
					<tr>
						<td style="padding:0 9 9 9">[${p.s_name}]<br>
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
					<li><a href="${path }/productCategoryList.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}&orderCond=${orderCond}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/productCategoryList.do?pageNum=${i}&search=${search}&keyword=${keyword}&orderCond=${orderCond}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/productCategoryList.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}&orderCond=${orderCond}">다음</a></li>
				</c:if>
			</c:if>
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/productCategoryList.do?pageNum=${pp.startPage - 1}&orderCond=${orderCond}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/productCategoryList.do?pageNum=${i}&orderCond=${orderCond}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/productCategoryList.do?pageNum=${pp.endPage + 1}&orderCond=${orderCond}">다음</a></li>
				</c:if>
		  </c:if>
		</ul>
</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
