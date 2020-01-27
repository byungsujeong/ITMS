$(function() {
	var accept = 0; 
	
	$("#login").click(function(){
		var com_id = $("#com_id").val();
		var id = $("#id").val();
		var pw = $("#pw").val();
		
		$.ajax({
			url : "loginCheck",
			data : {
				com_id : com_id,
				id : id,
				pw : pw
			},
			success : function(result){
				accept = result;
				if(accept==1){
					location.href = "";
				}else{
					alert("로그인 정보를 확인하세요.");
				}
			}
		});
	});
	
});