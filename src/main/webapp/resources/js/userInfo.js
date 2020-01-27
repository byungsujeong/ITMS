$(function(){
	var accept = 0;
	var accept2 = 1;
	$("#pwCheckBtn").click(function(){
		var pw = $("#pwCheck").val();
		$.ajax({
			url : "pwCheck",
			type : "POST",
			data : {
				pw : pw
			},
			/* async : false, */
			success : function(result){
				if(result==1){
					accept = 1;
					$("#pwCheckBtn").prop("disabled", true);
					$("#pwCheckBtn").prop("innerText","확인 완료")
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					$("#pwCheck").prop("value", null);
				}
			}
		});
		
		
	});
	
	$("#pwc").keyup(function() { //pw와 pw재확인 값에 따른 출력 메세지 설정
        if ($("#pw").val() == $("#pwc").val()) {
            $("#pwCheckTxt").html(
                "<font color = green>패스워드가 일치합니다.</font>");
            accept2 = 1;
        } else {
            $("#pwCheckTxt").html(
                "<font color = red>패스워드가 일치하지 않습니다.</font>");
            accept2 = 0;
        }
    });
		
	$("#edit").click(function(){
		if(accept==0){
			alert("비밀번호 확인을 완료 후 진행 가능합니다.")
			return false;
		}else if(accept2==0){
			alert("새로운 비밀번호 정보를 확인하세요.")
			return false;
		}else{
			var c = confirm("현재 반영된 정보로 수정됩니다.");
			if(c===false){
				return false;
			}
		}
	});
	
	$("#dept_id").change(function(){
		var dept_id = $("#dept_id option:selected").val()
		console.log(dept_id);
		$.ajax({
			type : "POST",
			url : "delegation",
			data : {
				dept_id : dept_id
			},
			success : function(result){
					$("#delegation").empty();
				$(result).each(function(index, person){
					$("#delegation").append('<option value="'+person.id+'" selected>'+person.name+'('+person.id+')'+'</option>');
				});
			}
		});
	});
})