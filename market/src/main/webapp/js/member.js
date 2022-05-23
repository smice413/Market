//memberInsertForm 회원가입페이지
	if($.trim($("#m_email").val())==""){
		 alert("이메일을 입력하세요.");
		 $("#m_email").val("").focus();
		 return false;
	 }
	if($.trim($("#m_passwd").val())==""){
		 alert("비밀번호를 입력하세요");
		 $("#m_passwd").val("").focus();
		 return false;
	 }
	if($.trim($("#m_name").val())==""){
		 alert("이름을 입력하세요");
		 $("#m_name").val("").focus();
		 return false;
	 }
	if($.trim($("#m_tel").val())==""){
		 alert("핸드폰번호를 숫자만 입력하세요");
		 $("#m_tel").val("").focus();
		 return false;
	 }
	
//memberInsertForm 이메일 중복검사버튼 눌러라------이메일중복검사 start
	function emailcheck(){
		$("#submit").attr("disabled", true);
		alert("email중복검사를 해주세요");
	}
//이메일중복체크 
	function emailcheck(){
		$("#emailcheck").hide();
		var email=$("m_email").val();
	}
	
//입력한 이메일 유효성 검사 	
	if(!(validate_userid(email))){ //밑에서 정의한 validate_userid(memid)함수는 일치하지 않을 때 false를 리턴하기 때문에 !를 붙여 true로 조건을 만듬
		var newtext='<font color="red">email에 @와 .com을 입력해주세요</font>';
		$("#emailcheck").text('');//문자 초기화
		$("#emailcheck").show(); //span 아이디 영역을 보이게 한다.
		$("#emailcheck").append(newtext);
		$("#m_email").val("").focus();
		return false;
	};
//이메일 중복확인 
	 $.ajax({
	        type:"POST",
	        url:"memberEmailCheck.do",
	        data: {"email":email},        
	        success: function (data) { 
	        	//alert("return success="+data);
	      	  if(data==1){	//중복 ID
	      		var newtext='<font color="red">중복 email입니다.</font>';
	      			$("#emailcheck").text('');
	        		$("#emailcheck").show();
	        		$("#emailcheck").append(newtext);
	          		$("#m_email").val('').focus();
	          		$("#submit").attr("disabled", true);
	          		return false;
		     
	      	  }else{	//사용 가능한 ID
	      		var newtext='<font color="blue">사용가능한 email입니다.</font>';
	      		$("#emailcheck").text('');
	      		$("#emailcheck").show();
	      		$("#emailcheck").append(newtext);
	      		$("#m_passwd").focus();
	      		$("#submit").attr("disabled", false);
	      	  }  	    	  
	        }
	        ,
	    	  error:function(e){
	    		  alert("data error"+e);
	    	  }
	      });
	
	//------이메일 중복검사 end--------
	 
	 
	 function validate_userid(email){
			var pattern= new RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i);
			//'~~~@~~~.~~~' 형식이다.
			//'@' 앞에 오는 이메일 계정 이름에는 알파벳과 숫자, '_', '-', '+', '.'의 조합만 허용한다.
			//'@'과 '.' 사이의 도메인명은 알파벳과 숫자, '-'의 조합만 허용한다.
			//'.' 뒤의 최상위 도메인은 알파벳과 숫자만 사용할 수 있으며, 그 길이는 2~4글자이다.
			//대소문자는 무시한다.
			
			//영문 소문자,숫자 ,_가능,정규표현식
			return pattern.test(email); //pattern.test()는 값이 일치하면 true리턴함
		};
	 

		
	//회원정보수정 전 확인폼
	function kk() {
	if ($.trim($("#m_email").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#m_email").val("").focus();
		return false;
	}
	if ($.trim($("#m_passwd").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#m_passwd").val("").focus();
		return false;
	}
	
	//회원정보수정폼
	function frm() {
		if ($.trim($("#m_passwd2").val()) == "") {
			alert("현재 비밀번호를 입력하세요.");
			$("#m_email").val("").focus();
			return false;
		}
		if ($.trim($("#m_passwd3").val()) == "") {
			alert("변경하실 비밀번호를 입력하세요.");
			$("#m_passwd").val("").focus();
			return false;
			}
		if ($.trim($("#m_passwd4").val()) == "") {
			alert("변경하실 비밀번호를 다시 입력해주세요.");
			$("#m_passwd").val("").focus();
			return false;
			}
		if ($.trim($("#m_name").val()) == "") {
			alert("이름을 입력하세요.");
			$("#m_passwd").val("").focus();
			return false;
			}
		if ($.trim($("#m_tel").val()) == "") {
			alert("전화번호를 입력하세요.");
			$("#m_passwd").val("").focus();
			return false;
			}
		}
	}