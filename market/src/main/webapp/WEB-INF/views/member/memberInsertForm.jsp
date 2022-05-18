<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>
<div class="container" align=center>
		<div class="vf-wide700-card">
	<div id="join_wrap">
		<h2 class="join_title">회원가입</h2>
		<form name="f" method="post" action="memberInsert.do">
		<input type="hidden" id="m_seckey" name="m_seckey" value="111">
			<table id="memberjoin" class="table">
				<tr>
					<th>회원가입 메일</th>
					<td><input name="m_email" id="m_email" size="14" class="input_box" size="14" placeholder="ex)market@naver.com" /> 
					    <input type="button" value="이메일 중복체크" 	class="input_button" onclick="id_check()" />
						<div id="idcheck"></div></td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td><input type="password" name="m_passwd" id="m_passwd"
						size="14" class="input_box" /></td>
				</tr>
			
				<tr>
					<th>회원이름</th>
					<td><input name="m_name" id="m_name" size="14"
						class="input_box" /></td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><input name="m_tel" id="m_tel" size="14" class="input_box"
						placeholder="숫자만 입력하세요" /></td>
				</tr>
			</table>

			<div id="join_menu">
				<input type="submit" value="회원가입" class="btn btn-success"
				onClick  ="location='memberInsert.do'"/> 
				<input type="reset" value="가입취소" class="btn btn-outline-success"
					onclick="$('#m_email').focus();" />
			</div>
			
		</form>
	</div>
</div>
</div>
</body>
</html>