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
	
	///// 담당자 등록 버튼 클릭시 확인창 /////
		$("#insert").click(function(){
			alert("담당자 정보 등록이 완료되었습니다");
		}); // insert click end	

// ********************************************************************************************************************************* //	
	
	}); // function end
</script>

</head>

<body>
<div class="content_body">
<!-- ****************************************************************************************************************************** -->
	<br><h1 align="center">담당자 정보 등록 페이지</h1><br><br>
<!-- ****************************************************************************************************************************** -->
	<div class="ui grid">		
		<form class="ui form" action="insertCs" method="post" style="margin-left: 365px;">
		  <div class="field">
		    <label>업체 아이디</label>
		    <input type="text" name="b_id" id="b_id" placeholder=" '거래처' 또는 '기타업체' 의 ID 입력">
		  </div>
		  <div class="field">
		    <label>담당자명</label>
		    <input type="text" name="name" id="name" placeholder="">
		  </div>
		  <div class="field">
		    <label>담당자 연락처</label>
		    <input type="text" name="tel" id="tel" placeholder="  ' - ' 를 포함하여 입력하세요">
		  </div>
		  <div class="field">
		    <label>Key</label>
		    <input type="text" name="c_key" id="c_key" placeholder="은행명을 입력하세요 ( 영문 입력 )">
		  </div>
		  <div class="field">
		    <label>Value</label>
		    <input type="text" name="c_value" id="c_value" placeholder="은행계좌를 입력하세요 ( ' - ' 를 포함하여 입력 )">
		  </div>
		  <button class="ui primary button" type="submit" id="insert" style="width: 500px;">담당자 등록</button>
		</form>
	</div> <!-- grid DIV -->
<!-- ****************************************************************************************************************************** -->
</div> <!-- content_body DIV -->

</body>
</html>