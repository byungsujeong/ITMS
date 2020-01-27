<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.css">
    <script src="${pageContext.request.contextPath}/resources/include/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.js"></script>
    <title>ITMS</title>
    
<script>
	$(function () {
	/* 	$("#ok").click(function () {
			
		}); */
		
	});	
</script>
</head>
<body>

<div class="content_body">
<div class="ui form segment">
    <h1>결제완료 수정</h1>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>PO번호</th>
                <th>항목</th>
                <th>송금금액(USD or KRW)</th>
                <th>수수료(USD or KRW)</th>
                <th>실송금액(USD or KRW)</th>
            </tr></thead>
            <tbody>
            <tr>
                <td><div class="ui icon input"><input placeholder="전표번호" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="PO번호" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="항목" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="송금금액(USD or KRW)" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="수수료(USD or KRW)" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="실송금액(USD or KRW)" type="text" readonly="readonly"></div></td>
            </tr>
            </tbody>
        </table>

<button class="ui button" id="ok">수정</button>

    </div>
</div>

</div>
</div>
</body>
</html>