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
		$("#update").click(function() {
					$.ajax({
						url:"${pageContext.request.contextPath}/financialMng/transfer/transfer_update_btn",
						type: "POST",
						data:{
							id : $("#id").val(),
							finance_id : $("#finance_id").val(),
							action_type : $("#action_type").val(),
							item : $("#item").val(),
							amount_krw : $("#amount_krw").val(),
							amount_hdc : $("#amount_hdc").val(),
							closed_date : $("#closed_date").val(),
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
    <h1>입출금내역 수정</h1>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>재무고유번호</th>
                <th>입금/출금</th>
                <th>적요</th>
                <th>금액</th>
                <th>수수료(출금시에만 입력)</th>
                <th>날짜</th>
                <th>비고</th>
            </tr></thead>
            <tbody>
            <tr>
                <td><div class="ui icon input"><input type="text" value="${dto.id}" readonly="readonly" id="id"></div></td>
                <td><div class="ui icon input"><input type="text" value="${dto.finance_id}" readonly="readonly" id="finance_id"></div></td>
                <td><select class="ui search dropdown" id="action_type">
                <c:choose>
                	<c:when test="${dto.action_type eq 1 }">
                		<option value="1">입금</option>
	                	<option value="2">출금</option>
                	</c:when>
                	<c:when test="${dto.action_type eq 2 }">
	                	<option value="2">출금</option>
                		<option value="1">입금</option>
                	</c:when>
                </c:choose>
	                </select></td>
	            <td><select class="ui search dropdown" id="item">
	            			<c:choose>
			                	<c:when test="${dto.item eq 1 }">
			                	<option value="1">수입물품대금</option>
			                	</c:when>
			                	<c:when test="${dto.item eq 2 }">
			                	<option value="2">관세</option>
			                	</c:when>
			                	<c:when test="${dto.item eq 3 }">
			                	<option value="3">물류비</option>
			                	</c:when>
			                	<c:when test="${dto.item eq 4 }">
			                	<option value="4">관리물류비</option>
			                	</c:when>
			                	<c:when test="${dto.item eq 5 }">
			                	<option value="5">기타</option>
			                	</c:when>
                			</c:choose>
	                </select></td>
	            <td><div class="input"><input value="${dto.amount_krw }" type="text" id="amount_krw"></div></td>
				<td><div class="input"><input value="${dto.amount_hdc }" type="text" id="amount_hdc"></div></td>
				<td><div class="input"><input value="${dto.closed_date }" type="text" id="closed_date"></div></td>
	            <td><div class="input"><input value="${dto.note }" type="text" id="note"></div></td>
            </tr>
            </tbody>
        </table>
        
		<button class="ui button" id="update">수정</button>
	</form>
    </div>
</div>

</div>
</div>
</body>
</html>