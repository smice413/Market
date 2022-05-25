<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운송장번호 입력 결과</title>
</head>
<body>

<c:if test="${result == 1}">
	<script>
		alert("운송장 입력이 성공되었습니다.");
		location.href="shopOrderDetail.do?o_no="+${o_no};
	</script>
</c:if>
<c:if test="${result == -1}">
	<script>
		alert("운송장 입력에 실패했습니다.");
		location.href="memberUpdateForm.do";
	</script>
</c:if>



</body>
</html>