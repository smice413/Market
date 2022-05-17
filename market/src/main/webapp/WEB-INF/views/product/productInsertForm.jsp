<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuShop.jsp"%>

	<div class="container" align="center">
	
		<h3 class="text-primary">상품 등록</h3>
		<div class="vf-card">
		<form action="${path}/productInsert.do" method="post">
			<input type="hidden" name="s_no" value="3"> 
<!--  		<input type="hidden" name="s_no" value="${s_no}"> -->
<!-- 아래 입력창 만들 때까지 임의의 값 부여 -->
			<input type="hidden" name="cate_no" value="22"> 
			<input type="hidden" name="p_group_buying" value="Y"> 
			<input type="hidden" name="p_group_price" value=9000> 
			<input type="hidden" name="p_follow_sale" value="Y"> 
			<input type="hidden" name="p_follow_price" value="10000"> 

			<table class="table">
				<tr>
					<td width=120px>카테고리코드</td>
					<td>select박스 들어갈 곳</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="p_name" width="400px" required="required"></td>
				</tr>
				<tr>
					<td>일반구매가격</td>
					<td><input type="text" name="p_sell_price" required="required"></td>
				</tr>
				<tr>
					<td>재고</td>
					<td><input type="text" name="p_stock" required="required"></td>
				</tr>
				<tr>
					<td>공동구매여부</td>
					<td>라디오박스 들어갈 곳-라디오박스 선택하면 가격입력창 활성화</td>
				</tr>
				<tr>
					<td>공동구매여부</td>
					<td>라디오박스 들어갈 곳-라디오박스 선택하면 가격입력창 활성화</td>
				</tr>
				<tr>
					<td>상세설명</td>
					<td><textarea rows="10" cols="30" name="p_detail" required="required"></textarea>
						<script>	// 글쓰기 editor 및 사진 업로드 기능
							CKEDITOR.replace('p_detail',{filebrowserUploadUrl:'/adm/fileUpload.do'});
						</script></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>