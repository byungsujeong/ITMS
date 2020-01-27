$(function(){
    var count = 0;
    var count2 = 0;
    var count3 = 0;
    var count4 = 1;
    <!-- email형식 정의 -->
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	$("#id").keyup(function() { //id 중복확인 체크 결과에 따른 메시지 출력
	    var id = $("#id").val()
	    console.log(id.length)
	    if(id.length == 10) {
	    	$.ajax({
	    		url: "overlapCheck",
	    		data: {
	    			id: id
	    		},
	    		success: function(result) {
	    			count = result;
	    			if (count == 0) {
	    				$("#idCheckTxt").html("<font color = red>중복된 아이디 입니다</font>");
	    			} else {
	    				$("#idCheckTxt").html("<font color = green>사용가능한 아이디 입니다</font>");
	    			}
	    		}
	    	});
	    }else{
	    	$("#idCheckTxt").html("<font color = red>사업자번호 10자리를 입력하세요</font>");
	    }
	});
	
	$("#pwc").keyup(function() { //pw와 pw재확인 값에 따른 출력 메세지 설정
        if ($("#pw").val() == $("#pwc").val()) {
            $("#pwCheckTxt").html(
                "<font color = green>패스워드가 일치합니다.</font>");
            count2 = 1;
        } else {
            $("#pwCheckTxt").html(
                "<font color = red>패스워드가 일치하지 않습니다.</font>");
            count2 = 0;
        }
    });
	
	$("#email").keyup(function() { //이메일 형식에 따른 출력 메세지 설정
        if($("#email").val()==""){
        	count4 = 1;
        	 $("#emailCheckTxt").html("");

        }else{
			if (exptext.test($("#email").val()) == false) {
	            $("#emailCheckTxt").html(
	                "<font color = red>이메일 형식을 확인해주세요</font>");
	            count4 = 0;
	        } else {
	            $("#emailCheckTxt").html(
	                "<font color = green>바른 형식입니다.</font>");
	            count4 = 1;
	        }
        }
    });
	
    $("#join").click(function() { // 위 조건에 따라 count가 변경 된 값이 있으면 회원가입 안되도록 정의
        if (count == 0) {
            alert("ID 입력정보를 확인하세요.");
            return false;
        } else if (count2 == 0) {
            alert("비밀번호 입력정보를 확인하세요.");
            return false;
        } else if (count4 == 0){
            alert("이메일 형식을 확인해주세요.");
            return false;
        } else{
        	alert("가입이 완료되었습니다.")
        }
    });
});