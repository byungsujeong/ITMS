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
		
	///// '제품 정보 수정' 버튼 누를 때 DB에서 정보를 추가(이력을 위해 수정이 아닌 추가)하고 '제품 관리' 페이지로 이동 /////
		$("#pED_Add").click(function() {
			// ajax를 사용하여 updatePd.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// update메소드 사용시 모든 항목값들을 수정하기 위해 각 항목값들 필요
			var id = $("#id").val();
			var com_id = $("#com_id").val();
			var code = $("#code").val();
			var name = $("#name").val();
			var spec = $("#spec").val();
			var price = $("#price").val();
			
			$.ajax({
				url : "updatePd", // url: (controller에서 받아줄 @RequestMapping 주소)
				data : {
					id : id,
					com_id : com_id,
					code : code,
					name : name,
					spec : spec,
					price : price

				},
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result);					
					alert("제품 정보 수정이 완료되었습니다");
					location.href = "productRead"; // '제품 관리'페이지로 이동
				} // success
			}); // ajax end
		}); // pED_Add click end

						
		/* '제품 정보 삭제' 버튼 누를 때 DB에서 정보를 삭제하고 '제품 관리' 페이지로 이동 */
		$("#pED_Del").click(function() {
			// ajax를 사용하여 deletePd.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			var id = $("#id").val();
			var code = $("#code").val(); // delete메소드의 where 조건으로 code값 필요
			var com_id = $("#com_id").val(); // delete메소드의 where 조건으로 com_id값 필요
			if (confirm("선택한 제품의 정보와 단가 이력까지 모두 삭제 됩니다.\n진행하시겠습니까?") === true) {
				$.ajax({
					url : "deletePd", // url: (controller에서 받아줄 @RequestMapping 주소)
					data : {
						id : id,
						code : code,
						com_id : com_id
					},
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result);
						alert("제품 정보 삭제가 완료되었습니다");
						location.href = "productRead"; // '제품 관리' 페이지로 이동
					} // success
				}); // ajax end
			}else{
				return false; // 페이지 이동 안함
			} // if else end
		}); // pED_Del click end

// ********************************************************************************************************************************* //		
		
	}); // funtion end
	
</script>
</head>

<body>
	<div class="content_body">
<!-- ****************************************************************************************************************************** -->	
	<br><h1 align="center">제품 정보 수정/삭제 페이지</h1><br><br>
<!-- ****************************************************************************************************************************** -->
	<div class="ui grid">
		<form class="ui form" style="margin-left: 355px;">
			<input type="hidden" id="id" value="${omPdDTO.id}"> <!-- ajax로 Controller로 보내 DAO를 통해 Mapper에서 where조건으로 사용하기 위해 -->
			<input type="hidden" id="com_id" value="${omPdDTO.com_id}"> <!-- ajax로 Controller로 보내 DAO를 통해 Mapper에서 where조건으로 사용하기 위해 -->
			
		  <div class="field">
		    <label>제품코드</label>
		    <input type="text" name="code" id="code" value="${omPdDTO.code}" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품명</label>
		    <input type="text" name="name" id="name" value="${omPdDTO.name}" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품상세</label>
		    <input type="text" name="spec" id="spec" value="${omPdDTO.spec}" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품단가</label>
		    <input type="text" name="price" id="price" value="${omPdDTO.price}" placeholder="">
		  </div>
		  <button class="ui primary button" type="button" id="pED_Add" style="width: 250px;">제품 정보 수정</button>
		  <button class="ui primary button" type="button" id="pED_Del" style="width: 250px;">제품 정보 삭제</button>
		</form>
	</div> <!-- grid DIV -->
<!-- ****************************************************************************************************************************** -->
</div> <!-- content_body DIV -->

</body>
</html>