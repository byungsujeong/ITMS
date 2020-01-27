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
		
	///// '거래처 정보 수정' 버튼 누를 때 DB에서 정보를 수정하고 '거래처 관리' 페이지로 이동 /////
		$("#cED_Edit1").click(function() {
			// ajax를 사용하여 updateBn.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// update메소드 사용시 모든 항목값들을 수정하기 위해 각 항목값들 필요
			var id = $("#id").val();
			var com_id = $("#com_id").val();
			var type = $("#type").val();
			var name = $("#name").val();
			var ceo = $("#ceo").val();
			var addr = $("#addr").val();
			var tel = $("#tel").val();
			var country_code = $("#country_code").val();
			
			$.ajax({
				url : "updateBn", // url: (controller에서 받아줄 @RequestMapping 주소)
				data : {
					id : id, // metadata : data
					com_id : com_id,
					type : type,
					name : name,
					ceo : ceo,
					addr : addr,
					tel : tel,
					country_code : country_code
				},				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result);						
					alert("거래처 정보 수정이 완료되었습니다");
					location.href = "customerRead"; // '거래처 관리'페이지로 이동
				} // success
			}); // ajax end
		}); // cED_Edit1 click end

		
	///// '거래처 정보 삭제' 버튼 누를 때 DB에서 정보를 삭제하고 '거래처 관리' 페이지로 이동 /////
		$("#cED_Del1").click(function() {
			// ajax를 사용하여 deleteBn.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			var id = $("#id").val(); // delete메소드의 where 조건으로 id값 필요
			var com_id = $("#com_id").val(); // delete메소드의 where 조건으로 com_id값 필요			
			var choice = confirm("거래처 정보 삭제시 해당 담당자 정보도 모두 삭제됩니다.\n삭제하시겠습니까?"); // 확인창
			if (choice == true) { // 삭제 확인창에서 '확인(true)' 버튼 선택시
				$.ajax({
					url : "deleteBn", // url: (controller에서 받아줄 @RequestMapping 주소)
					data : {
						id : id,
						com_id : com_id
					},
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result);
						alert("거래처 정보 삭제가 완료되었습니다");
						location.href = "customerRead"; // '거래처 관리' 페이지로 이동
					} // success
				}); // ajax end				
			} else {
				return false; // 페이지 이동 안함
			} // if else end			
		}); // cED_Del1 click end
		
// ********************************************************************************************************************************* //		
	
	}); // funtion end
</script>

</head>

<body>
<div class="content_body">
<!-- ****************************************************************************************************************************** -->
	<br><h1 align="center">거래처 정보 수정/삭제 페이지</h1><br><br>
<!-- ****************************************************************************************************************************** -->
	<div class="ui grid">
		<form class="ui form" style="margin-left: 355px;">
			<input type="hidden" id="id" value="${omBnDTO.id}"> <!-- ajax로 Controller로 보내 DAO를 통해 Mapper에서 where조건으로 사용하기 위해 -->
			<input type="hidden" id="com_id" value="${omBnDTO.com_id}"> <!-- ajax로 Controller로 보내 DAO를 통해 Mapper에서 where조건으로 사용하기 위해 -->
			
		  <div class="field">
		    <label>구분</label>
		    <input type="text" name="type" id="type" value="${omBnDTO.type}" placeholder="'거래처' 또는 '기타' 입력">
		  </div>
		  <div class="field">
		    <label>회사명</label>
		    <input type="text" name="name" id="name" value="${omBnDTO.name}" placeholder="">
		  </div>
		  <div class="field">
		    <label>대표자명</label>
		    <input type="text" name="ceo" id="ceo" value="${omBnDTO.ceo}" placeholder="">
		  </div>
		  <div class="field">
		    <label>회사 주소</label>
		    <input type="text" name="addr" id="addr" value="${omBnDTO.addr}" placeholder="">
		  </div>
		  <div class="field">
		    <label>회사 전화번호</label>
		    <input type="text" name="tel" id="tel" value="${omBnDTO.tel}" placeholder="  ' - ' 를 포함하여 입력하세요">
		  </div>
		  <div class="field">
		    <label>회사 국가번호</label>
		    <input type="text" name="country_code" id="country_code" value="${omBnDTO.country_code}" placeholder="">
		  </div>
		  <button class="ui primary button" type="button" id="cED_Edit1" style="width: 250px;">거래처 수정</button>
		  <button class="ui primary button" type="button" id="cED_Del1" style="width: 250px;">거래처 삭제</button>
		</form>
	</div> <!-- grid DIV -->
<!-- ****************************************************************************************************************************** -->
</div> <!-- content_body DIV -->

</body>
</html>