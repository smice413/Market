<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불승인</title>
</head>
<body>

<c:if test="${result == 1}">
	<script>
		alert("환불신청건이 승인되었습니다.");
		location.href="refundList.do";
	</script>
</c:if>

</body>
</html>