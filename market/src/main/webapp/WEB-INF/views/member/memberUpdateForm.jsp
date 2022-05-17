<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 폼</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>
<div class="container" align=center>
<div class="vf-wide700-card">
	<div id="join_wrap">
		<h2 class="join_title">회원정보수정</h2>
		<form name="f" method="post" action="memberUpdateForm.do">
		<input type="hidden" id="m_seckey" name="m_seckey" value="111">
			<table id="memberupdate" class="table">
				<tr>
					<th>회원가입 메일</th>
					<td>${m_email}</td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td><input type="passwd" name="m_passwd" id="m_passwd"
						size="14" class="input_box" /></td>
				</tr>
			<th>비밀번호 확인</th>
					<td><input type="passwd" name="m_passwd2" id="m_passwd"
						size="14" class="input_box" /></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input name="m_name" id="m_name" size="14"
						class="input_box" value="${old.m_name}"/></td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><input name="m_tel" id="m_tel" size="14" class="input_box"
					value="${old.m_tel}"/></td>
				</tr>
			</table>

			<div id="join_menu">
				<input type="submit" value="정보수정" class="btn btn-success"
			 /> 
				<input type="reset" value="수정취소" class="btn btn-outline-success"
					onclick="$('#m_passwd').focus();" />
			</div>
		</form>
	</div>
	</div>
	</div>
</body>
</html>
</body>
</html>


</form>
</body>
</html>