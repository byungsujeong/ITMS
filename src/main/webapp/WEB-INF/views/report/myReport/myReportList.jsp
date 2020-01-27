<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp" %>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
    <script>
        let no = 1;

        function x() {
            no = no + 1;
        }
    </script>
</head>
<body>
<div class="content_body">
    <table class="ui celled table">
        <thead>
        <tr>
            <th colspan="16"><h3 class="ui centered header">나의보고서</h3></th>
        </tr>
        <tr>
            <th colspan="1">NO</th>
            <th colspan="11">제목</th>
            <th colspan="2">작성일</th>
            <th colspan="2">선택</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="row" items="${list}">
            <tr>
                <th colspan="1">
                    <script>document.write(no);</script>
                </th>
                <script>x()</script>
                <th colspan="11"><a
                        href="${pageContext.request.contextPath}/report/myReport/detail/${row.id}">${row.title}</a></th>
                <th colspan="2"><fmt:formatDate value="${row.issued_date}"
                                                pattern="yyyy-MM-dd"/></th>
                <th colspan="2">
                    <div class="ui buttons">
                        <button class="ui button" id="print">
                                출력</button>
                    </div>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="ui right floated primary labeled icon button" id="btnNew">
        <i class="edit icon"></i>신규등록
    </div>
</div>
<script>
    $(function () {
        $("#btnNew").click(function () {
            location.href = "${pageContext.request.contextPath}/report/myReport/myReportNew.do"
        });
    });

</script>
</body>
</html>
