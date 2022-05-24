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
	
<style>
.cart_qty_btn{
	margin-top:35px;
	outline:none;
}
.cart_qty_input{
	width:50px;
	margin-top:35px;
	margin-right:0;	
}
.qty_modify_btn{
	margin-top:0px;
	height:35px;
}
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
</header>


   <div class="container">
		<div class="row qnas" style="text-align: center;">
			<h2 class="page-header"><label>장바구니</label></h2>
			
			<!-- 장바구니에 등록된 상품이 없는 경우  -->
			<c:if test="${empty cartList}">
				<div style="margin-top: 50px; margin-bottom:50px; ">
                     <img src="${path }/images/icon_cart.png" style="width:60px; height:60px; margin-bottom:20px;"> <br> 
					 <label style="font-size:20px;" > 
					 	장바구니에 담긴 상품이 없습니다.</label><br>
				                 원하는 상품을 장바구니에 담아보세요!<br>
				     	<a href="main.do" class="goShoping_btn btn btn-success" style="margin-top:20px;margin-bottom: 50px;">쇼핑하러 가기</a>  					
				</div>         
			    
 			</c:if>
 				
 			<!-- 장바구니에 등록된 상픔이 있는 경우 -->
			<c:if test="${not empty cartList}">
			
			<!-- 장바구니 리스트 -->
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
					<c:forEach var="cl" items="${cartList}" >
						<c:if test="${sn.s_no eq cl.s_no}">
						<tr>
							<td class="cart_info_td">
							<c:if test="${cl.p_stock != 0}">
								<!-- 개별 체크박스 -->
								<input type="checkbox" class="chkbox_input_${sn.s_no}" name="cart_no" checked="checked" value="${cl.cart_no}">
								<input type="hidden" class="p_sell_price_input" name="p_sell_price" value="${cl.p_sell_price}">
								<input type="hidden" class="cart_qty_input" name="cart_qty" value="${cl.cart_qty}">
								<input type="hidden" class="total_price_input" name="total_price" value="${cl.p_sell_price * cl.cart_qty}">
								<input type="hidden" class="p_no_input" name="p_no" value="${cl.p_no}">
								<input type="hidden" class="cart_no_input" name="cart_no" value="${cl.cart_no}">
								<input type="hidden" class="p_stock_input" name="p_stock" value="${cl.p_stock}">
							</c:if>
							</td>
							<td width=105px><img src="${path}/upload/product/${cl.p_img}" width=100px></td>
							<td align="left">
							  <div style="margin-top:28px;">
								${cl.p_name} 재고 : ${cl.p_stock }<br>
								<div style="font-size:13px;">
									<label><fmt:formatNumber pattern="#,###,###" value="${cl.p_sell_price}"/>&nbsp;원</label>
								    | ${cl.s_name} 
							    </div>
							  </div>  
							</td>
							<td>
								<c:if test="${cl.p_stock != 0}">
								<div class="table_text_align_center cart_qty_div" style="display:flex;">
									<button class="cart_qty_btn minus_btn btn btn-default">-</button>
									<input type="text" name="cart_qty" value="${cl.cart_qty}" class="cart_qty_input form-control">
									<button class="cart_qty_btn plus_btn btn btn-default">+</button>
								</div>
									<a class="qty_modify_btn btn btn-default" data-cart_no="${cl.cart_no}">변경</a>
								</c:if>
								<c:if test="${cl.p_stock == 0 }">
									<label style="margin-top:35px;margin-left:40px; color:red;">품절</label>
								</c:if>
							</td >
							<td class="table_text_align_center">
							  <div style="margin-top:37px;">	
								<fmt:formatNumber value="${cl.p_sell_price * cl.cart_qty}" pattern="#,###,### 원" />
							  </div>
							</td>
							<td class="table_text_align_center">
								<input type="hidden" name="cart_no" value="${cl.cart_no}">cart_no:${cl.cart_no}
								<button class="delete_btn btn btn-default" data-cart_no="${cl.cart_no}"
								         style="margin-top:35px;">삭제</button>
							</td>
						</tr>
						</c:if>

					</c:forEach>
				</tbody>
			</table>
			<div class="totalPrice_div_${sn.s_no}" style="text-align: right;font-size:18px; margin-top:20px;">
				<strong>총 결제 예상 금액 :</strong> <span class="totalPricce_span"></span> 원 <br>
				<a id="order_btn" class="btn btn-success order_btn" style="margin-top:10px;">주문하기</a>
			</div>
			
		    </c:forEach>
			
			
		
		<div class="row" style="text-align:center; margin-bottom:70px; margin-top:30px;">
			<button class="btn btn-success shoping_btn">쇼핑 계속하기</button>
			<button class="btn btn-success allDelete_btn">장바구니 비우기</button>
		</div>
		</c:if>
      </div>
    </div>

	<!-- 삭제 form -->
    <form action="cartDelete.do" method="post" class="delete_form">
 		<input type="hidden" name="cart_no" class="delete_cart_no">
    </form>
	
	<!-- 수량 수정 form -->
	<form method="post" action="cartQtyUpdate.do" class="qty_update_form">	
		<input type="hidden" name="cart_no" class="update_cart_no">	
		<input type="hidden" name="cart_qty" class="update_cart_qty">	
	</form>
	
	<!-- 주문 form -->
    <form action="order.do" method="get" class="order_form">
 
    </form>


