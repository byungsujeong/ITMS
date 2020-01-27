<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link rel="stylesheet" type="text/css"
          href="resources/include/Semantic-Master/semantic.css">
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="resources/js/loginCheck.js"></script>
	<title>Home</title>
</head>
<body>
<div class="content_body">
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui teal image header">
            <div class="content">
                사용자 로그인
            </div>
        </h2>
        <form class="ui large form">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="users icon"></i>
                        <input type="text" name="com_id" id="com_id" placeholder="법인코드" value="2138615419">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="id" id="id" placeholder="사용자아이디">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="pw" id="pw" placeholder="비밀번호">
                    </div>
                </div>
                <button type="button" id="login" class="ui fluid large teal submit button">Login</button>
            </div>

            <div class="ui error message">d</div>

        </form>

        <div class="ui message">
            New to us? <a href="user/corporate/register_corp">Sign Up</a>
        </div>
    </div>
</div>
</div>
</body>
</html>
