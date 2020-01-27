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
<script src="../../resources/js/corporateInfo.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<div class="content_body">
    <div class="ui error form segment">
    <form action="editCorporate" method="post">
        <div class="two fields">
            <div class="field">
                <label>법인아이디(코드)</label>
                <input type="text" name="id" value="${userMngCorpDTO.id}" readonly>
            </div>
            <div class="field">
                <label>회사(법인)명</label>
                <input type="text" name="name" value="${userMngCorpDTO.name}">
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
                <label>새비밀번호확인  &nbsp;<lable id="pwCheckTxt"></lable></label>
                <input placeholder="비밀번호확인" type="password" id="pwc" name="pwc">
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>대표자명</label>
                <input type="text" name="ceo" value="${userMngCorpDTO.ceo}">
            </div>
            <div class="field">
                <label>회사이메일</label>
                <input type="text" name="email" value="${userMngCorpDTO.email}">
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>회사전화번호</label>
                <input type="text" name="tel" value="${userMngCorpDTO.tel}">
            </div>
            <div class="field">
            </div>
        </div>
        <div class="field">
            <div class="field">
                <label>회사주소</label>
                <input type="text" name="addr" value="${userMngCorpDTO.addr}">
            </div>
        </div>
        <button type="submit" class="ui submit button" id="edit"><i class="edit icon"></i>수정</button>
        <a class="ui button" id="delete" href="delCorporate"><i class="trash alternate icon"></i>탈회</a>
        <a class="ui button" href="../../"><i class="undo icon"></i>처음으로</a>
    </form>
    </div>
</div>
</body>
</body>
</html>