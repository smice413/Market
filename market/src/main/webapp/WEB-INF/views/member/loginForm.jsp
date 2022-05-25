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
		<form name="l" method="post" action="loginCheck.do" onSubmit="return loginf()">
			<table id="logintable" class = "table" style = "margin:3px">
				<tr>
					<th>이메일</th>
					<td><input type="text" name="m_email" id="m_email" size="20"
						class="input_box" required="required"/></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_passwd" id="m_passwd" size="20"
						class="input_box" required="required"/></td>
				</tr>
			</table>             
			<div id="login_menu">
				
			<table border=0>
				<tr>
			<!-- 	<td align="center" height=50px> -->	
					<td align="center" style="padding-bottom: 5px">    
						<input type="submit" value="로그인" class="btn btn-lg btn-primary btn-block btn-success" /> 
						<!-- <input type="button" value="회원가입" class="btn btn-warning"
							onClick="location='memberInsertForm.do'" />  -->
						
					</td>
				</tr>
				<tr>
					<td style="padding:0 0 0 0">
		<!-- 				<input type="button" value="아이디(이메일)찾기" class="btn btn-outline-warning" 
							onClick ="location =''"/> -->
							<a href="emailSearchForm.do"><small>아이디(이메일)찾기</small></a> |
						<!-- <input type="button" value="비밀번호찾기" class="btn btn-warning" 
							onClick ="location ='passwdSearchForm.do'"/> -->
							<a href="passwdSearchForm.do"><small>비밀번호 찾기</small></a>
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

