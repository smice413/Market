<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container" align="center">
<h3 style="font-weight: bold;">상품 리뷰</h3>

<div class="vf-wide700-card">
<form action="reviewInsert.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="p_no" value=${product.p_no }>
<input type="hidden" name="m_email" value=${m_email }>
	<table class="table">
		<tr>
			<td>상품명</td>
			<td>${product.p_name }</td>
		</tr>
		<tr>
			<td>제 목</td>
			<td><input type="text" name="r_title" size="50"></td>
		</tr>
		<tr>
			<td>별 점</td>
			<td>
			<div>
				<select id="r_star" name="r_star">
					<option value="">선택하세요</option>
					<option value="0">☆☆☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select>	
			</div>
			</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>
				<textarea id="r_content" name="r_content" rows="10" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<input type="file" class="btn" id="review_img" name="review_img" accept="image/*" multiple />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="등록">
				<input type="button" value="취소">
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>