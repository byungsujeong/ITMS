<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
       <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
        <style>
body {
	background: rgb(204, 204, 204);
}

page {
	background: white;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}

page[size="A4"] {
	width: 21cm;
	height: 29.7cm;
}

@media print {
	body, page {
		margin: 0;
		box-shadow: 0;
	}
}
</style>
    
</head>
<body>


<div class="content_body">


	<page size="A4">
		<div class="row">
			<div class="ui grid">
				<div class="left floated four wide column">
					<h2 class="ui header">CL</h2>

				</div>
				<div class="right floated four wide column">
					${comDTO.name} +82 ${comDTO.tel}<br> ${basicDTO.issued_date}<br>
					Invoice no. ${basicDTO.doc_no}
				</div>
			</div>
			<div class="row">
				<div class="ui form segment">
					<div class="two fields">
						<div class="field">
							<table class="ui definition table">
								<h4>판매자</h4>
								<tbody>
									<tr>
										<td>회사명</td>
										<td>${bsDTO.name}</td>
									</tr>
								</tfoot>
								<tr>
									<td>회사주소</td>
									<td>${bsDTO.addr}</td>
								</tr>
								<tr>
									<td>담당자</td>
									<td>${cusDTO.name}</td>
								</tr>
								<tr>
									<td>담당자 연락처</td>
									<td>${cusDTO.tel}</td>
								</tr>
								<tr>
									<td>Tel</td>
									<td>${bsDTO.tel}</td>
								</tr>
								</tbody>
							</table>
						</div>
						<div class="field">
						<form action="${pageContext.request.contextPath}/import/importprocess/importShipPIedit.do" id="formShip">
							<table class="ui definition table">
							<input type="hidden" name="id" value="${shipDTO.id}">
							<input type="hidden" name="basic_id" value="${basicDTO.id}">
								<h4>Ship</h4>
								<tbody>
									<tr>
										<td>운송추적번호</td>
										<td>${shipDTO.track_no}</td>
									</tr>

									<tr>
										<td>출발지</td>
										<td>${shipDTO.o_from}</td>
									</tr>
									<tr>
										<td>도착지</td>
										<td>${shipDTO.o_to}</td>
									</tr>
								</tbody>
							</table>
							</form>
						</div>
					</div>
					<br>
					<div class="field">
						<label>주문상세내역</label>
						<table class="ui celled table" id="goodsTable">
							<thead>
								<tr>
									<th colspan="7">Description of Goods</th>
								</tr>
								<tr>
									<th>제품코드</th>
									<th>제조사</th>
									<th>제품명</th>
									<th>상세규격</th>
									<th>단가</th>
									<th>수량</th>
									<th>소계</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${detailList}" var="detailList"
									varStatus="status">
									<tr>
										<td>${proList[status.index].code}</td>
										<td>${proList[status.index].name}</td>
										<td>${proList[status.index].spec}</td>
										<td>${proList[status.index].price}</td>
										<td>${detailList.qty }</td>
										<td><span id="result${status.index}">${proList[status.index].price * detailList.qty}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="field">
							<table class="ui definition table">
								<tbody>
									<tr>
										<td colspan="4">합계</td>
										<td colspan="1">총수량: 수량수식</td>
										<td colspan="1">총금액: 금액수식</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>





	</page>



</div>


<script>
</script>
</body>
</html>