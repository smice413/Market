<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

	<div class="container" align="center">
		<h3 class="text-primary">상품 문의</h3>
		<div class="vf-wide700-card">
		<form id="insert_form" method="post">
			<input type="hidden" name="p_no" value="${product.p_no}">
			<input type="hidden" name="op_no" value="213">
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
					<td colspan="2" align="center">
					<input type="submit" value="확인" class="insert_btn btn btn-success"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
<script type="text/javascript">
/*  function qnaInsert(){
	 alert($('#insert_form').serialize());
	console.log("test");
  	var formData = new FormData($("form")[0]);
 	
	formData.append("p_no", insert_form.p_no.value);
	formData.append("op_no", insert_form.op_no.value);
	formData.append("m_email", insert_form.m_email.value);
	formData.set("qna_title", insert_form.qna_title.value);
	formData.set("qna_question", insert_form.qna_question.value);
	formData.set("qna_answer", insert_form.qna_answer.value);
	formData.set("qna_secret", insert_form.qna_secret.value);
	formData.append("s_no", insert_form.s_no.value);

 var formData = $('#insert_form').serialize();
	alert(formData.get("p_no") +":"+ insert_form.p_no.value);
	alert(formData.get("op_no") +":"+ insert_form.op_no.value);
	alert(formData.get("m_email") +":"+ insert_form.m_email.value);
	alert(formData.get("qna_title") +":"+ insert_form.qna_title.value);
	alert(formData.get("qna_question") +":"+ insert_form.qna_question.value);
	alert(formData.get("qna_answer") +":"+ insert_form.qna_answer.value);
	alert(formData.get("qna_secret") +":"+ insert_form.qna_secret.value);
	alert(formData.get("s_no") +":"+ insert_form.s_no.value);
	
	
 	$.post('${path}/qnaInsert.do',formData, function(data) {
		$('#slist').html(data); 
		
	});
 	return false;
};	 */	

 $(function() {

	$(".insert_btn").click(function() {
		
		alert($('#insert_form').serialize());
		var formData = $('#insert_form').serialize();
	 	$.post('${path}/qnaInsert.do', formData, function(data) {
			$('#slist').html(data); 
		});		
	 	
	}); 

}); 
</script>