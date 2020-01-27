$(function(){
	
	$('.slider.checkbox').checkbox({
		onChecked: function() {
			$(this).parent().children()[2].value=1;
		},
	    onUnchecked: function() {
	    	$(this).parent().children()[2].value=0;
	    }
	});
	
	$('.product.slider.checkbox').checkbox('attach events', '.product.check.button','check');
	$('.product.slider.checkbox').checkbox('attach events', '.product.uncheck.button','uncheck');
	$('.import.slider.checkbox').checkbox('attach events', '.import.check.button','check');
	$('.import.slider.checkbox').checkbox('attach events', '.import.uncheck.button','uncheck');
    $('.export.slider.checkbox').checkbox('attach events', '.export.check.button','check');
	$('.export.slider.checkbox').checkbox('attach events', '.export.uncheck.button','uncheck');
	$('.finance.slider.checkbox').checkbox('attach events', '.finance.check.button','check');
	$('.finance.slider.checkbox').checkbox('attach events', '.finance.uncheck.button','uncheck');
	$('.report.slider.checkbox').checkbox('attach events', '.report.check.button','check');
	$('.report.slider.checkbox').checkbox('attach events', '.report.uncheck.button','uncheck');
	
	$("#update").click(function(){
		var c = confirm("현재 반영된 정보로 수정됩니다.");
		if(c===false){
			return false;
		}
	});
	
	$("#delete").click(function(){
		var c = confirm("선택한 직원정보를 삭제합니다.");
		if(c===false){
			return false;
		}else{
			var checked_val = [];
			$("input:checkbox[name=seq]:checked").each(function(){
				checked_val.push($(this).val())
			})//체크박스 값 가져오기(id)
			$.post("delUser",{id:checked_val},
					function(data,status){
						location.href='authority?curPage=1&key=&value=';
			});
		}
	});
	
	$("#downExcel").click(function(){
		var key = $("#xlskey").val()
		var value = $("#xlsvalue").val()
		location.href = "downExcel?key="+key+"&value="+value;
	});
	
});