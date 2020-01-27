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
</script>
</head>

<body>
	<div class="content_body">
		<h1>담당자 정보 등록 페이지</h1>

	<div class="ui grid">

		<!-- 입력 폼 DIV-->
		<form action="">
			<div class="three wide column">
				<table border="1" style="width:300px;">
					<tr>
						<td>업체 아이디</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="" placeholder="거래처 또는 협력업체의 아이디 입력" style="width:300px;"></td>
					</tr>

					<tr>
						<td>담당자명</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="" style="width:300px;"></td>
					</tr>

					<tr>
						<td>담당자 연락처</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="" style="width:300px;"" placeholder=" '-'를 포함하여 입력하세요"></td>
					</tr>

					<tr>
						<td>key</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="" style="width:300px;"></td>
					</tr>

					<tr>
						<td>value</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="" style="width:300px;"></td>
					</tr>

					<tr>
						<td align="center">
						<button class="ui primary button" type="submit" id="">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 추가</font></font>
						</button>
						<button class="ui primary button" type="submit" id="">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 등록</font></font>
						</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
		<!-- 화살표 DIV -->
		<div class="one wide column">
			<button class="ui icon button" style="margin-top: 100px; margin-left: 60px;"><i class="double angle right icon"></i></button>
		</div>

		<!-- 입력 내용 확인 DIV -->
		<div class="eleven wide column">
			<table border=1 id="table" style="width: 900px; float: right;">
				<tr align="center">
					<td>업체 아이디</td>
					<td>담당자명</td>
					<td>담당자 연락처</td>
					<td>key</td>
					<td>value</td>
				</tr>
				<!-- for문 들어갈 자리 -->
				<tr align="center">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	
	</div> <!-- grid DIV -->
	</div> <!-- content_body DIV -->
</body>
</html>