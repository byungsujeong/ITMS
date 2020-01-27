<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<title>ITMS</title>
<script>
	$(function() {
		$("#open_menu").click(
				function() {
					$('.ui.sidebar').sidebar('setting', 'transition', 'overlay')
							.sidebar('toggle');
				});
		$('.ui.dropdown').dropdown({
			direction : 'auto',
			duration : 100,
			onChange : function(value, text, $choice) {
	
			}
		});
		
// ********************************************************************************************************************************* //		
	
	///// '담당자 정보 수정' 버튼 누를 때 DB에서 정보를 수정하고 '거래처 관리' 페이지로 이동 /////
		$("#cED_Edit2").click(function() {
			// ajax를 사용하여 deleteBn.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// update메소드 사용시 모든 항목값들을 수정하기 위해 각 항목값들 필요
			var id = $("#id").val();
			var b_id = $("#b_id").val();
			var com_id = $("#com_id").val();
			var name = $("#name").val();
			var tel = $("#tel").val();
			var c_key = $("#c_key").val();
			var c_value = $("#c_value").val();
			
			$.ajax({
				url : "updateCs", // url: (controller에서 받아줄 @RequestMapping 주소)
				data : {
					id : id,
					b_id : b_id,
					com_id : com_id,
					name : name,
					tel : tel,
					c_key : c_key,
					c_value : c_value
				},
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result);					
					alert("담당자 정보 수정이 완료되었습니다");
					location.href = "customerRead"; // '거래처 관리'페이지로 이동
				} // success
			}); // ajax end
		}); // cED_Edit2 click end

		
	///// '담당자 정보 삭제' 버튼 누를 때 DB에서 정보를 삭제하고 '거래처 관리' 페이지로 이동 /////		
		$("#cED_Del2").click(function() {
			// ajax를 사용하여 deleteBn.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// delete메소드의 where 조건으로 id값 필요
			// delete메소드의 where 조건으로 com_id값 필요
			var id = $("#id").val(); // delete메소드의 where 조건으로 id값 필요
			var b_id = $("#b_id").val();
			var com_id = $("#com_id").val(); // delete메소드의 where 조건으로 com_id값 필요		
			var choice = confirm("거래처 정보는 유지되고 담당자 정보만 삭제됩니다.\n거래처/담당자 정보 일괄 삭제를 원하시면 거래처 정보 삭제 기능을 사용해주세요. 삭제하시겠습니까?");			
			if (choice == true) { // 삭제 확인창에서 '확인(true)' 버튼 선택시

				$.ajax({
					url : "deleteCs", // url: (controller에서 받아줄 @RequestMapping 주소)
					data : {
						id : id,
						b_id : b_id,
						com_id : com_id
					},
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result);
						alert("담당자 정보 삭제가 완료되었습니다");
						location.href = "customerRead"; // '거래처 관리'페이지로 이동
					} // success
				}); // ajax end		
			} else {
				return false; // 페이지 이동 안함
			} // if else end
		}); // cED_Del2 click end
		
// ********************************************************************************************************************************* //		
		
	}); // funtion end	
</script>

</head>

<body>
<div class="content_body">
<!-- ****************************************************************************************************************************** -->
	<br><h1 align="center">담당자 정보 수정/삭제 페이지</h1><br><br>
<!-- ****************************************************************************************************************************** -->
	<div class="ui grid">
		<form class="ui form" style="margin-left: 355px;">
			<input type="hidden" id="id" value="${omCsDTO.id}"> <!-- ajax로 Controller로 보내 DAO를 통해 Mapper에서 where조건으로 사용하기 위해 -->
			<input type="hidden" id="com_id" value="${omCsDTO.com_id}"> <!-- ajax로 Controller로 보내 DAO를 통해 Mapper에서 where조건으로 사용하기 위해 -->
			
		  <div class="field">
		    <label>업체 아이디</label>
		    <input type="text" name="b_id" id="b_id" value="${omCsDTO.b_id}" placeholder="'거래처' 또는 '기타업체'의 ID 입력" disabled="disabled">
		  </div>
		  <div class="field">
		    <label>담당자명</label>
		    <input type="text" name="name" id="name" value="${omCsDTO.name}" placeholder="">
		  </div>
		  <div class="field">
		    <label>담당자 연락처</label>
		    <input type="text" name="tel" id="tel" value="${omCsDTO.tel}" placeholder=" '-'를 포함하여 입력하세요">
		  </div>
		  <div class="field">
		    <label>Key</label>
		    <input type="text" name="c_key" id="c_key" value="${omCsDTO.c_key}" placeholder="">
		  </div>
		  <div class="field">
		    <label>Value</label>
		    <input type="text" name="c_value" id="c_value" value="${omCsDTO.c_value}" placeholder="">
		  </div>
		  <button class="ui primary button" type="button" id="cED_Edit2" style="width: 250px;">담당자 수정</button>
		  <button class="ui primary button" type="button" id="cED_Del2" style="width: 250px;">담당자 삭제</button>
		</form>
	</div> <!-- grid DIV -->
<!-- ****************************************************************************************************************************** -->
</div> <!-- content_body DIV -->

</body>
</html>