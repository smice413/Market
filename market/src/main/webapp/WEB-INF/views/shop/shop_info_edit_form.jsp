<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점 정보 수정</title>

<script src="<%=request.getContextPath()%>/js/shop.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//우편번호, 주소 Daum API
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('s_post').value = data.zonecode;
			document.getElementById('s_address').value = data.address;				
		}
	}).open();
}
</script>
<script>
 // 단일 파일 업로드
 function readImage(input) {
    if (input.files && input.files[0]) {
      //  const reader = new FileReader();
        var reader = new FileReader();
        
        reader.onload = function(e) {
           $('#previewImage').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
} 


</script>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuShop.jsp"%>
<div class="shopcontainer">
		<form id="shop_info_edit" name="shop_info_edit" method="post"
			action="shop_info_edit.do" enctype="multipart/form-data"
			onSubmit="return Check()">
			<!--  <input type="hidden" id="s_status" name="s_status" value="1"> -->
			<input type="hidden" id="s_seckey" name="s_seckey" value="1111">
			<input type="hidden" id="s_passwd" name="s_passwd" value="${shop.s_passwd}">
			<table border="1">
				<tr>
					<td>email</td>
					<td>
					${shop.s_email}
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" id="s_passwd1" name="s_passwd1"></td>
				</tr>
				<tr>
					<td>상호명</td>
					<td><input type="text" id="s_name" name="s_name" value="${shop.s_name}"></td>
				</tr>
				<tr>
					<td>대표자명</td>
					<td><input type="text" id="s_ceo" name="s_ceo" value="${shop.s_ceo}"></td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td><input type="text" id="s_bizno" name="s_bizno" value="${shop.s_bizno}"></td>
				</tr>
				<tr>
					<td>통신판매업번호</td>
					<td><input type="text" id="s_tongsin" name="s_tongsin" value="${shop.s_tongsin}"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="s_post" name="s_post" value="${shop.s_post}"> <input
						type="button" value="우편번호검색" onclick="openDaumPostcode()" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="s_address" name="s_address" value="${shop.s_address}"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="s_tel" name="s_tel" value="${shop.s_tel}"></td>
				</tr>
				<tr>
					<td>은행명</td>
					<td><input type="text" id="s_bank" name="s_bank" value="${shop.s_bank}"></td>
				</tr>
				<tr>
					<td>정산계좌</td>
					<td><input type="text" id="s_account" name="s_account" value="${shop.s_account}"></td>
				</tr>
				<tr>
					<td>서류첨부</td>
					<td>
						<!-- <input type="file" id="s_file" name="s_file1" > -->
						<!-- <input  type="file" id="s_file" name="s_file1" class="form-control" onChange="readImage(this)" multiple="multiple"/> -->
					    <input type="file" id="s_file" name="s_file1" value="${shop.s_file1}" class="form-control" onChange="readImage(this)"/>
			            <img style="width: 200px;" id="previewImage" src="#">
			            
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" id="submit" value="상점정보수정"></td>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>