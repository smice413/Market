
$(document).ready(function() {

	// deleveryInsertForm 배송지 등록
	$(".insert_btn").click(function() {	

		if($.trim($(".d_cate_input").val())==""){
				 alert("배송지 구분을 입력하세요.");
				 $(".d_cate_input").val("").focus();
				 return false;
			 }
		if($.trim($(".d_name_input").val())==""){
				 alert("이름을 입력하세요.");
				 $(".d_name_input").val("").focus();
				 return false;
		}
		if($.trim($(".d_tel_input").val())==""){
			 alert("전화번호를 입력하세요.");
			 $(".d_tel_input").val("").focus();
			 return false;
		}
		
		if($.trim($(".d_post_input").val())==""){
			 alert("우편번호를 입력하세요.");
			 $(".d_post_input").val("").focus();
			 return false;
		}
		if($.trim($(".d_address_input").val())==""){
			 alert("주소를 입력하세요.");
			 $(".d_address_input").val("").focus();
			 return false;
		}
		if($.trim($(".d_detail_address_input").val())==""){
			 alert("상세주소를 입력하세요.");
			 $(".d_detail_address_input").val("").focus();
			 return false;
		}
	});	
	
	// deleveryUpdateForm 배송지 수정	
	$(".update_btn").click(function(){
		
	if($.trim($(".d_cate_input").val())==""){
			 alert("배송지 구분을 입력하세요.");
			 $(".d_cate_input").val("").focus();
			 return false;
		 }
	if($.trim($(".d_name_input").val())==""){
			 alert("이름을 입력하세요.");
			 $(".d_name_input").val("").focus();
			 return false;
	}
	if($.trim($(".d_tel_input").val())==""){
		 alert("전화번호를 입력하세요.");
		 $(".d_tel_input").val("").focus();
		 return false;
	}
	
	if($.trim($(".d_post_input").val())==""){
		 alert("우편번호를 입력하세요.");
		 $(".d_post_input").val("").focus();
		 return false;
	}
	if($.trim($(".d_address_input").val())==""){
		 alert("주소를 입력하세요.");
		 $(".d_address_input").val("").focus();
		 return false;
	}
	if($.trim($(".d_detail_address_input").val())==""){
		 alert("상세주소를 입력하세요.");
		 $(".d_detail_address_input").val("").focus();
		 return false;
	}		
	});
});