<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function pwResult(){
	 $("#changepwResult").hide();
	 var s_passwd=$("#s_passwd").val();
	 
	 $.ajax({
		 type:"post",
		 url:"shop_info_changepw.do",
		 data: {"s_passwd":s_passwd},
		 success: function(data){
			 if(data==1){	//중복 ID
		      	var newtext='<font color="red">비밀번호를 변경하였습니다</font>';
		      		$("#changepwResult").text('');
		        	$("#changepwResult").show();
		        	$("#changepwResult").append(newtext);
		          	
		          	return false;
			     
		      	  }else{	//사용 가능한 ID
		      		var newtext='<font color="blue">비밀번호를 변경하지 못했습니다.</font>';
		      		$("#changepwResult").text('');
		      		$("#changepwResult").show();
		      		$("#changepwResult").append(newtext);
		      		$("#s_passwd").focus();
		      		
		      	  }
		 }
	 });
	 
 }

</script>

</head>
<body>
<div class="container" align="center">
	<!-- <form method="post" action="shop_info_changepw.do"> -->
	<input type="hidden" id="s_email" name="s_email" value="${s_email}">
		<div class="form-group" >
			<label >비밀번호 변경</label><div><input type="text" id="s_passwd" name="s_passwd"></div>
		</div>
		<div class="form-group" >
			<label>비밀번호 확인</label><div><input type="password" id="s_passwd2" name="s_passwd2"></div>
		</div>
		<div>
			<input type="button" id="button" value="비밀번호 변경" onClick="pwResult()">
		</div>
	<!-- </form>	 -->
	<div id="changepwResult"></div>
	</div>
</body>
</html>