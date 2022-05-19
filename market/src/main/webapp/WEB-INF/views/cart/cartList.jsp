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
			<h3 class="page-header">장바구니</h3>
			
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
								<input type="checkbox" class="chkbox_input" name="cart_no" checked="checked" value="${cl.cart_no}">
								<input type="hidden" class="p_sell_price_input" value="${cl.p_sell_price}">
								<input type="hidden" class="cart_qty_input" value="${cl.cart_qty}">
								<input type="hidden" class="totalPrice_input" value="${cl.p_sell_price * cl.cart_qty}">
								<input type="hidden" class="p_no_input" value="${cl.p_no}">
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
								<a class="qty_modify_btn btn btn-default " data-cart_no="${cl.cart_no}" style="margin-left:30px;">변경</a>
							</td >
							<td class="table_text_align_center">
								<fmt:formatNumber value="${cl.p_sell_price * cl.cart_qty}" pattern="#,###,### 원" />
							</td>
							<td class="table_text_align_center">
								<button class="delete_btn btn btn-default" data-cart_no="${cl.cart_no}">삭제</button>
							</td>
							
			
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="totalPrice_div" style="text-align: center; margin: 70px 0; font-size:18px;">
				<strong>총 결제 예상 금액 :</strong> <span class="totalPricce_span"></span> 원 
			</div>
			
		
		<div class="row" style="text-align: center; margin: 70px 0;">
			<button class="btn btn-success order_btn">주문하기</button>
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
	
	<!-- 주문 form -->
    <form action="order.do" method="get" class="order_form">
 
    </form>

<script>

	// 상품 수량 버튼
	$(".plus_btn").on("click", function(){
		let qty = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++qty);
	});
	$(".minus_btn").on("click", function(){
		let qty = $(this).parent("div").find("input").val();
		if(qty > 1){
		$(this).parent("div").find("input").val(--qty);
		}	
	});
	
	// 수량 수정 버튼
	$(".qty_modify_btn").on("click",function(){
		let cart_no = $(this).data("cart_no");
		let cart_qty = $(this).parent("td").find("input").val();
		$(".update_cart_no").val(cart_no);
		$(".update_cart_qty").val(cart_qty);
		$(".qty_update_form").submit();
	});

	// 장바구니 삭제 버튼
	$(".delete_btn").on("click",function(e){
		var check = confirm("장바구니에서 상품을 삭제하시겠습니까?");
		if(check){
			e.preventDefault();
			const cart_no = $(this).data("cart_no");
			$(".delete_cart_no").val(cart_no);
			$(".delete_form").submit();
		}
	});
 
	$(document).ready(function(){
		// 총 결제 예상 금액 삽입
		setTotalInfo(); 
	});
	
	// 체크여부에 따른 총 결제 예상 금액 변화
	$(".chkbox_input").on("change",function(){
		setTotalInfo($(".cart_info_td")); 
	});
	
	// 전체선택일때 하나라도 체크박스 해제할 경우 
	$(".chkbox_input").click(function () {
	   $(".allCheck_input").prop("checked", false);
	});
	
	// 체크박스 전체 선택
	$(".allCheck_input").click(function(){
		
		// 체크박스 체크/해제
		var chk = $(".allCheck_input").prop("checked");
		if(chk){
			$(".chkbox_input").prop("checked",true);
		}else{
			$(".chkbox_input").prop("checked",false);
		}
		
		setTotalInfo($("cart_info_td"));
	});
	
	function setTotalInfo(){
		
	   let totalPrice = 0;  
		 
	   $(".cart_info_td").each(function(index, element){
		   if($(element).find(".chkbox_input").is(":checked")===true){
				// 총 결제 예상 금액
			   totalPrice += parseInt($(element).find(".totalPrice_input").val()); 
			}
	   });
	 
	   $(".totalPricce_span").text(totalPrice.toLocaleString());
	}	 
	
	// 주문 페이지 이동
	$(".order_btn").on("click", function(){
		let form_contents ='';
		let orderNumber = 0;
		
		$(".cart_info_td").each(function(index, element){
			
			if($(element).find(".chkbox_input").is(":checked") === true){	//체크여부
				
				let cart_no = $(element).find(".chkbox_input").val();
				
				let cart_no_input = "<input name='orders[" + orderNumber + "].bookId' type='hidden' value='" + cart_no + "'>";
				form_contents += cart_no_input;
				
				orderNumber += 1;
				
			}
		});	
		$(".order_form").html(form_contents);
		$(".order_form").submit();
		
	});
	
</script>




<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

</body>
</html>