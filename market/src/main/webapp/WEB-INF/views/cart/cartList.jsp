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
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>





<div class="container">
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">장바구니</h1>
			
			<table class="table" style=" margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
				<c:if test="${empty cartList}">
					<tr><td colspan="6" align="center">
						<div style="margin-top: 50px; margin-bottom:50px; ">
                              <img src="${path }/images/icon_cart.png" style="width:60px; height:60px; margin-bottom:20px;"> <br> 
						 	  <label style="font-size:20px;" >
						 	     장바구니에 담긴 상품이 없습니다.</label><br>
						              원하는 상품을 장바구니에 담아보세요!</td></tr>
						</div>         
				    <tr>
				    	<td colspan="6" align="center" height="">
				    		<button class="btn btn-success" style="margin-top:20px;margin-bottom: 50px;">쇼핑 계속하기</button>
				    	</td>
                    </tr>   					
 				</c:if>
				<c:if test="${not empty cartList}">	 				
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"></th>
	                   
						<th colspan="2" style="text-align: center;">상품</th>
						<th>구매 수량</th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cl" items="${cartList}" >
						<tr>
							<td><input type="checkbox" onClick="itemSum()" class="chkbox" 
							           value="${cl.p_sell_price * cl.cart_qty}"></td>
							<td><img alt="" src=""></td>
							<td>${cl.p_name} <br>
								<div style="font-size:13px;">
									<label><fmt:formatNumber pattern="#,###,###" value="${cl.p_sell_price}"/>&nbsp;원</label>
								    | ${cl.s_name} 
							    </div>
							</td>
							  <form method="post" action="cartQtyUpdate.do">
							  	<input type="hidden" name="cart_no" id="cart_no" value="${cl.cart_no}">	
							  	<input type="hidden" name="m_email" value="${cl.m_email}">	
								<td>
								 <div style="display:flex;">
									<input type="number" name="cart_qty" value="${cl.cart_qty}" 
									       class="form-control" style="width:65px; margin-left:0px; margin-right:10px;">
									<button type="submit" class="btn btn-outline-success">변경</button> 
								 </div>
								</td>
							  </form>
							<td align="left">
							<label>총 가격 : 
							<fmt:formatNumber pattern="#,###,###"  value="${cl.p_sell_price * cl.cart_qty}"/>&nbsp;원
							</label></td>
							<td><button type="button" id="deleteBtn" class="btn btn-default">x</button></td>
							<!-- 장바구니 상품 삭제 -->
							<script>	
							 	$(document).on('click','#deleteBtn',function(){
									var check = confirm("상품을 장바구니에서 삭제하시겠습니까?");
									if(check){
										location.href="cartDelete.do?cart_no=${cl.cart_no}";
									}else{
										return false;
									}
								}); 
		
                           </script>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" align="center" id="total_sum"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row" style="text-align: center; margin: 70px 0;">
			<button class="btn btn-success">주문하기</button>
			<button class="btn btn-success">쇼핑 계속하기</button>
			<button class="btn btn-success">장바구니 비우기</button>
		</div>
		</c:if>
	</div>

<script>
	//전체 상품 선택
	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chkbox").prop("checked",true);
			itemSum();
		}else{
			$(".chkbox").prop("checked",false);
			itemSum();
		}
	});

	// 전체선택일때 하나라도 체크박스 해제할 경우 
	$(".chkbox").click(function () {
	   $("#allCheck").prop("checked", false);
	});
 

 	// 선택된 상품들의 총 합계
 function itemSum(){
		var str="";
		var sum = 0;
		var count = $(".chkbox").length;
		for(var i=0; i<count; i++){
			if($(".chkbox")[i].cheked==true){
				sum += parseInt($(".chkbox")[i].value);
			}
	}
	$("#total_sum").html("총 결제 예상 금액 :"+sum+"원");
		
	} 
</script>
<script>	
/* 
	$(document).ready(function(){
		setTotalInfo();
	});
	
	$(".chkbox").on("change", function(){
		setTotalInfo($(".total_sum"));
	});
	
	function setTotalInfo(){
		var o_total_price = 0;
		
		$(".total_sum").each(function(index, element){
			if($(element).find(.chkbox).is(":checked") === true){
				o_total_price += parseInt($(element).find(".chkbox").val());
			}
		});
	} */
	
</script>




<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

</body>
</html>