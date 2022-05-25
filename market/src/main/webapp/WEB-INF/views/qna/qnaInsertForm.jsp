<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

	<div class="container" align="center">
		<h3 class="text-primary">상품 문의</h3>
		<div class="vf-wide700-card">
		<form action="${path}/qnaInsert.do" method="post">
			<input type="hidden" name="p_no" value="${p_no}"> 
			<input type="hidden" name="op_no" value="${op_no}">
			<input type="hidden" name="m_email" value="${m_email}">
			<input type="hidden" name="s_no" value="${s_no}">
			<table class="table">
				<tr>
					<td colspan=2>${product.p_name} 상품에 문의글을 남깁니다.</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="qna_title" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="qna_question" name="qna_question" rows="10" cols="50" required="required"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="qna_secret"> 비밀글로 문의하기</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
