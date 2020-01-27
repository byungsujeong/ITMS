<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../../resources/js/register_employee.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
	<div class="content_body">
		<h4 class="ui header">사용자등록</h4>
		<div class="ui error form segment">
			<div class="two fields">
				<div class="field">
					<label>사번</label> <input placeholder="사번" type="text" id="id" name="id">
				</div>
				<div class="field">
					<label>사업자등록번호</label> <input type="text" id="com_id" name="com_id" value='<%=session.getAttribute("com_id")%>' readonly>
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<label>비밀번호</label> <input placeholder="비밀번호"  type="password" id="pw" name="pw">
				</div>
				<div class="field">
					<label>사용자 이름</label> <input placeholder="사용자 이름" id="name" name="name" type="text">
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<label>사용자 연락처</label> <input placeholder="사용자 연락처" id="tel" name="tel" type="text">
				</div>
				<div class="field">
					<label>사용자 이메일</label> <input placeholder="사용자 이메일" id="email" name="email" type="text">
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<label>부서 분류</label>
					<select class="ui dropdown" id="dept_id" name="dept_id">
						<c:forEach items="${list}" var="dto">
							<option value="${dto.id}">${dto.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="field">
				</div>
			</div>
			<div class="two field">
				<div class="field">
					<button id="addList" class="ui submit button"><i class="download icon"></i>추가</button>
					<input id="loadCSV" type="file" accept=".csv" class="ui submit button">
				</div>
				<div class="field">
					<select name="regData" id="regData" multiple>
					</select>
				</div>
			</div>
			<button id="addUser" class="ui submit button"><i class="user plus icon"></i>사원 등록</button>
			<a class="ui button" href="authority?curPage=1&key=&value="><i class="undo icon"></i>목록으로</a>
		</div>
	</div>
</body>
</html>