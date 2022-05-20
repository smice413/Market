<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/viewConfiguration.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점 정보 보기</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/menuShop.jsp"%>
<div class="shopcontainer">
		<form id="shop_info" name="shop_info" enctype="multipart/form-data" >
			<!--  <input type="hidden" id="s_status" name="s_status" value="1"> -->
			<input type="hidden" id="s_seckey" value="${shop.s_seckey}">
			<table border="1">
				<tr>
					<td>email</td>
					<td>
					${shop.s_email}
					</td>
				</tr>
				
				<tr>
					<td>상호명</td>
					<td>${shop.s_name}</td>
				</tr>
				<tr>
					<td>대표자명</td>
					<td>${shop.s_ceo}</td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td>${shop.s_bizno}</td>
				</tr>
				<tr>
					<td>통신판매업번호</td>
					<td>${shop.s_tongsin}</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>${shop.s_post}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${shop.s_address}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${shop.s_tel}</td>
				</tr>
				<tr>
					<td>은행명</td>
					<td>${shop.s_bank}</td>
				</tr>
				<tr>
					<td>정산계좌</td>
					<td>${shop.s_account}</td>
				</tr>
				<tr>
					<td>서류첨부</td>
					<td>
						<c:if test="${empty shop.s_file}">
       					&nbsp;
       					</c:if> 
       					<c:if test="${!empty shop.s_file}">
						<img src="${path}/upload/${shop.s_file}" height="100" width="100" />
						</c:if> 
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" id="button" value="상점정보수정" onClick="location.href='${path}/shop_info_edit_form.do'">
					<input type="button" id="button" value="페점신청" onClick="location.href='${path}/shop_del_form.do'">
				 	</td>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>