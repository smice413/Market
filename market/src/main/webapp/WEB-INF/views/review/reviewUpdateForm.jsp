<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 내용 수정</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container" align="center">
<h3 style="font-weight: bold;">리뷰 수정</h3>

<div class="vf-wide700-card">
<form action="reviewUpdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="m_email" value=${m_email }>
<input type="hidden" name="r_no" value=${review.r_no }>

	<table class="table">
		<tr>
			<td>상품명</td>
			<td>${product.p_name }</td>
		</tr>
		<tr>
			<td>제 목</td>
			<td><input type="text" name="r_title" size="50" value="${review.r_title }"></td>
		</tr>
		<tr>
			<td>별 점</td>
			<td>
			<div>
				<select id="r_star" name="r_star">
					<option value="">선택하세요</option>
					<option value="0" <c:if test="${review.r_star == 0}"> selected </c:if>>☆☆☆☆☆</option>
					<option value="1" <c:if test="${review.r_star == 1}"> selected </c:if>>★☆☆☆☆</option>
					<option value="2" <c:if test="${review.r_star == 2}"> selected </c:if>>★★☆☆☆</option>
					<option value="3" <c:if test="${review.r_star == 3}"> selected </c:if>>★★★☆☆</option>
					<option value="4" <c:if test="${review.r_star == 4}"> selected </c:if>>★★★★☆</option>
					<option value="5" <c:if test="${review.r_star == 5}"> selected </c:if>>★★★★★</option>
				</select>	
			</div>
			</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>
				<textarea id="r_content" name="r_content" rows="10" cols="50">${review.r_content }</textarea>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<%-- <c:if test="${review.r_img != null }">
					<input type="hidden" name="old_img" value="${review.r_img }">
					<div>${img }</div>
					<font size=1 color=blue>새로운 파일을 선택하시면 예전 파일은 자동으로 삭제됩니다.</font>
				</c:if> --%>
				<input type="file" class="btn" id="review_img" name="review_img" accept="image/*" multiple />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" class="btn btn-success" value="수정">
				<input type="button" class="btn btn-outline-success" value="취소"
				onclick="location='reviewDetail.do?r_no=${review.r_no}&p_no=${review.p_no }'">
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>