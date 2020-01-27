$(function() {
	$('#addList').click(function(){
		if($("#loadCSV").val()==""){
			var userList = [$('#id').val(), $('#com_id').val(), $('#pw').val(),
				$('#dept_id').val(), $('#name').val(), $('#tel').val(), $('#email').val()];
			$('#regData').append('<option>'+userList+'\n</option>');
		}else{
			var csvFile = new FileReader();
			csvFile.readAsText($("#loadCSV")[0].files[0]);
			csvFile.onload = function(){
				var result = csvFile.result.split("\n");
				for(i=0; i<result.length; i++){
					$('#regData').append('<option>'+result[i]+'\n</option>');		
				}
			}
		}
	});

	$('#addUser').click(function(){
		var csv = $("#regData option").text();
		$.ajax({
			url : "addUser",
			data : {
				csv : csv
			},
			success : function(result){
				location.href="authority?curPage=1&key=&value="
			}
		});
	});

	$('#dept_id').dropdown();
	
});