<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <%@include file="/WEB-INF/views/include_nav.jsp" %>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
</head>
<body>
<div class="content_body">
    <form name="submitMyReport" method="post" action="${pageContext.request.contextPath}/report/myReport/submitMyReport.do">
        <table class="ui celled table">
            <thead>
            <tr>
                <th colspan="16"><h3 class="ui centered header">신규보고작성</h3></th>
            </tr>
            <tr>
                <th colspan="6"><h4 class="ui centered header">제목</h4></th>
                <th colspan="10">
                    <div class="ui fluid input">
                        <input placeholder="보고서 제목을 입력하세요." type="text" name="title">
                    </div>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th colspan="16">
                    <div class="ui form">
                        <div class="field">
                            <textarea class="form-control" id="p_content" name="content"></textarea>
                            <script type="text/javascript">
                                CKEDITOR.replace('p_content'
                                    , {
                                        height: 450
                                    });
                            </script>
                        </div>
                    </div>
                </th>
            </tr>
            </tbody>
        </table>
        <div class="ui right floated buttons">
            <button class="ui button"><i class="edit icon"></i>등록</button>
        </div>
    </form>
</div>
</body>
</html>
