<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/include/Semantic-Master/semantic.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../../resources/js/joinCheck.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="content_body">
    <h4 class="ui header">법인가입신청</h4>
    <div class="ui error form segment">
    <form action="addCorporate" method="post">
        <div class="two fields">
            <div class="field">
                <label>법인아이디(코드) &nbsp;<label id="idCheckTxt"></label></label>
                <input placeholder="사업자등록번호( '─' 제외)" type="text" id="id" name="id">
            </div>
            <div class="field">
                <label>회사(법인)명</label>
                <input placeholder="회사(법인)명" type="text" name="name">
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>비밀번호</label>
                <input placeholder="비밀번호" type="password" id="pw" name="pw">
            </div>
            <div class="field">
                <label>비밀번호확인 &nbsp;<label id="pwCheckTxt"></label></label>
                <input placeholder="비밀번호확인" type="password" id="pwc" name="pwc">
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>대표자명</label>
                <input placeholder="대표자명" type="text" name="ceo">
            </div>
            <div class="field">
                <label>회사이메일 &nbsp;<label id="emailCheckTxt"></label></label>
                <input placeholder="회사이메일" type="text" id="email" name="email">
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>회사전화번호</label>
                <input placeholder="회사전화번호" type="text" name="tel">
            </div>
            <div class="field">
            </div>
        </div>
        <div class="field">
            <div class="field">
                <label>회사주소</label>
                <input placeholder="회사주소" type="text" id="addr" name="addr">
            </div>
        </div>
        <button type="submit" class="ui submit button" id="join"><i class="child icon"></i>신청</button>
        <a class="ui button" href="../../"><i class="undo icon"></i>처음으로</a>
    </form>
    </div>
</div>
</body>
</body>
</html>