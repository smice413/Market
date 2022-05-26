<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

	<div class="container" align="center">
		<h3 class="text-primary">상품 문의</h3>
		<div class="vf-wide700-card">
		<form action="${path}/qnaInsert.do" method="post">
			<input type="hidden" name="p_no" value="${product.p_no}">
			<input type="hidden" name="op_no" value="72">
			<input type="hidden" name="m_email" value="${sessionScope.m_email }">
			<input type="hidden" name="qna_answer" value="답변대기">		
			<input type="hidden" name="s_no" value="${product.s_no}">
			<table class="table">
				<tr>
					<td>상품</td>
					<td>[${product.s_name}] ${product.p_name}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input class="form-control" type="text" size=40 name="qna_title" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" id="qna_question" name="qna_question" rows="10" cols="50" required="required"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="qna_secret" value="Y"> 비밀글로 문의하기</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
<!-- <script type="text/javascript">
$(function() {

	$('#repInsert').click(function() {

//		var frmData = $('form').serialize();
		console.log(frmData);
		var frmData = 'p_no='+frm.p_no.value
					+'&op_no='+frm.op_no.value
					+'&m_email='+frm.m_email.value			  
					+'&qna_answer='+frm.qna_answer.value			  
					+'&s_no='+frm.s_no.value			  
					+'&qna_title='+frm.qna_title.value			  
					+'&qna_question='+frm.qna_question.value			  
					+'&qna_secret='+frm.qna_secret.value;	  
		$.post('${path}/qnaInsert.do', frmData, function(data) {
			$('#slist').html(data);
		});
		
	});
});
function del(rno,bno) {
	var formData="rno="+rno+"&bno="+bno;
	$.post("${path}/repDelete.do",formData, function(data) {
		$('#slist').html(data);
	});
}
</script> -->