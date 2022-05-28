<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<c:if test="${search == 's_no'}">
	<%@ include file="../common/menuShop.jsp"%>
</c:if>
<c:if test="${search != 's_no'}">
	<%@ include file="../common/menuMyPage.jsp"%>
</c:if>
<div class="container">
	<table style="width:100%; margin:0px; padding:0px; font-size:13px;">
		<tr>
			<td colspan=2 align=center><h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">Q/A</h3></td>
		</tr>
		<c:if test="${search != 's_no'}">
		<tr>
			<td>
				* 상품에 대한 문의는 확인만 가능하며, 추가문의는 해당 상품의 상세 페이지를 이용해주세요.<br>
				* 배송관련,주문(취소/교환/환불)관련 문의 및 요청사항은 오른쪽 버튼을 눌러서 문의하실 수 있습니다.
			</td>
			<td width=90px><input type='button' id="qna_btn"class='edit1 btn btn-outline-success'
				 onclick="location.href='${path}/qnaQuestionForm.do?m_email=${sessionScope.m_email }'"
						style="width:80px; height:30px; padding:2px; margin:7px;" value="문의하기"></td>
		</tr>
		</c:if>
	</table>
	<c:if test="${empty list}">
		<table width=100% height=100px class="table">
			<tr align=center>
				<td><label style="font-size:20px;" ><br><br><br>해당 상품에 따른 문의글이 없습니다.<br><br><br><br><br><br></label></td>
			</tr>
		</table> 
	</c:if>
	<c:if test="${not empty list}">
		<table class="table" style="font-size:15px; margin:0px; padding:0px; font-weight:bold; text-align: center;">
			<tr>
				<td width=100>작성일</td>
				<td width=75>문의유형</td>
				<td>제목</td>
				<td width=60>작성자</td>
				<td width=90>답변상태</td>
			</tr>
		</table>
	 	<div id="accordion">
	<!--  문의글 리스트 출력 (클릭하면 상세내용을 보여줌)   -->
		<c:forEach var="qna" items="${list}">
			<div class="card-header" style="margin:0px; padding:0px;">
				<table id="list_${qna.qna_no}" class="table" style=" font-size:15px; margin:0px;">
					<tr>
						<td width=100><fmt:formatDate value="${qna.qna_writedate }" pattern="yyyy-MM-dd"/></td>
						<td width=75>
							<c:if test="${qna.p_no != 18}">${qna.op_no != 213}<font color=blue>상품문의</font></c:if>
							<c:if test="${qna.op_no != 213}">${qna.op_no != 213}<font color=red>주문문의</font></c:if></td>
						<td id="td_${qna.qna_no}">
							<a class="card-link" data-toggle="collapse" href="#detail_${qna.qna_no}">${qna.qna_title}</a></td>
						<td width=60>${qna.m_name}</td>
						<td width=90 id="btn_${qna.qna_no}" align=center>
						
							<c:if test="${qna.qna_answer == '답변대기'}">
							
								<c:if test="${search == 's_no'}">
									<input type="button" id="qna_btn"class="edit1 btn btn-success" value="답변하기" style="width:70px; padding:3px;"
									onclick="location.href='${path}/qnaAnswerForm.do?qna_no=${qna.qna_no}'">
								</c:if>
								<c:if test="${search != 's_no'}">답변대기중</c:if>
								
							</c:if>
							<c:if test="${qna.qna_answer != '답변대기'}"><b>답변완료</b></c:if></td>
					</tr>
				</table>
		    </div>
		<!--  문의글 상세내용    -->
			<div id="detail_${qna.qna_no}" class="collapse hide" data-parent="#accordion">
		       <div class="card-body" style="margin:0px; padding:0px;">
		       	<table style="width: 100%; font-size:14px; margin:0px; background-color: #f8f8f8">
		       		<tr>
						<td style="font-size:20px; padding:9 0 0 20; width:40px; vertical-align: top;"><b></b></td>
						<td style="padding:12px;">
							<c:if test="${qna.p_no != 18}">
								<b>[${qna.p_name}]</b> <font color=blue>상품에 대한 문의글입니다.</font>
								<a href="productView.do?p_no=${qna.p_no}">>>상품 보러가기</a></c:if>
							<c:if test="${qna.op_no != 213}">
								<b>[${qna.op_no}]번</b>  <font color=red>주문상품에 대한 문의글입니다.</font>
								<a href="orderDetail.do?op_no=${qna.op_no}&o_no=${qna.o_no}">>>주문상품 확인하러 가기</a></c:if></td>
					</tr>
					<tr>
						<td style="font-size:20px; padding:9 0 0 20; width:40px; vertical-align: top;"><b>Q</b></td>
						<td style="padding:10 10 0 10;"><pre style="font-size: 15px; font-family: 'Nanum Gothic', sans-serif;">${qna.qna_question}</pre></td>
					</tr>
					<tr>
						<td style="font-size:20px; padding:9 0 0 20; width:40px; vertical-align: top;"><b>A</b></td>
						<td style="padding:0 10 0 10;"><pre style="font-size: 15px; font-family: 'Nanum Gothic', sans-serif;">${qna.qna_answer}</pre></td>
					</tr>
				</table>
		       </div>
		   	</div>
		</c:forEach>
	</div>
</c:if>
</div>
	
<br><br><br><br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
