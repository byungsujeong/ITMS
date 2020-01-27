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
    <h1>입금예정 수정</h1>
    <div class="field">

        <table class="ui celled table" style="width: 500">
            <thead>

            <tr>
                <th>전표번호</th>
                <!-- <th>invoice no.</th>
                <th>수취은행</th>
                <th>계좌정보</th> -->
                <th>예정금액(USD or KRW)</th>
                <th>신청인아이디</th>
                <th>수령인아이디</th>
                <th>상대회사담당자</th>
                <th>항목</th>
                <th>요청한날짜</th>
            </tr></thead>
            <tbody>
            <tr>
                <td><div class="ui icon input"><input placeholder="전표번호" type="text" readonly="readonly"></div></td>
                <!-- <td><div class="ui icon input"><input placeholder="invoice no." type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="수취은행" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="계좌정보" type="text" readonly="readonly"></div></td> -->
                <td><div class="ui icon input"><input placeholder="예정금액(USD or KRW)" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="신청인아이디" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="수령인아이디" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="상대회사담당자" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="항목" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="요청한날짜" type="text"></div></td>
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