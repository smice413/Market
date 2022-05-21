<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
</style>
<!-- header 영역 -->
<div class="container">
	<table width=100%>
		<tr>
			<td colspan=3 valign="middle" align="right"
				style="font-size: 12px; text-decoration: none;">
	<!-- 메인 메뉴 (윗부분) --> 
				<c:if test="${empty sessionScope.m_email }">
					<a href="${path }/memberInsertForm.do">회원가입</a> |
					<a href="${path }/loginForm.do">로그인</a> |
				</c:if>
			
				<c:if test="${sessionScope.id == 'admin'}">
					<a href="${path }/view.do?num=1&pageNum=1">관리자페이지</a> | 
				</c:if>
					
					
	<!-- 세션이 있는 경우 --> 
				<c:if test="${!empty sessionScope.m_email }">
				   	${sessionScope.m_email }님 환영합니다.  &nbsp;|
					<a href="${path }/logout.do">로그아웃</a> |
					<a href="${path }/myPage.do">마이페이지</a> |
				</c:if>		

					<a href="order_tabList.do">SHOP매니저</a> |
					<a href="${path }/shop_join_form.do">입점신청</a> |
					<a href="${path }/shop_login_form.do">판매자로그인테스트</a> |
					<a href="${path }/list.do">샘플게시판</a> 
					<!--  SHOP매니저 | 입점신청 | 회원가입 | 로그인 | 마이페이지| 장바구니 | 로그아웃 | 관리자페이지  | 이벤트/공지 | 고객센터 -->
			</td>
		</tr>
		<tr>
			<td></td>
			<td valign="bottom" align="center" height=65px>
				<!-- 로고 (이미지) --> 
				<a href="${path }/main.do"><img src="${path}/images/logo7.PNG" width=150px></a>
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan=3>
				<!-- 메인 메뉴 (아래부분) -->
				<div class="vf_header_menu">
					<div>
						<a href="${path}/productCategoryList.do?search=cate_large&keyword=과일">
							<c:if test="${keyword == '과일'}">
								<font style="font-size: 20px; font-weight: bold;">과일</font>
							</c:if>
							<c:if test="${keyword != '과일'}">과일</c:if>
						</a>
					</div>
					<div>
						<a href="${path}/productCategoryList.do?search=cate_large&keyword=채소">
							<c:if test="${keyword == '채소'}">
								<font style="font-size: 20px; font-weight: bold;">채소</font>
							</c:if>
							<c:if test="${keyword != '채소'}">채소</c:if>
						</a>
					</div>
					<div>
						<a href="${path}/productCategoryList.do?search=cate_large&keyword=잡곡">
							<c:if test="${keyword == '잡곡'}">
								<font style="font-size: 20px; font-weight: bold;">잡곡</font>
							</c:if>
							<c:if test="${keyword != '잡곡'}">잡곡</c:if>
						</a>
					</div>
					<div>
						<a href="#" style="">이벤트</a>
					</div>
					<div class="vf_header_menu_search" style="width: 225px; padding: 0px;">
						<form action="${path}/productSearchList.do?pageNum=1">
							<input type=hidden name="search" value="p_name">
							<input type=text name="keyword" class="vf_search">
							<!--  	<img src="${path }/images/icon_search.png" style="width:24px; height:24px">-->
							<input type="submit" value="검색" style="width: 40px; font-size: 13px;">
						</form>
					</div>
					<div style="width: 30px; padding: 0 0 0 10">
						<a href="cartList.do"><img src="${path }/images/icon_cart.png" style="width: 24px; height: 24px"></a>
					</div>
				</div>
			</td>
		</tr>
	</table>

</div>
