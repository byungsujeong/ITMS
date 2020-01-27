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
<script src="../../resources/js/userInfo.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<div class="content_body">
    <div class="ui error form segment">
    <form action="editUserPw" method="post">
        <div class="two fields">
            <div class="field">
                <label>사번</label>
                <input type="text" name="id" value="${userMngEmployeeDTO.id}" readonly>
            </div>
            <div class="field">
                <label>이름</label>
                <input type="text" name="name" value="${userMngEmployeeDTO.name}" readonly>
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>현재 비밀번호</label>
                <input placeholder="비밀번호" type="password" id="pwCheck">
            </div>
            <div class="field">
            	<label>&nbsp;</label>
                <button class="ui button" type="button" id="pwCheckBtn">현재 비밀번호 확인</button>
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>새비밀번호</label>
                <input placeholder="비밀번호" type="password" id="pw" name="pw">
            </div>
            <div class="field">
                <label>새비밀번호확인 &nbsp;<lable id="pwCheckTxt"></lable></label>
                <input placeholder="비밀번호확인" type="password" id="pwc" name="pwc">
            </div>
        </div>
        <div class="field">
        	<div class="field">
        		<label>위임관리</label>
        	</div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>부서</label>
                <select class="ui fluid dropdown" name="dept_id" id="dept_id">
                	<c:forEach items="${deptList}" var="deptdto">
                		<c:choose>
                			<c:when test="${deptdto.id eq userMngEmployeeDTO.dept_id}">
		                		<option value="${deptdto.id}" selected>${deptdto.name}</option>
                			</c:when>
                			<c:otherwise>
		                		<option value="${deptdto.id}">${deptdto.name}</option>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                </select>
            </div>
            <div class="field">
                <label>위임</label>
                <select class="ui fluid dropdown" name="delegation" id="delegation">
                	<c:forEach items="${list}" var="dto">
                		<c:choose>
                			<c:when test="${dto.id eq userMngEmployeeDTO.delegation}">
		                		<option value="${dto.id}" selected>${dto.name}(${dto.id})</option>
                			</c:when>
                			<c:otherwise>
		                		<option value="${dto.id}">${dto.name}(${dto.id})</option>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                </select>
            </div>
        </div>
        <button type="submit" class="ui submit button" id="edit"><i class="edit icon"></i>수정</button>
        <a class="ui button" href="../../"><i class="undo icon"></i>처음으로</a>
    </form>
    </div>
</div>
</body>
</body>
</html>