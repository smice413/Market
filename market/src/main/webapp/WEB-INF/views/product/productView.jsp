<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	$(function() {
		$('#slist').load('"${path }/productSearchList.do')

		$('#repInsert').click(function() {
			if (!frm.replytext.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.replytext.focus();
				return false;
			}
			var frmData = $('form').serialize();
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;				  
			$.post('${path}/sInsert.do', frmData, function(data) {
				$('#slist').html(data);
				frm.replytext.value = '';
			});
		});
	});
	

</script>
<%-- 	<link rel="stylesheet" href="${path}/css/reset.css"> --%>
 	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"> 
	<link rel="stylesheet" href="${path}/css/swiper.css">


</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container" align="center">
	<div class="vf-left">
		<div  style="width:350px; height:350px; overflow: hidden;">
			<div class="swiper-container gallery-top" >
				<div class="swiper-wrapper">
					<c:forEach var="p" items="${listImg}">
					<div class="swiper-slide"><div class="swiper-slide-container"><img src="${path}/upload/product/${p.p_img}" width=350px></div></div>
					</c:forEach>
			    </div>
			    <div class="swiper-pagination pagination_bullet"></div>
			    <div class="swiper-pagination pagination_progress"></div>
			</div>
		</div>
	</div>
	<div class="vf-right">
		<table class="table" style="font-size:13px;">
			<tr>
				<td colspan=2  style="font-size:15px;">
					<a href="${path}/productSearchList.do?pageNum=1&search=s_name&keyword=${product.s_name}">
						[${product.s_name}]</a>&nbsp;&nbsp;&nbsp;
					<a href=""><img src="${path }/images/icon-follow.png" height=40px></a></td>
			</tr>
			<tr>
				<td colspan=2>
					<font style="font-size:20px;">${product.p_name}</font>&nbsp;&nbsp;
					<a href="">>>관심상품 등록</a></td>
			</tr>
			<tr>
				<td colspan=2>
					<font>일반 구매가 : ${product.p_sell_price}원</font><br>
					
					<c:if test="${product.p_follow_sale == 'Y'}">
						<b>팔로워 할인가 : <font style="font-size:20px;"> ${product.p_follow_price}원</font> </b><br>
						<font color=blue size=2>팔로잉하고 팔로워 할인가로 구매하세요 
						<a href="">>>팔로잉하기</a></font><br>
					</c:if>
					<c:if test="${product.p_group_buying == 'Y'}"> 
						<b>공동구매가 : <font style="font-size:20px;">${product.p_group_price}원</font></b><br>
						<font color=red size=2>공동구매로 더 저렴하게 구매하세요</font>
					</c:if>
			</tr>
			<tr>
				<td>배송비</td>
				<td align=left>3000원 (3만원 이상 무료배송)</td>
			</tr>
			<tr>
				<td class="cart_qty_td" colspan=2 align="left">
			    	<div class="table_text_align_center cart_qty_div" style="display:flex; margin:0;">
						<label style="margin-top:5px;">구매 수량 :</label> 
					   	<button class="minus_btn btn btn-default" style="margin-left:10px;">-</button>
						<input type="text" class="cart_qty form-control" value="1" style="width:45px;">
					   	<button class="plus_btn btn btn-default">+</button>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<a href="#" class="btn btn-success" style="width:90px; height:45px; font-size:12px; padding:4px; margin:2px;">
                  		    <b>${product.p_sell_price}원<b><br>바로 구매하기</a>
				<c:if test="${product.p_follow_sale == 'Y'}">
					<a href="#" class="btn btn-warning" style="width:90px; height:45px; font-size:12px; padding:4px; margin:2px;">
						<b>${product.p_follow_price}원<b><br>팔로워구매하기</a>
				</c:if>
				<c:if test="${product.p_group_buying == 'Y'}"> 
					<a href="#" class="btn btn-danger" style="width:90px; height:45px; font-size:12px; padding:4px; margin:2px;">
						<b>${product.p_group_price}원<b><br>공동구매하기</a>
				</c:if>
					<a class="cart_btn btn btn-outline-success" style="width:90px; height:45px; font-size:12px; padding:4px; margin:2px;">
                           <b>${product.p_sell_price}원<b><br>장바구니담기</a>
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="container" align="center">
<h4 class="text-primary"><b>상품상세설명</b></h4>
	<div class="vf-card" height=100px style="border-style: double; border-color: gray; border-radius: 10px;">
	${product.p_detail }
	</div>
</div>
<br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
<script src="${path}/js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script>
	// 구매 수량 버튼 
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

</script>
<script>
    // 장바구니 추가 버튼
	$(document).ready(function(){
				
		$(".cart_btn").click(function(){
			var p_no = ${product.p_no};
			var cart_qty = $(".cart_qty").val();
			
			$.post("cartInsert.do",{ p_no : p_no, cart_qty : cart_qty},function(result){
			       if(result.trim() == 'success'){
			           var check = confirm("장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?");
					   if(check) { 
						  location.assign("cartList.do?");
						}else{
						  return false;
						}
			        }else if(result.trim() == 'existed'){
			            alert("이미 장바구니에 등록된 상품입니다.");
			        }
			}); // post() end
		});					
	});

	// 상품사진 슬라이스 부분
	var galleryTop = new Swiper('.gallery-top', {
    	spaceBetween: 10,   //슬라이드 간격
        pagination: {   //페이징 사용자 설정
        	el: ".pagination_bullet",   //페이징 태그 클래스 설정 
            clickable: true,    //버튼 클릭 여부
            type : 'bullets',   //페이징 타입 설정(종류: bullets, fraction, progressbar)   
            // Bullet Numbering 설정
        	renderBullet: function (index, className) {
        		return '<span class="' + className + '">' + (index + 1) + "</span>";
        	},
		},
    });

    //progress Bar
	var pagingSwiper = new Swiper(".gallery-top", {
		pagination: {
			el: ".pagination_progress",
			type: "progressbar",
		},
	});

    //Main Swiper로 progress Bar 제어
    galleryTop.controller.control = pagingSwiper;
</script>