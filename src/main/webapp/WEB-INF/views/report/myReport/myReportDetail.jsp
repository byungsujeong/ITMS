<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp" %>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
</head>
<body>
<form id="editAnd Del" name="editAndDel" method="post">
    <div class="content_body">
        <table class="ui celled table">
            <thead>
            <tr>
                <th colspan="16"><h3 class="ui centered header">${dto.title}</h3></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th colspan="16">
                    <div class="ui form">
                        <div class="field">
                            <div class="form-control">${dto.content}</div>
                        </div>
                    </div>
                </th>
            </tr>
            </tbody>
        </table>
        <input type="hidden" name="id" value="${dto.id}">
        <div class="ui buttons">
            <button class="ui button" type="button" id="edit">
                수정
            </button>
            <button class="ui button" type="button" id="del">
                삭제
            </button>
        </div>
    </div>
</form>
<script>
    $(function () {
        $("#edit").click(function () {
            document.editAndDel.action = "${pageContext.request.contextPath}/report/myReport/edit/${dto.id}";
            document.editAndDel.submit();
        });
        $("#del").click(function () {
            if (confirm("삭제하시겠습니까?")){
                location.href = "${pageContext.request.contextPath}/report/myReport/del/${dto.id}";
            }
        });
    })
</script>
</body>
</html>
