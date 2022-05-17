<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<%-- <link rel="stylesheet" href="${path}/css/reset.css"> --%>
 	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
	<link rel="stylesheet" href="${path}/css/swiper.css"> 
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
			
				$(document).ready(function(){
					
					$("#cart").click(function(){
						 $.post("cartInsert.do",{ p_no : 16,
							                      cart_qty : 1}, 
							 function(result){
				            	if(result.trim() == 'success'){
				            		var check = confirm("장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?");
									 if(check) { 
										 location.assign("cartList.do?");
									 }else{
										 return false;
									 }
				            	}else if(result.trim() == 'existed'){
				            		alert("이미 장바구니에 등록된 상품입니다.");
				            	}
				            }	
					); // post() end
						
				});					
					
			});

            </script>
	
	
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>


<%
   String m_email = "hamtori@gmail.com";
   session.setAttribute("m_email", m_email);
%> 

<div class="container">

		<div class="row" style="text-align: center; margin: 70px 0;">
			<input type="button" class="btn btn-success" id="cart" value="장바구니">
			
			<input type="button" class="btn btn-success" id="groupOrder" value="공동주문">
		</div>
	</div>




<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>	
</footer>

</body>
</html>