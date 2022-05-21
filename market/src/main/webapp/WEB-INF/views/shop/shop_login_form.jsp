<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<form id="shop_login"
		action="shop_login.do" method="post">
		<div class="form-group">
			<label for="s_email">이메일</label> 
			<input type="text" id="s_email" name="s_email" class="form-control" placeholder="이메일">
		</div>
		<div class="form-group">
			<label for="s_passwd">패스워드</label> 
			<input type="password" id="s_passwd" name="s_passwd" class="form-control" placeholder="패스워드">
		</div>

		<input type="submit" id="login" class="btn btn-info btn-lg btn-block"
			value="login"></input>
	</form>
</body>
</html>