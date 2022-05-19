<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/viewConfiguration.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
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
	<div style="text-align: center;">
	<h3 class="page-header">주문/결제</h3>

		<!-- 주문 상품 정보 -->
		<table class="table orderProduct_table">
			<thead>
				<tr>
					<th></th>
					<th>상품정보</th>
					<th>판매자</th>
					<th>수량</th>
					<th>상품금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
		<!-- 회원 정보 -->
		<table class="member_table" style="width:100%;margin-top:50px;">
			<tr>
				<td colspan="2"><h3>주문자 정보</h3></td>
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
				<td colspan="2"><label style="font-size:22px; margin-left:20px;">배송 정보</label></td>
			</tr>
			<tr  style="border-top:3px solid;border-top-color:#dddddd;">
				<td style="width:230px;"><label style="margin-left:20px;">배송지 선택</label></td>
				<td>
					<input type="radio" name="address" value="default_Address" checked="checked"> 기본배송지
					<input type="radio" name="address" value="new_Address" style="margin-left:20px;"> 신규배송지
					<button type="button" class="deliveryList_btn btn btn-outline-success" style="margin-left:10px;">배송지 목록</button>
				</td>
			</tr>
			<tr>
				<td><div class="form-group" style="margin-left:20px;margin-top:10px;">
				   	<label>요청사항</label></td> 
				<td><input type="text" class="form-control" id="d_msg" placeholder="배송 관련 요청사항을 입력하세요.">
				</div></td>
			</tr>
		</table>
		
		<div>
			<div>
				<button class="address_btn address_btn_1" onClick="showAdress('1')" style="background-color: #3c3838;color:#fff;border-color:#fff">기본 주소</button>
				<button class="address_btn address_btn_2" onClick="showAdress('2')"style="color:#fff;border-color:#fff;">직접 입력</button>
			</div>
			<div>
				<div class="addressInfo_input_div addressInfo_input_div_1" style="display:block;">
 				<table>
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${deliveryInfo.d_name}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${deliveryInfo.d_tel}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>(${deliveryInfo.d_post}) ${deliveryInfo.d_address}</td>
				 		</tr>
				 	</tbody>
				 </table>		
				</div>
				<div class="addressInfo_input_div addressInfo_input_div_2">
			      <table>
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>이름</th>
							<td><input class="d_name_input"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="d_tel_input"></td>
				 		</tr>
						<tr>
							<th>주소</th>
							<td>
								<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
								<input class="address2_input" readonly="readonly">
								<input class="address3_input" readonly="readonly">
							</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		
		<!-- 쿠폰 정보 -->
		<table class="coupon_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="2"><label style="font-size:22px; margin-left:20px;">쿠폰</label></td>
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
		<table class="price_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="1"><label style="font-size:22px; margin-left:20px;">결제 금액</label></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td><label style="margin-left:20px;margin-top:20px;">주문 금액</label></td>
	            <td></td>		
			</tr>
		    <tr>
				<td><label style="margin-left:20px;">배송비</label></td>
				<td>주문금액</td>
		    </tr>
		    <tr>
				<td><label style="margin-left:20px;">쿠폰할인금액</label></td>
				<td>주문금액</td>
		    </tr>
		    <tr>
				<td><label style="margin-left:20px;">최종결제금액</label></td>
				<td>주문금액</td>
		    </tr>
		</table>
		
		<table class="payment_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="2"><label style="font-size:22px; margin-left:20px;">결제 수단</label></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td rowspan="2"><div style="margin-left:20px;margin-top:20px;"><label>결제수단 선택</label></div></td>
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

//주소입력란 버튼 동작(숨김, 등장) 
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#FFC107');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#218838');	
}
</script>

</body>
</html>