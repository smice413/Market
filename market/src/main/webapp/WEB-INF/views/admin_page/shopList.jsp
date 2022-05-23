<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입점신청내역</title>
<script>

function shopList_check(){
    var arr = new Array();
    $("input:checkbox[name=s_email]:checked").each(function() {
    	arr.push($(this).val());
    	
    });
   
    if(arr == null || arr.length == 0){
        alert("입점 승인할 항목을 선택해주세요.");
        return false;
    }
    
    var checkalert = confirm("승인하시겠습니까?");
    if(checkalert){
    	
    	 alert(arr);
        $.ajax({
            type: "POST",
        	url: "shopList_check.do",
            data: {"arr": arr },
            //dataType: "json",
            //contentType:"application/json; charset=utf-8", 
            success: function(data){
               // alert(data);
                if(data==1){
                	alert("입점 승인이 되었습니다.");
               	 	location.href="shopList.do";
                }
            },error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }


           // ,error: function(e){alert("서버통신 오류"+e);}
        });
    }
	
}

</script>



</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuAdmin.jsp"%>
<!-- <form method="post" onSubmit="return shopList_del()"> -->
<table border="1" align="center">
		<tr>
			<th>선택</th>
			<th>email</th>
			<th>상호명</th>
			<th>대표자명</th>
			<th>사업자번호</th>
			<th>통신판매업번호</th>
			<th>서류첨부</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>은행명</th>
			<th>정산계좌</th>
			<th>가입일</th>
			<th>상태</th>
		</tr>
	<c:forEach var="shop" items="${shoplist}">
		
		<tr>
			<td>
		    <input type="checkbox" id="checkbox" name="s_email" value="${shop.s_email}">
		    </td>
		 	<td>${shop.s_email}</td>
		 	<td>${shop.s_name}</td>
		 	<td>${shop.s_ceo}</td>
		 	<td>${shop.s_tongsin}</td>
		 	<td>${shop.s_bizno}</td>
		 	<td>${shop.s_file}</td>
		 	<td>${shop.s_post}</td>
		 	<td>${shop.s_address}</td>
		 	<td>${shop.s_tel}</td>
		 	<td>${shop.s_bank}</td>
		 	<td>${shop.s_account}</td>
		 	<td>
		 	<fmt:formatDate value="${shop.s_regdate}" pattern="yy-MM-dd"/>
		 	</td>
		 	<td>${shop.s_status}</td>
		</tr>
		
	</c:forEach>
</table>

<div class="container" align="center">
<ul class="pagination">
			
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<li><a href="${path}/shopList.do?pageNum=${pp.startPage - 1}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<li <c:if test="${pp.currentPage == i}">class="active"</c:if>>
			<a href="${path}/shopList.do?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<li><a href="${path}/shopList.do?pageNum=${pp.endPage + 1}">다음</a></li>
		</c:if>
		 
</ul>
</div>	
<div>
<input type="button" id="button" value="입점승인" onclick="shopList_check()">
</div>
<!-- </form> -->
</body>
</html>