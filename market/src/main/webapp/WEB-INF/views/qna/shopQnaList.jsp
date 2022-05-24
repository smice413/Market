<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#qna_btn').click(function() {
			$('#slist').load('${path}/qna/insertForm.do');
		});
	});
	function up(id) {
		var replytext = $('#tt_'+id).val();
		var formData = "rno="+id+'&replytext='+replytext
			+"&bno=${board.num}";
		$.post('${path}/repUpdate.do',formData, function(data) {
			$('#slist').html(data);
		});
	}
	function lst() {
		$('#slist').load('${path}/qna/insertForm.do');
	}
	function del(rno,bno) {
		var formData="rno="+rno+"&bno="+bno;
		$.post("${path}/repDelete.do",formData, function(data) {
			$('#slist').html(data);
		});
	}
</script>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuShop.jsp"%>
	<div class="container">
		<table style="width:100%; margin:0px; padding:0px; font-size:13px;" align=left>
			<tr>
				<td><h4><b>PRODUCT Q&A</b></h4></td>
				<td width=90px><input type='button' id="qna_btn"class='edit1 btn btn-outline-success' onclick='lst()' 
							style="width:80px; height:30px; padding:2px; margin:7px;" value="상품문의"></td>
			</tr>
			<tr>
				<td colspan=2>
					* 상품에 대한 문의를 남기는 공간입니다.<br>
					* 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 <a href="myPage.do">1:1문의</a>에 남겨주세요
				</td>
			</tr>
		</table>
		<table class="table" style="font-size:14px; margin:0px; padding:0px;">
			<tr align=center>
				<td width=45>번호</td>
				<td width=95>문의 유형</td>
				<td>제목</td>
				<td width=65>작성자</td>
				<td width=110>작성일</td>
				<td width=95>답변상태</td>
			</tr>
		</table>
	 	<div id="accordion">
<!--  문의글 리스트 출력 (클릭하면 상세내용을 보여줌)   -->
		<c:forEach var="qna" items="${list}">
			<div class="card-header" style="margin:0px; padding:0px;">
				<table id="list_${qna.qna_no}" class="table" style=" font-size:15px; margin:0px;">
					<tr style="padding:10px;">
						<td width=45>${qna.qna_no}</td>
						<td width=95><c:if test="${qna.p_no != 0}"><font color=blue>상품문의</font></c:if>
							<c:if test="${qna.op_no != 0}"><font color=red>주문문의</font></c:if></td>
						<td id="td_${qna.qna_no}">
							<a class="card-link" data-toggle="collapse" href="#detail_${qna.qna_no}">
							${qna.qna_title}</td>
						<td width=65>${qna.m_name}</td>
						<td width=110><fmt:formatDate value="${qna.qna_writedate }" pattern="yyyy-MM-dd"/></td>
						<td width=95 id="btn_${qna.qna_no}">
						<c:if test="${empty qna.qna_answer}">
							<input type='button' id="qna_btn"class='edit1 btn btn-success' onclick='lst()' 
							 value="답글달기"></c:if>
							<c:if test="${not empty qna.qna_answer}"><b>답변완료</b></c:if></td>
					</tr>
				</table>
		    		</div>
		<!--  문의글 상세내용    -->
			<div id="detail_${qna.qna_no}" class="collapse hide" data-parent="#accordion">
		       <div class="card-body" style="margin:0px; padding:0px;">
		       	<table style="width: 100%; font-size:14px; margin:0px; background-color: #f3f3f3">
		       		<tr>
						<td style="font-size:20px; padding:9 0 0 20; width:40px; vertical-align: top;"><b></b></td>
						<td style="padding:12px;">
							<c:if test="${qna.p_no != 0}"><font color=blue>${qna.p_name} 상품에 대한 문의글입니다.</font>
								<a href="productView.do?p_no=${qna.p_no}">>>상품 보러가기</a></c:if>
							<c:if test="${qna.op_no != 0}"><font color=red>주문번호 :${qna.op_no} 주문건에 대한 문의글입니다.</font></c:if></td>
					</tr>
					<tr>
						<td style="font-size:20px; padding:9 0 0 20; width:40px; vertical-align: top;"><b>Q</b></td>
						<td style="padding:12px;">${qna.qna_question}<br>
						${qna.qna_question}${qna.qna_question}${qna.qna_question}${qna.qna_question}<br>
						${qna.qna_question}${qna.qna_question}${qna.qna_question}${qna.qna_question}<br></td>
					</tr>
				<c:if test="${empty qna.qna_answer }">
					<tr>
						<td style="font-size:20px; padding:9 0 0 20; width:40px; vertical-align: top;"><b>A</b></td>
						<td style="padding:12px;">${qna.qna_question}${qna.qna_question}${qna.qna_answer}</td>
					</tr>
				</c:if>
				</table>
		       </div>
		   	</div>
		</c:forEach>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>