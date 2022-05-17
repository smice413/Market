<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="loginform">
		<h2 class="login_title">로그인</h2>
		<form name="l" method="post" action="loginCheck.do">
			<table id="logintable">
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
				<input type="submit" value="로그인" class="input_button" /> 
				<input type="reset" value="취소" class="input_button"
					onClick="$('#m_email').focus();" /> 
					<input type="button" value="회원가입" class="input_button"
					onClick="location='memberInsertForm.do'" /> <input type="button"
					value="아이디/비번찾기" class="input_button" />
			</div>
		</form>
	</div>
</body>
</html>


</form>
</body>
</html>