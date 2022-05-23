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
<!-- 다음주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(".post_btn").on("click", function(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
});    
    
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('d_post').value = data.zonecode;
                document.getElementById('addr1').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>



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
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td style="width:230px;"><label style="margin-left:20px;">배송지 선택</label></td>
				<td class="address_info_td">
					<input type="radio" name="address" onClick="showAdress('1')" value="default_Address" checked="checked"> 기본배송지
					<input type="radio" name="address" onClick="showAdress('2')" value="new_Address" style="margin-left:20px;"> 신규배송지
					<button type="button" class="deliveryList_btn btn btn-success" style="margin-left:10px;margin-top:5px;margin-bottom:5px">배송지 목록</button>
				</td>
			</tr>
		</table>
		     <!-- 기본 배송지 -->
				<div class="addressInfo_input_div addressInfo_input_div_1" style="display:block;">
 				<table>
					<colgroup>
						<col width="230px">
						<col width="*">
					</colgroup>
					<form method="post" action="addressUpdate.do">
					<input type="hidden" name="d_no" value="${deliveryInfo.d_no}">
					<tbody>
						<tr>
							<th><label style="margin-left:20px; margin-top:10px;">구분</label></th>
							<td>
							<input class="d_cate_input form-control" name="d_cate" value="${deliveryInfo.d_cate}">
							<div style="font-size:13px; color:#218838;margin-top:5px;margin-bottom:5px;">※ 집, 회사, 기타 등등 </div>
							</td>
						</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;" >이름</label></th>
							<td><input class="d_name_input form-control" value="${deliveryInfo.d_name}" style="margin-bottom:10px;" name="d_name"></td>
						</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">전화번호</label></th>
							<td>
								<input class="d_tel_input form-control" value="${deliveryInfo.d_tel}" style="margin-bottom:10px;" name="d_tel">
								<div style="font-size:13px; color:#218838;margin-top:5px;margin-bottom:5px;">※ '-'는 제외하고 입력하세요.</div>
							</td>
				 		</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">우편번호</label></th>
							<td>
							  <div style="display:flex;"> 
								<input class="post_input form-control" value="${deliveryInfo.d_post}" name="d_post" id="post_input" size="5" readonly style="width:100px;margin-bottom:10px;"">
							    <button type="button" class="post_btn btn btn-outline-success " onclick="openDaumPostcode()" style="margin-bottom:10px;margin-left:5px;">우편번호검색</button>
							  </div>
							</td>
						</tr>	
						<tr>
							<td><label style="margin-left:20px;margin-top:10px;">주소</label></td>
							<td>		
								<input class="addr1 form-control" value="${deliveryInfo.d_address}" name="d_address" id="d_address" size="50" readonly ><br>
								<div style="display:flex;">	
									<input class="addr2 form-control" value="${deliveryInfo.d_detail_address}" name="d_detail_address" id="d_detail_address" size="37" >
									<input type="submit" class="Update_btn btn btn-success" style="margin-left:5px;" value="수정">
								</div>
							</td>
						</tr>
						</form>
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
				
			<!-- 신규 배송지 -->	
				<div class="addressInfo_input_div addressInfo_input_div_2" style="display:none;">
			      <table>
					<colgroup>
						<col width="230px">
						<col width="*">
					</colgroup>
					<tbody>
						<form method="post" action="deliveryInsert.do">
						<tr>
							<th><label style="margin-left:20px; margin-top:10px;">구분</label></th>
							<td>
							<input class="d_cate_input form-control" name="d_cate" >
							<div style="font-size:13px; color:#218838;margin-top:5px;margin-bottom:5px;">※ 집, 회사, 기타 등등 </div>
							</td>
						</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">이름</label></th>
							<td><input class="d_name_input form-control" style="margin-bottom:10px;" name="d_name"></td>
						</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">전화번호</label></th>
							<td>
								<input class="d_tel_input form-control" style="margin-bottom:10px;" name="d_tel">
								<div style="font-size:13px; color:#218838;margin-top:5px;margin-bottom:5px;">※ '-'는 제외하고 입력하세요.</div>
							</td>
				 		</tr>
						<tr>
							<th><label style="margin-left:20px;margin-top:10px;">우편번호</label></th>
							<td>
							  <div style="display:flex;"> 
								<input class="d_post_input form-control" name="d_post" id="d_post" size="5" readonly style="width:100px;margin-bottom:10px;">
							    <button type="button" class="post_btn btn btn-outline-success " onclick="openDaumPostcode()" style="margin-bottom:10px;margin-left:5px;">우편번호검색</button>
							  </div>
							</td>
						</tr>	
						<tr>
							<td><label style="margin-left:20px;margin-top:10px;">주소</label></td>
							<td>
								<input class="d_address form-control" name="d_address" id="addr1" size="50" readonly ><br>
								<div style="display:flex;">	
									<input class="d_detail_address form-control" name="d_detail_address" id="addr2" size="37" >
									<button class="deliveryInsert_btn btn btn-success" style="margin-left:5px;">등록</button>
								</div>	
							</td>
						</tr>
						</form>
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
		<table class="price_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="1"><h3 style="margin-left:20px;">결제 금액</h3></td>
			</tr>
			<tr style="border-top:3px solid;border-top-color:#dddddd;">
				<td><label style="margin-left:20px;margin-top:20px;">주문 금액</label></td>
	            <td></td>		
			</tr>
		    <tr>
				<td><label style="margin-left:20px;">배송비</label></td>
				<td>3,000원</td>
		    </tr>
		    <tr>
				<td><label style="margin-left:20px;">쿠폰할인금액</label></td>
				<td></td>
		    </tr>
		    <tr>
				<td><label style="margin-left:20px;">최종결제금액</label></td>
				<td></td>
		    </tr>
		</table>
		
		<table class="payment_table" style="width:100%; margin-top:50px;">
			<tr>
				<td colspan="2"><h3 style="margin-left:20px;">결제 수단</h3></td>
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

	// 주소입력란 버튼 동작(숨김,등장)
	function showAdress(className){
		$(".addressInfo_input_div").css('display','none');
		$(".addressInfo_input_div_"+className).css('display','block');
	}
	
	// 배송지 목록 팝업창
	$(".deliveryList_btn").on("click",function(){
		let popUrl = "deliveryListPop.do";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"배송지 목록",popOption);
	});
	
	
	
</script>

</body>
</html>