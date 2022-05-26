<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/viewConfiguration.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재입고신청</title>
<%-- <link rel="stylesheet" href="${path}/css/reset.css"> --%>
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
	<link rel="stylesheet" href="${path}/css/swiper.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
<style>
input[type="checkbox"]{
	margin-top:28px;
	zoom:1.3;
	accent-color : #218838;
}
</style>	
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="../common/menuMyPage.jsp"%>
</header>


   <div class="container">
		<div class="row qnas" style="text-align: center;">
			<h2 class="page-header">
				<img src="${path}/images/bell-fill.svg" style="width:30px; height:30px; margin-bottom:5px;">
				<label>재입고신청</label>
				<label style="font-size:13px; margin-bottom:5px; margin-left:5px;">총 ${total}개</label>
			</h2>
			
			<!-- 재입고신청 상품에 등록된 상품이 없는 경우  -->
			<c:if test="${empty restockList}">
				<div style="margin-top: 50px; margin-bottom:50px; ">
                     <img src="${path}/images/bell-fill.svg" style="width:60px; height:60px; margin-bottom:20px;"> <br> 
					 <label style="font-size:20px;" > 
					 	재입고신청 상품이 없습니다.</label><br>
				                 상품정보 페이지에서 추가해 보세요.<br>
				     	<a href="main.do" class="goShoping_btn btn btn-success" style="margin-top:20px;margin-bottom: 50px;">쇼핑하러 가기</a>  					
				</div>         
			    
 			</c:if>
 				
 			<!-- 재입고신청 상품에 등록된 상품이 있는 경우 -->
			<c:if test="${not empty restockList}">
			
			<!-- 재입고신청 상품 리스트 -->
	        <c:forEach var="sn" items="${shopNo}">
			<table class="table" style=" margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>	
					<tr>
						<th colspan="6">
							<!-- 한번에 전체 상품을 체크하는 체크박스 -->
							<input type="checkbox" class="allCheck_input_${sn.s_no}" id=checkbox checked="checked" style="margin-right:5px;">
							<img src="${path}/images/shop.png" style="width:30px; height:30px; margin-bottom:7px;">
							<label style="font-size:20px; margin-left:5px;">${sn.s_name}</label> 
						</th> 
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rl" items="${restockList}" >
						<c:if test="${sn.s_no eq rl.s_no}">
						<tr>
							<td class="restock_info_td">
							<%-- <c:if test="${rl.p_stock != 0}"> --%>
								<!-- 개별 체크박스 -->
								<input type="checkbox" class="chkbox_input_${sn.s_no}" name="re_no" checked="checked" value="${rl.re_no}">
								<input type="hidden" class="p_sell_price_input" name="p_sell_price" value="${rl.p_sell_price}">
								<input type="hidden" class="p_no_input" name="p_no" value="${rl.p_no}">
								<input type="hidden" class="re_no_input" name="re_no" value="${rl.re_no}">
								<input type="hidden" class="p_stock_input" name="p_stock" value="${rl.p_stock}">
							<%-- </c:if> --%>
							</td>
							<td width=105px>
								<a href="productView.do?p_no=${rl.p_no}">
								<img src="${path}/upload/product/${rl.p_img}" width=100px></a></td>
							<td align="left">
							  <div style="margin-top:28px;">
							  	<a href="productView.do?p_no=${rl.p_no}" style="text-decoration:none; color:black;">${rl.p_name}</a><br>
								<div style="font-size:13px;">
									<label style="color:red"><fmt:formatNumber pattern="#,###,###" value="${rl.p_sell_price}"/>&nbsp;원</label>
								    | ${rl.s_name} 
							    </div>
							  </div>  
							</td>
							<td>
								<c:if test="${rl.p_stock == 0 }">
									<label style="margin-top:35px;margin-left:40px; color:red;">품절</label>
								</c:if>
							</td >
							<td class="table_text_align_center">
							  <div style="margin-top:37px;">	
								<fmt:formatNumber value="${rl.p_sell_price}" pattern="#,###,### 원" />
							  </div>
							</td>
							<td class="table_text_align_center">
								<input type="hidden" name="re_no" value="${rl.re_no}">
								<button class="delete_btn btn btn-default" data-re_no="${rl.re_no}"
								         style="margin-top:35px; margin-right:35px; float:right;">삭제</button>
							</td>
						</tr>
						</c:if>

					</c:forEach>
				</tbody>
			</table>
			
		    </c:forEach>
		<div class="row" style="text-align:center; margin-bottom:70px; margin-top:30px;">
			<button class="btn btn-success shoping_btn">쇼핑하러 가기</button>
			<button class="btn btn-success allDelete_btn">전체삭제</button>
		</div>
		</c:if>
      </div>
    </div>

	<!-- 삭제 form -->
    <form action="restockDelete.do" method="post" class="delete_form">
 		<input type="hidden" name="re_no" class="delete_re_no">
    </form>

<script>

	// 쇼핑계속하기 버튼
	$(".shoping_btn").on("click", function(){
		location.href="main.do"
	});
	
	// 재입고신청 상품 개별 삭제 버튼
	$(".delete_btn").on("click",function(e){
		e.preventDefault();
		const re_no = $(this).data("re_no");
		$(".delete_re_no").val(re_no);
		$(".delete_form").submit();
	});
	
	// 재입고신청 상품 전체삭제 버튼
	$(".allDelete_btn").on("click",function(){
		var check = confirm("재입고신청 상품을 전부 삭제하시겠습니까?");
		if(check){
			location.href="allRestockDelete.do";
		}
	})
</script>	
<c:forEach var="sn" items="${shopNo}">	
<script>		
	// 전체선택일때 하나라도 체크박스 해제할 경우 
	$(".chkbox_input_${sn.s_no}").click(function () {
		$(".allCheck_input_${sn.s_no}").prop("checked", false);
	});
				
	// 체크박스 전체 선택
	$(".allCheck_input_${sn.s_no}").click(function(){
					
		// 체크박스 체크/해제
		var chk = $(".allCheck_input_${sn.s_no}").prop("checked");
		if(chk){
			$(".chkbox_input_${sn.s_no}").prop("checked",true);
		}else{
			$(".chkbox_input_${sn.s_no}").prop("checked",false);
		}
	});

</script>
</c:forEach>

<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

</body>
</html>