<script>

	// 쇼핑계속하기 버튼
	$(".shoping_btn").on("click", function(){
		location.href="main.do"
	});

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
	
	// 상품 수량 수정 버튼
 	$(".qty_modify_btn").on("click", function(){
		let cart_no = $(this).data("cart_no");
		let cart_qty = $(this).parent("td").find("input").val();
		$(".update_cart_no").val(cart_no);
		$(".update_cart_qty").val(cart_qty);
		$(".qty_update_form").submit();
		
	}); 
	
	// 장바구니 개별 상품 삭제 버튼
	$(".delete_btn").on("click",function(e){
		e.preventDefault();
		const cart_no = $(this).data("cart_no");
		$(".delete_cart_no").val(cart_no);
		$(".delete_form").submit();
	});
	
	// 장바구니 비우기 버튼
	$(".allDelete_btn").on("click",function(){
		var check = confirm("장바구니를 비우겠습니까?");
		if(check){
			location.href="allCartDelete.do";
		}
	})
</script>	
<c:forEach var="sn" items="${shopNo}">	
<script>	
	$(document).ready(function(){
	// 총 결제 예상 금액 삽입
	setTotalInfo(); 
	});
				
	//var s_no = ${sn.s_no};
				
	// 체크여부에 따른 총 결제 예상 금액 변화
	$(".chkbox_input_${sn.s_no}").on("change",function(){
		setTotalInfo($(".cart_info_td_${sn.s_no}")); 
	});
				
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
					
		setTotalInfo($("cart_info_td_${sn.s_no}"));
	});
				
	function setTotalInfo(){
					
		let totalPrice = 0;  
					 
		 $(".cart_info_td").each(function(index, element){
			if($(element).find(".chkbox_input_${sn.s_no}").is(":checked")===true){
				// 총 결제 예상 금액
				totalPrice += parseInt($(element).find(".total_price_input").val()); 
			}
		 });
				 
		 $(".totalPricce_span").text(totalPrice.toLocaleString());
	}	
			
	// 주문 페이지 이동
 	$(".order_btn").on("click",function(){
		
		let form_contents = '';
		let orderNumber = 0;
		
		$(".cart_info_td").each(function(index, element){
			
			if($(element).find(".chkbox_input_${sn.s_no}").is(":checked") === true){
				let cart_no = $(element).find(".cart_no_input").val();
				let cart_qty = $(element).find(".cart_qty_input").val();
				
				let cart_no_input = "<input name='orders[" + orderNumber + "].cart_no' type='hidden' value='" + cart_no + "'>";
				form_contents += cart_no_input;
				
				let cart_qty_input = "<input name='orders[" + orderNumber + "].cart_qty' type='hidden' value='" + cart_qty + "'>";
				form_contents += cart_qty_input;
				
				orderNumber += 1;
			}
		});
		$(".order_form").html(form_contents);
		$(".order_form").submit(); 
	});
		
/* 		function order_check(){
			var orderArr = new Array();
			$("input:checkbox[name=cart_no]:checked").each(function(){
				orderArr.push($(this).val());
			});
		}
			 */	
		
	

</script>
</c:forEach>



<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

</body>
</html>