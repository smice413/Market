<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


<!--  <script>
 function passwdSearch(){
	 if($.trim($("#m_email").val())==""){
		 alert("이메일주소 를 입력하세요!");
		 $("#m_email").val("").focus();
		 return false;
	 }
	 if($.trim($("#m_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#m_name").val("").focus();
		 return false;
	 }
 }
</script>-->
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuMyPage.jsp"%>
<div class="container" align=center>
		<div class="vf-wide700-card">
		
		<c:if test ="${empty passwdSearch}">
		<h2 class="pwd_title">비밀번호찾기</h2>
		<form method="post" action="passwdSearch.do">
		<table id="pwd_t1">
		<tr>
			<th>이메일</th>
			<td><input name="m_email" id= "m_email" size="14" class="input_box"/></td>
		</tr>		
		<tr>
			<th>회원이름</th>
			<td><input name = "m_name" id="m_name" size="14" class="input_box"/></td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type ="submit" value="이메일발송" class="btn btn-warning" >
			</td>
		</tr>
		</table>
		</form>
		</c:if>
		
		<c:if test="${!empty passwdSearch}">
    <h2 class="pwd_title2">비번찾기 결과</h2>
    <table id="pwd_t2">
     <tr>
      <th>검색한 비밀번호:</th>
      <td>${passwdSearch}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <input type="button" value="닫기" class="input_button"
    onclick="self.close();" />
    <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
    </div>
  </c:if> 
 </div>
 
</body>
</html>