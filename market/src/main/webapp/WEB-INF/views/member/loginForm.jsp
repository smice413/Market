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

	<div class="container" align=center>
		<div class="vf-wide300-card">
	<div id="loginform">
		<h2 class="login_title">로그인</h2>
		<form name="l" method="post" action="loginCheck.do" >
			<table id="logintable" class = "table" style = "margin:3px">
				<tr>
					<th>이메일</th>
					<td><input name="m_email" id="m_email" size="20"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_passwd" id="m_passwd" size="20"
						class="input_box" /></td>
				</tr>
			</table>             
			<div id="login_menu">
				
			<table border=0>
				<tr>
			<!-- 	<td align="center" height=50px> -->	
					<td align="center" style="padding-bottom: 5px">    
						<input type="submit" value="로그인" class="btn btn-success" /> 
						<input type="button" value="회원가입" class="btn btn-warning"
							onClick="location='memberInsertForm.do'" /> 
						<input type="reset" value="취소" class="btn btn-outline-success"
							onClick="$('#m_email').focus();" /> 
					</td>
				</tr>
				<tr>
					<td style="padding:0 0 0 0">
						<input type="button" value="아이디(이메일)찾기" class="btn btn-outline-warning" 
							onClick ="location ='emailSearchForm.do'"/>
						<input type="button" value="비밀번호찾기" class="btn btn-warning" 
							onClick ="location ='passwdSearchForm.do'"/>
					</td>
				</tr>
			</table>
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