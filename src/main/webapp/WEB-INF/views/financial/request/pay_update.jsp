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
$(function() {
	$("#ok").click(function() {
				$.ajax({
					url:"${pageContext.request.contextPath}/financialMng/request/request_update_btn",
					type: "POST",
					data:{
						id : $("#id").val(),
						amount_krw : $("#amount_krw").val(),
						note : $("#note").val()
					},
					success:function(){
						alert("수정 완료!!");
						opener.location.reload();
						self.close();
					}
						
						
				}); //ajax end
	});//#update click end
	
});
</script>
</head>
<body>

<div class="content_body">
<div class="ui form segment">
    <h1>결제예정 수정</h1>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>PO번호</th>
                <th>항목</th>
                <th>금액(원)</th>
            </tr></thead>
            <tbody>
            <tr>
                <td><div class="ui icon input"><input placeholder="전표번호" type="text" readonly="readonly" id="id" value="${dto.id }"></div></td>
                <td><div class="ui icon input"><input placeholder="PO번호" type="text" readonly="readonly" id="doc_no" value="${dto.doc_no }"></div></td>
                <td><div class="ui icon input"><input placeholder="항목" type="text" id="note" value="${dto.note }"></div></td>
                <td><div class="ui icon input"><input placeholder="금액" type="text" id="amount_krw" value="${dto.amount_krw }"></div></td>
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