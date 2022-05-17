<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/viewConfiguration.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%-- <link rel="stylesheet" href="${path}/css/reset.css"> --%>
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
	<link rel="stylesheet" href="${path}/css/swiper.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>





   <div class="container">
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">장바구니</h1>
			
			<!-- 장바구니에 등록된 상품이 없는 경우  -->
			<c:if test="${empty cartList}">
				<div style="margin-top: 50px; margin-bottom:50px; ">
                     <img src="${path }/images/icon_cart.png" style="width:60px; height:60px; margin-bottom:20px;"> <br> 
					 <label style="font-size:20px;" > 
					 	장바구니에 담긴 상품이 없습니다.</label><br>
				                 원하는 상품을 장바구니에 담아보세요!
				     	<button class="btn btn-success" style="margin-top:20px;margin-bottom: 50px;">쇼핑 계속하기</button>  					
				</div>         
			    
 			</c:if>
 				
 			<!-- 장바구니에 등록된 상픔이 있는 경우 -->
			<c:if test="${not empty cartList}">
			
			<!-- 한번에 전체 상품을 체크하는 checkbox -->
			<div class="allCheck_div" style="float:left;">
				<input type="checkbox" class="allCheck_input" checked="checked" ><span calss="allCheck_span"> 전체 선택</span>
			</div>
			
			<!-- 장바구니 리스트 -->
			<table class="table" style=" margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>	 				
					<tr>
						<th></th>
	                    <th></th>
						<th>상품</th>
						<th>구매 수량</th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cl" items="${cartList}" >
						<tr>
							<td class="cart_info_td">
								<input type="checkbox" class="chkbox_input" checked="checked">
								<input type="hidden" class="p_sell_price" value="${cl.p_sell_price}">
								<input type="hidden" class="cart_qty" value="${cl.cart_qty}">
								<input type="hidden" class="totalPrice" value="${cl.p_sell_price * cl.cart_qty}">
							</td>
							<td><img alt="" src=""></td>
							<td>${cl.p_name} <br>
								<div style="font-size:13px;">
									<label><fmt:formatNumber pattern="#,###,###" value="${cl.p_sell_price}"/>&nbsp;원</label>
								    | ${cl.s_name} 
							    </div>
							</td>
							
							<td>
								<div class="table_text_align_center cart_qty_div" style="display:flex;">
									<button class="cart_qty_btn minus_btn btn btn-default">-</button>
									<input type="text" value="${cl.cart_qty}" class="form-control cart_qty_input" style="width:50px">
									<button class="cart_qty_btn plus_btn btn btn-default">+</button>
								</div>
								<a class="qty_modify_btn btn btn-default" data-cart_no="${cl.cart_no}">변경</a>
							</td >
							<td class="table_text_align_center">
								<fmt:formatNumber value="${cl.p_sell_price * cl.cart_qty}" pattern="#,###,### 원" />
							</td>
							<td class="table_text_align_center">
								<button class="delete_btn btn btn-default" data-cart_no="${cl.cart_no}">삭제</button>
							</td>
							
							<!-- 장바구니 상품 삭제 -->
							<script>	
							$(document).ready(function(){
							 	$("#deleteBtn").click(function(){
									var cart_no = ${cl.cart_no};
									var check = confirm("상품을 장바구니에서 삭제하시겠습니까?");
									if(check){
										$.ajax({
											url:"cartDelete.do",
											type:"post",
											data : { cart_no : cart_no},
											success : function(result){
												if(result == 1){
													location.href="cartList.do?";
												}else{
													alert("삭제 실패");
												}
											}
										}); //ajax end
								
									}
								}); 
							});  		
                           </script>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		<div class="totalPrice_div" style="text-align: center; margin: 70px 0;">
			<strong>총 결제 예상 금액 :</strong> <span class="totalPricce_span"></span> 원 
		</div>
			
		
		<div class="row" style="text-align: center; margin: 70px 0;">
			<button class="btn btn-success">주문하기</button>
			<button class="btn btn-success">쇼핑 계속하기</button>
			<button class="btn btn-success">장바구니 비우기</button>
		</div>
		</c:if>
      </div>
    </div>

	<!-- 수량 조절 form -->
	<form method="post" action="cartQtyUpdate.do" class="qty_update_form">
		<input type="hidden" name="cart_no" class="update_cart_no">	
		<input type="hidden" name="cart_qty" class="update_cart_qty">	
		<input type="hidden" name="m_email" value="${sessionScope.m_email }">	
	</form>

	<!-- 삭제 form -->
	<form action="cartDelete.do" method="post" class="delete_form">
		<input type="hidden" name="cart_no" class="delete_cart_no">
		<input type="hidden" name="m_email" value="${sessionScope.m_email}">
	</form>

<script>
	//전체 상품 선택
	$(".allCheck_input").click(function(){
		var chk = $(".allCheck_input").prop("checked");
		if(chk){
			$(".chkbox_input").prop("checked",true);
		}else{
			$(".chkbox_input").prop("checked",false);
		}
	});

	// 전체선택일때 하나라도 체크박스 해제할 경우 
	$(".chkbox_input").click(function () {
	   $(".allCheck_input").prop("checked", false);
	});
 
	// 상품 수량 버튼
	$(".plus_btn").on("click", function(){
		var qty = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++qty);
	});
	$(".minus_btn").on("click", function(){
		var qty = $(this).parent("div").find("input").val();
		if(qty > 1){
		$(this).parent("div").find("input").val(--qty);
		}	
	});
	
	// 수량 수정 버튼
	$(".qty_modify_btn").on("click",function(){
		var cart_no = $(this).data("cart_no");
		var cart_qty = $(this).parent("td").find("input").val();
		$(".update_cart_no").val(cart_no);
		$(".update_cart_qty").val(cart_no);
		$(".qty_update_form").submit();
	});


</script>
<script>	
 
	$(document).ready(function(){
		 var totalPrice = 0;  // 총 결제 예상 금액
		 
		 $(".cart_info_td").each(function(index, element){
			totalPrice += parseInt($(element).find(".totalPrice").val()); 
		 });
		 
		 $(".totalPrice_span").text(totalPrice.toLocaleString);
	
	});

	
</script>




<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

</body>
</html>