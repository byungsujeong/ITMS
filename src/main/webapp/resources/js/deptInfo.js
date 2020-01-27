$(function(){
	$("#update").click(function(){
		var c = confirm("현재 반영된 정보로 수정됩니다.");
		if(c===false){
			return false;
		}
	});
	$("#delete").click(function(){
		var c = confirm("선택한 부서정보를 삭제합니다.");
		if(c===false){
			return false;
		}else{
			var checked_val = [];
			$("input:checkbox[name=seq]:checked").each(function(){
				checked_val.push($(this).val())
			})//체크박스 값 가져오기(id)
			$.post("delDepartment",{id:checked_val},
					function(data,status){
						location.href='deptInfo?curPage=1&key=&value=';
			});
		}
	});
});