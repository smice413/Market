<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>
<div class="container" align=center>
		<div class="vf-wide700-card">
		
		<c:if test ="${empty passwdSearch}">
		<h2 class="pwd_title">비밀번호찾기</h2>
		<form method="post" action="passwdSearchForm.do" onsubmit="return passwdsearch()">
		<table id="pwd_t1">
		<tr>
			<th>이메일</th>
			<td><input name="m_email" id= "m_email" size="14" class="input_box"/></td>
		</tr>		
		<tr>
			<th>회원이름</th>
			<td><input name = "m_name" id="m_name" size="14" class="input_box"/></td>
		</tr>
		<table id="mailsend" class="table" style ="margin:3px">
		<tr>
			<td colspan=2 align="center">
				<input type ="submit" value="이메일발송" class="btn btn-warning" >
			</td>
		</tr>
		</table>
		</form>
		</c:if>
		</div>
		</table>
		<c:if test="${!empty passwdSearch}">
    <h2 class="pwd_title2">비번찾기 결과</h2>
    <table id="pwd_t2">
     <tr>
      <th>검색한 비밀번호:</th>
      <td>${passwdSearch}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <input type="submit" value="닫기" class="input_button"
    onclick="self.close();" />
    <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
    </div>
  </c:if> 
 </div>
 
</body>
</html>