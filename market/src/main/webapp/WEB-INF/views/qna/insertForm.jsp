<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

	<div class="container" align="center">
		<h2 class="text-primary">게시판 글쓰기</h2>
		<div class="vf-wide700-card">
		<form action="${path}/insert.do" method="post">
			<input type="hidden" name="p_no" value="${p_no}"> 
			<input type="hidden" name="op_no" value="${op_no}">
			<input type="hidden" name="m_email" value="${m_email}">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input type="text" name="qna_title" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="qna_question" required="required"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="qna_secret">비밀글로 문의하기</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
