<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>

<!-- <script>
function Click(){


$.ajax({
    type:"POST",
    url:"reviewCheck.do",
    data: {"email":email},        
    success: function (data) { 
    	//alert("return success="+data);
  	  if(data==1){	//중복 ID
  		var newtext='<font color="red">중복 email입니다.</font>';
  			$("#emailcheck").text('');
    		$("#emailcheck").show();
    		$("#emailcheck").append(newtext);
      		$("#s_email").val('').focus();
      		$("#submit").attr("disabled", true);
      		return false;
     
  	  }else{	//사용 가능한 ID
  		var newtext='<font color="blue">사용가능한 email입니다.</font>';
  		$("#emailcheck").text('');
  		$("#emailcheck").show();
  		$("#emailcheck").append(newtext);
  		$("#s_passwd").focus();
  		$("#submit").attr("disabled", false);
  	  }  	    	  
    }
    ,
	  error:function(e){
		  alert("data error"+e);
	  }
  });//$.ajax	
}
</script> -->
</head>
<body>

<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

<div class="container" align="center">

<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;" >주문 내역</h3>

<div class="vf-wide700-card" style="width: 950px;">	

<table align="center" class="table">
	<tr>
		<th style="text-align: center;">주문번호</th>
		<th style="text-align: center;">상품명</th>
		<th style="text-align: center;">가격</th>
		<th style="text-align: center;">수량</th>
		<th colspan="2" style="text-align: center;">주문상태</th>
	</tr>
	
<c:forEach var="list" items="${orderList }">
	<tr>
		<td style="text-align: center;">
		<a href="orderDetail.do?op_no=${list.op_no}&o_no=${list.o_no}">
			<fmt:formatDate value="${list.o_date }" pattern="yyMMdd"/> - 
			<fmt:formatNumber value="${list.o_no }" pattern="#####" minIntegerDigits="5"/>
		</a>
		</td>
		
		<td style="text-align: center;"><a href="productView.do?p_no=${list.p_no}">${list.p_name}</a></td>
		
		<td style="text-align: center;"><fmt:formatNumber value="${list.op_price * list.op_qty }" pattern="#,###"/> 원</td>
		
		<td style="text-align: center;">${list.op_qty }</td>
		
		<td style="text-align: center; font-weight: bold;">
			<c:if test="${list.op_status == '1' }">공동구매대기</c:if>
			<c:if test="${list.op_status == '2' }">공동구매실패</c:if>
			<c:if test="${list.op_status == '3' }">배송전 </c:if>
			<c:if test="${list.op_status == '4' }">주문취소</c:if>
			<c:if test="${list.op_status == '5' }">품절취소</c:if>
			<c:if test="${list.op_status == '6' }">출고완료</c:if>
			<c:if test="${list.op_status == '7' }">배송완료 </c:if>
			<c:if test="${list.op_status == '8' }">환불요청중</c:if>
			<c:if test="${list.op_status == '9' }">환불거부</c:if>
			<c:if test="${list.op_status == '10' }">환불완료</c:if>
			<c:if test="${list.op_status == '11' }">거래완료</c:if>
		</td>
		<td>
			<c:if test="${list.op_status == '3' }">
				<input type="button" class="btn btn-success" value="주문 취소" onClick="location='cancel.do?op_no=${list.op_no}'">
			</c:if>
			<c:if test="${list.op_status == '6' }">
				${list.op_deli_no }
			</c:if>
			<c:if test="${list.op_status == '7' }">
				<input type="button" class="btn btn-success" value="구매 확정" 
				onClick="location='confirm.do?op_no=${list.op_no}&s_no=${list.s_no }'">
				<input type="button" class="btn btn-outline-success" value="리뷰 작성" 
				onclick="location='reviewForm.do?p_no=${list.p_no}'">
				<input type="button" class="btn btn-outline-success" value="환불 요청" 
				onClick="location='refund.do?op_no=${list.op_no}'">
			</c:if>
		</td>
	</tr>
</c:forEach>
</table>
</div>
</div>

<div class="container" align="center">
<ul class="pagination">
			
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<li><a href="${path }/orderList.do?pageNum=${pp.startPage - 1}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<li <c:if test="${pp.currentPage == i}">class="active"</c:if>><a
				href="${path }/orderList.do?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<li><a href="${path }/orderList.do?pageNum=${pp.endPage + 1}">다음</a></li>
		</c:if>
		 
</ul>
</div>

</body>
</html>