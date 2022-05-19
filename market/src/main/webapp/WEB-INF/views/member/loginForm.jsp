<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>

	<div class="container" align=center>
		<div class="vf-wide300-card">
	<div id="loginform">
		<h2 class="login_title">로그인</h2>
		<form name="l" method="post" action="loginCheck.do">
			<table id="logintable" class = "table">
				<tr>
					<th>이메일</th>
					<td><input name="m_email" id="m_email" size="20"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="m_passwd" name="m_passwd" id="pwd" size="20"
						class="input_box" /></td>
				</tr>
			</table>
			<div id="login_menu">
				<input type="submit" value="로그인" class="btn btn-success" /> 
				<input type="reset" value="취소" class="btn btn-outline-success"
					onClick="$('#m_email').focus();" /> 
					<input type="button" value="회원가입" class="btn btn-warning"
					onClick="location='memberInsertForm.do'" /> 
					<input type="button"
					value="아이디(이메일)찾기" class="btn btn-outline-warning" 
					onClick ="location ='emailSearchForm.do'"/>
					<input type="button"
					value="비밀번호찾기" class="btn btn-warning" 
					onClick ="location ='passwdSearchForm.do'"/>
			</div>
		</form>
	</div>
	</div>
	</div>
</body>
</html>

</form>
</body>
</html>