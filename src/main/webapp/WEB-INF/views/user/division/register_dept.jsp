<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
	<div class="content_body">
		<h4 class="ui header">부서등록</h4>
		<form action="addDepartment">
		<div class="ui error form segment">
			<div class="two fields">
				<div class="field">
					<label>부서코드</label> <input placeholder="부서코드" type="text" name="id">
				</div>
				<div class="field">
					<label>사업자등록번호</label>
					<%-- <input type="hidden" name="com_id" value='<%=session.getAttribute("com_id")%>'> --%>
					<input type="text" name="com_id" value='<%=session.getAttribute("com_id")%>' readonly>
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<label>부서명</label> <input placeholder="부서명" type="text" name="name">
				</div>
			</div>
			<button type="submit" class="ui submit button"><i class="save icon"></i>부서 등록</button>
			<a class="ui button" href="deptInfo?curPage=1&key=name&value="><i class="undo icon"></i>목록으로</a>
		</div>
		</form>
	</div>
</body>
</html>