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
		
	///// 제품 등록 버튼 클릭시 확인창 /////
		$("#insert").click(function(){
			alert("제품 정보 등록이 완료되었습니다");
		}); // insert click end

// ********************************************************************************************************************************* //		
		
	}); // funtion end	
</script>

</head>

<body>
	<div class="content_body">
<!-- ****************************************************************************************************************************** -->
	<br><h1 align="center">제품 정보 등록 페이지</h1><br><br>
<!-- ****************************************************************************************************************************** -->
	<div class="ui grid">
		<form class="ui form" action="insertPd" method="post" style="margin-left: 365px;">
		  <div class="field">
		    <label>제품코드</label>
		    <input type="text" name="code" id="code" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품명</label>
		    <input type="text" name="name" id="name" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품 상세</label>
		    <input type="text" name="spec" id="spec" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품 단가</label>
		    <input type="text" name="price" id="price" placeholder="">
		  </div>
		  <button class="ui primary button" type="submit" id="insert" style="width: 500px;">제품 등록</button>
		</form>
	</div> <!-- grid DIV -->
<!-- ****************************************************************************************************************************** -->
</div> <!-- content_body DIV -->

</body>
</html>