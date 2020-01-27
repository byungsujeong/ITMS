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
<div class="content_body">
    <p style="text-align: right">단위:천원(KRW)</p>
    <table class="ui center aligned celled structured table">
        <thead>
        <tr>
            <th colspan="3" rowspan="2">항목</th>
            <th colspan="13">2019년 종합보고</th>
            <th rowspan="2">비고</th>
        </tr>
        <tr>
            <th>1월</th>
            <th>2월</th>
            <th>3월</th>
            <th>4월</th>
            <th>5월</th>
            <th>6월</th>
            <th>7월</th>
            <th>8월</th>
            <th>9월</th>
            <th>10월</th>
            <th>11월</th>
            <th>12월</th>
            <th>합계</th>
        </tr>

        <tbody>
        <tr style="background-color: rgba(0,151,233,0.58);">
            <td colspan="3">수출총액</td>
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
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr style="background-color: rgba(0,0,0,0.42);">
            <td colspan="3">수입총액</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.import_total}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td style="background-color: rgba(0,0,0,0.31)" rowspan="3">제반비용</td>
            <td colspan="2">수입물품대</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.payment}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td colspan="2">관세</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.customs}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td colspan="2">물류비</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.logistical_cost}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td colspan="3">(A)매출총이익<br>(매출액 - 매출원가)</td>
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
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="3">경상지출</td>
            <td rowspan="2">관리비용</td>
            <td>물류비</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.domestic_logistical_cost}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td>기타</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.others}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td colspan="2">합계(B)</td>
            <c:forEach var="row" items="${list}">
                <td><fmt:formatNumber value="${row.manage_total}" pattern="#,###" /></td>
            </c:forEach>
        </tr>
        <tr>
            <td colspan="3">관세환급액(C)</td>
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
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">외환차손익(D)</td>
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
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr style="background-color: #008cd3;">
            <td>경상손익</td>
            <td colspan="2">월중손익<br>(A+B+C+D)</td>
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
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>

    </table>
    <div class="ui right floated small primary labeled icon button">
        <a href="${pageContext.request.contextPath}/pdf"><i class="file pdf icon"></i>PDF보기</a>
    </div>
</div>

</body>
</html>
