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
<script type="text/javascript">

</script>
    
</head>
<body>
	<page size="A4">


	<div class="content_body">





		<h2 class="ui header">수입상세</h2>
		<div class="ui form segment">
			<div class="two fields">
				<div class="field">
					<table class="ui definition table">
						<h4>구매자(나의정보)</h4>
						<tbody>
							<tr>
								<td>회사명</td>
								<td><c:out value='${comDTO.name}' /></td>
							</tr>
							<tr>
								<td>회사주소</td>
								<td><c:out value='${comDTO.addr}' /></td>
							</tr>
							<tr>
								<td>회사 Tel</td>
								<td>${comDTO.tel }</td>
							</tr>

							<tr>
								<td>담당자</td>
								<td>
									${emDTO.name}
								</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td>${emDTO.tel}</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="field">
					<table class="ui definition table">
						<h4>수입관리정보</h4>
						<tbody>
							<tr>
								<td>인보이스NO.</td>
								<td>${basicDTO.doc_no} </td>
							</tr>
							<tr>
								<td>인보이스발행일</td>
								<td>${basicDTO.issued_date}</td>
							</tr>
							<tr>
								<td>Notes</td>
								<td>${basicDTO.notes }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<div class="two fields">
				<div class="field">
					<table class="ui definition table">
						<h4>판매업체</h4>
						<tbody>
							<tr>
								<td>회사명</td>
								<td>${bsDTO.name}</td>
							</tr>
							<!-- 		</tfoot> -->
							<tr>
								<td>회사주소</td>
								<td>${bsDTO.addr}</td>
							</tr>
							<tr>
								<td>Tel</td>
								<td>${bsDTO.tel}</td>
							</tr>

							<tr>
								<td>담당자</td>
								<td>${cusDTO.name}</td>								</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td>${cusDTO.tel}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="field">
					<table class="ui definition table">
						<h4>협력업체</h4>
						<tbody>
							<tr>
								<td>회사명</td>
								<td>${bsPartnerDTO.name}</td>
							</tr>
							<tr>
								<td>회사주소</td>
								<td>${bsPartnerDTO.addr}</td>
							</tr>
							<tr>
								<td>Tel</td>
								<td>${bsPartnerDTO.tel}</td>
							</tr>
														<tr>
								<td>담당자</td>
								<td>${cusPartnerDTO.name}</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td>${cusPartnerDTO.tel}</td>
							</tr>
							
						</tbody>
					</table>
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
							<th>제품명</th>
							<th>상세규격</th>
							<th>단가</th>
							<th>수량</th>
							<th>소계</th>
						</tr>
					</thead>
					<tbody>
 					<c:forEach items="${detailList}" var="detailList" varStatus="status">
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

	</page>

</body>
</html>