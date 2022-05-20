<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<%-- <script src="${path }/ckeditor/ckeditor.js"></script>  --%>
<script>
$(function(){
	
	$("#sel1").hide();
	$("input[name='p_group_price']").attr('value',0);
	$("#sel3").hide();
	$("input[name='p_follow_price']").attr('value',0);
	
	$("input[name='p_group_buying']:radio").change(function(){
		var c = this.value;
		if(c == 'N'){
			$("#sel1").hide();
			$("#sel2").show();
		}else{
			$("#sel1").show();
			$("#sel2").hide();
		}
	});
	
	$("input[name='p_follow_sale']:radio").change(function(){
		var d = this.value;
		if(d == 'N'){
			$("#sel3").hide();
			$("#sel4").show();
		}else{
			$("#sel3").show();
			$("#sel4").hide();
		}
	});
	
});

</script>

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
 			<!-- <input type="hidden" name="cate_no" value="22">  -->
			<!-- <input type="hidden" name="p_group_buying" value="Y">  -->
			<!-- <input type="hidden" name="p_group_price" value=0>  -->
			<!-- <input type="hidden" name="p_follow_sale" value="Y"> --> 
			<!-- <input type="hidden" name="p_follow_price" value=0> -->
			
			<table class="table">
				<tr>
					<td width=130px>카테고리코드</td>
					<td>
						<select id="cate_no" name="cate_no" style="width:180px; height:30px">
							<c:forEach var="c" items="${listCateNo}">
								<option value="${c.cate_no}">${c.cate_large}/${c.cate_small}</option>
							</c:forEach>
						</select>
					</td>
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
					<td>
						<input type="radio" name="p_group_buying" value="Y">Y
						<input type="radio" name="p_group_buying" value="N" checked="checked">N
					</td>
				</tr>
				<tr>
					<td>공동구매가</td>
					<td>
						<div id= "sel1">
							<input type="text" name="p_group_price" required="required">
						</div>
						<div id = "sel2" style="font-family:나눔고딕; font-size:12; color:darkred">
							※공동구매가는 공동구매여부가 'Y'일 경우에만 입력가능합니다.
						</div>	
					</td>
				</tr>
				<tr>
					<td>팔로워할인여부</td>
					<td>
						<input type="radio" name="p_follow_sale" value="Y">Y
						<input type="radio" name="p_follow_sale" value="N" checked="checked">N
					</td>
				</tr>
				<tr>
					<td>팔로워할인가</td>
					<td>
						<div id= "sel3">
							<input type="text" name="p_follow_price" required="required">
						</div>
						<div id = "sel4" style="font-family:나눔고딕; font-size:12; color:darkred">
							※팔로워할인가는 팔로워할인여부가 'Y'일 경우에만 입력가능합니다.
						</div>
					</td>
				</tr>
				<tr>
					<td>상세설명</td>
					<td><textarea rows="5" cols="30" name="p_detail"	required="required"></textarea>
						<script>	// 글쓰기 editor 및 사진 업로드 기능
							CKEDITOR.replace('p_detail',{filebrowserUploadUrl:'${path}/market/fileUpload.do'});
						</script>
					</td>
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