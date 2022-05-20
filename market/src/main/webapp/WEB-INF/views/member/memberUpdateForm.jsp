<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 폼</title>
<script type="text/javascript">
	function chk() {
		if (frm.m_passwd3.value != frm.m_passwd4.value) {
			alert("새 비밀번호가 일치하지 않습니다");
			frm.m_passwd4.value="";
			frm.m_passwd4.focus();
			return false;
		}
		if(frm.m_passwd.value != frm.m_passwd2){
			alert("현재 비밀번호를 확인해주세요");
			frm.m_passwd2.value = "";
			frm.m_passwd2.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/menuMyPage.jsp"%>
	<div class="container" align=center>
		<div class="vf-wide700-card">
			<div id="join_wrap">
				<h2 class="join_title">회원정보수정</h2>
				<form method="post" action="memberUpdate.do" name="frm" onsubmit="return chk()">
					<input type="hidden" id="m_seckey" name="m_seckey" value="111">
					<input type="hidden" id="m_passwd" name="m_passwd"	value="${old.m_passwd}">
					<input type="hidden" id="m_email" name="m_email"	value="${old.m_email}">

					<table id="memberupdate" class="table">
						<tr>
							<th>회원가입 메일</th>
							<td>${m_email}</td>
						</tr>
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="password" name="m_passwd2" id="m_passwd2"
								size="14" class="input_box" required="required"/></td>
						</tr>
						<tr>
							<th>변경 비밀번호</th>
							<td><input type="password" name="m_passwd3" id="m_passwd3"
								size="14" class="input_box" required="required"/></td>
						</tr>
						<tr>
							<th>변경 비밀번호 재입력</th>
							<td><input type="password" name="m_passwd4" id="m_passwd4"
								size="14" class="input_box" required="required"/></td>
						</tr>
						<tr>
							<th>회원이름</th>
							<td><input name="m_name" id="m_name" size="14"
								class="input_box" value="${old.m_name}" /></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td><input name="m_tel" id="m_tel" size="14"
								class="input_box" value="${old.m_tel}" /></td>
						</tr>
					</table>

					<div id="join_menu">
						<input type="submit" value="정보수정" class="btn btn-success"/> 
						<input type="reset" value="수정취소" class="btn btn-outline-success"
							onclick="history.go(-1)" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>