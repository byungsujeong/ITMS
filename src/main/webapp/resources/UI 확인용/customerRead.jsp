<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
	<script>
	    $("#open_menu").click(function () {
	        $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
	    });
	    $('.ui.dropdown').dropdown({
	        direction:'auto',
	        duration:100,
	        onChange:function(value, text, $choice){
	
	        }
	    });
	</script>
</head>

<body>
<div class="content_body">
	<h1>거래처 관리 페이지</h1>
	
	<div class="ui icon input">
	<input type="text" name="search" placeholder="검색어를 입력하세요" >
	<button class="ui icon button"><i class="search icon"></i></button>
	</div>
	
	<button class="ui primary button" type="submit" id="">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 정보 등록</font></font>
	</button>
	<button class="ui primary button" type="submit" id="">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 정보 등록</font></font>
	</button>
  	<button class="ui primary button" type="submit" id="">
  	<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 정보 수정/삭제</font></font>
  	</button>
  	<button class="ui primary button" type="submit" id="">
  		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 정보 수정/삭제</font></font>
  	</button>
  	
	<table border=1 id="table" style=" width: 1420px;">
		<tr align="center">
			<td>구분</td>
			<td>회사명</td>
			<td>대표자명</td>
			<td>회사 주소</td>
			<td>회사 전화번호</td>
			<td>회사 국가번호</td>
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
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>

</div> <!-- content_body DIV -->
</body>
</html>