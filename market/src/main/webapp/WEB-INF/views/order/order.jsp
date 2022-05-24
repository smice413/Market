<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/viewConfiguration.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
<link rel="stylesheet" href="${path}/css/swiper.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>




</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>

<div class="container">
	<div style="text-align: center;">
	<h3 class="page-header">주문/결제</h3>

		<!-- 주문 상품 정보 -->
		<table class="table orderProduct_table">
			<thead>
				<tr>
					<th colspan="1"></th>
					<th>상품정보</th> 
					<th>판매자</th> 
					<th>수량</th> 
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pi" items="${productInfo}">
				<tr>
					<td align="center"><img src="${path}/upload/product/${pi.p_img}" width=100px></td>
					<td align="left">
						<div style="margin-top:30px;">
						   <b>${pi.p_name}</b> <br>
						<div style="font-size:13px;margin-top:2px;">
						<fmt:formatNumber pattern="#,###,###" value="${pi.p_sell_price}"/>&nbsp;원
						   | ${pi.s_name} 
					    </div>
						</div>
					</td>
					<td>
						<div style="margin-top:35px;">
							${pi.s_name}
						</div>
					</td>
					<td><div style="margin-top:35px;">${pi.cart_qty} 개 </div></td>
					<td>
						<div style="margin-top:35px;font-weight:bold;">	
							<fmt:formatNumber value="${pi.total_price}" pattern="#,###,### 원" />
						</div>
					</td>
					<td class="goods_table_price_td">
						<input type="hidden" class="p_sell_price_input" value="${pi.p_sell_price}">
						<input type="hidden" class="cart_qty_input" value="${pi.cart_qty}">
						<input type="hidden" class="total_price_input" value="${pi.total_price}">
						<input type="hidden" class="p_no_input" value="${pi.p_no}">
					</td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 회원 정보 -->
		<table class="member_table" style="width:100%;margin-top:50px;">
			<tr>
				<td colspan="2"><h3 style="margin-left:20px;">주문자 정보</h3></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td><div style="margin-left:20px;margin-top:20px;"><label>보내는 분</label></div></td>
				<td>${memberList.m_name}</td>
			</tr>
			<tr>
				<td><div style="margin-left:20px;margin-top:10px;"><label>전화번호</label></div></td>
				<td>${memberList.m_tel}</td>
			</tr>
			<tr>
				<td><div style="margin-left:20px;margin-top:10px;"><label>이메일</label></div></td> 
				<td>${sessionScope.m_email}</td>
			</tr>
			<tr>
				<td></td> 
				<td><div style="font-size:13px; color:#218838;">
				         이메일을 통해 주문처리 과정을 보내드립니다.<br>
				         정보 변경은 마이페이지>개인정보 수정 메뉴에서 가능합니다.</div></td>
			</tr>
		</table>
		
	
		
<!-- 배송지 정보 -->
		<table class="delivery_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="2"><h3 style="margin-left:20px;">배송 정보</h3></td>
			</tr>
		</table>
		     <!-- 기본 배송지 -->
				<div class="addressInfo_input_div addressInfo_input_div_1" style="display:block;">
 				<table>
					<colgroup>
						<col width="230px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th><label style="margin-left:20px; margin-top:10px;" >구분</label></th>
							<td>
								<div style="display:flex;">
									<input class="d_cate_input form-control" name="d_cate" value="${deliveryInfo.d_cate}" readonly>
									<button type="button" class="deliveryList_btn btn btn-success" 
					       			 style="margin-left:10px;">배송지 목록</button>
					       	    </div>
								<div style="font-size:13px; color:#218838;margin-top:5px;margin-bottom:5px;">
									※ 집, 회사, 기타 등등 
								</div>
							</td>
						</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;" >이름</label></th>
							<td><input class="d_name_input form-control" value="${deliveryInfo.d_name}" 
							           style="margin-bottom:10px;" name="d_name" readonly></td>
						</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">전화번호</label></th>
							<td>
								<input class="d_tel_input form-control" value="${deliveryInfo.d_tel}" 
								       style="margin-bottom:10px;" name="d_tel" readonly>
								<div style="font-size:13px; color:#218838;margin-top:5px;margin-bottom:5px;">
								      ※ '-'는 제외하고 입력하세요.</div>
							</td>
				 		</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">우편번호</label></th>
							<td>
								<input class="post_input form-control" value="${deliveryInfo.d_post}" readonly
								       name="d_post" id="d_post" size="5" readonly style="width:100px;margin-bottom:10px;">
							</td>
						</tr>	
						<tr>
							<td><label style="margin-left:20px;margin-top:10px;">주소</label></td>
							<td>		
								<input class="addr1 form-control" value="${deliveryInfo.d_address}" 
								        name="d_address" id="d_address" size="50" readonly ><br>
								<div style="display:flex;">	
									<input class="addr2 form-control" value="${deliveryInfo.d_detail_address}" 
									        name="d_detail_address" id="d_detail_address"readonly>
								</div>
							</td>
						</tr>
				 		<tr>
							<td><div class="form-group" style="margin-left:20px;margin-top:10px;">
							   	<label>요청사항</label>
							</td>
							<td>
								<input type="text" class="form-control" id="d_msg" placeholder="배송 관련 요청사항을 입력하세요."></div>
							</td>
						</tr>
				 	</tbody>
				 </table>		
				</div>
				
			
		
		<!-- 쿠폰 정보 -->
		<table class="coupon_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="2"><h3 style="margin-left:20px;">쿠폰</h3></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td><div style="margin-left:20px;margin-top:20px;"><label>쿠폰 적용</label></div></td>
				<td>
					<select style="margin-top:20px;">
						<option value="">쿠폰선택</option>
					</select>
				</td>
			</tr>
		</table>
		
		<!-- 주문 종합 정보 -->
	  <div class="total_info_div">
		<div class="total_info_price_div">
		<table class="price_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="1"><h3 style="margin-left:20px;">결제 금액</h3></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td><label style="margin-left:20px;margin-top:20px;">주문 금액</label></td>
	            <td><span class="totalPrice_span"></span></td>		
			</tr>
		    <tr>
				<td><label style="margin-left:20px;">배송비</label></td>
				<td><span class="delivery_price_span"></span></td>
		    </tr>
		    <tr>
				<td><label style="margin-left:20px;">쿠폰할인금액</label></td>
				<td></td>
		    </tr>
		    <tr>
				<td><label style="margin-left:20px;">최종결제금액</label></td>
				<td><span class="finalTotalPrice_span"></span></td>
		    </tr>
		</table>
		</div>
	  </div>	
		
		<table class="payment_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="2"><h3 style="margin-left:20px;">결제 수단</h3></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td rowspan="2"><div style="margin-left:20px;margin-top:20px;">
				  <label>결제수단 선택</label></div></td>
				<td>
					<div class="box">카카오페이</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>신용카드</div>
				</td>
		    </tr>
		</table>
		
		<div style="margin-top:50px; margin-bottom:100px;margin-top:50px;">
			<button class="btn btn-success">결제하기</button>
		</div>
	</div>
</div>


<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

<script>
	
	// 배송지 목록 팝업창
	$(".deliveryList_btn").on("click",function(){
		let popUrl = "deliveryListPop.do";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"배송지 목록",popOption);
	});

</script>

</body>
</html>