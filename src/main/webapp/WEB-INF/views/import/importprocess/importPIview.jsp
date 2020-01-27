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
			<div class="left floated eight wide column">
				<h2 class="ui header">Proforma Invoice</h2>

			</div>
			<div class="right floated four wide column">
				어벤져스 주식회사 +82-02-700-7000 <br> 2020-01-05-00:00:00 <br>
				Invoice no. 888-8888-8888
			</div>
		</div>
		<div class="row">
			<div class="ui form segment">
				<div class="two fields">
					<div class="field">
						<table class="ui definition table">
							<h4>구매자</h4>
							<tbody>
								<tr>
									<td>회사명</td>
									<td>성우상사
										</div>
									</td>
								</tr>
							</tfoot>
							<tr>
								<td>회사주소</td>
								<td>빈칸(회사명 검색으로 자동입력)</td>
							</tr>
							<tr>
								<td>담당자</td>
								<td>최지수</td>
							</tr>
							<tr>
								<td>구매처 담당자 연락처</td>
								<td>+82-2-700-0000</td>
							</tr>
							<tr>
								<td>Tel</td>
								<td>빈칸(회사명 검색으로 자동입력)</td>
							</tr>
							</tbody>
						</table>
					</div>
					<div class="field">
						<table class="ui definition table">
							<h4>Ship</h4>
							<tbody>
								<tr>
									<td>도착지</td>
									<td>
중국									</td>
								</tr>
								<tr>
									<td>지불현황</td>
									<td>
50%									</td>
								</tr>
								<tr>
									<td>도착예상시간</td>
									<td>2020-03-05</td>
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
								<th>제조사</th>
								<th>제품명</th>
								<th>상세규격</th>
								<th>단가</th>
								<th>수량</th>
								<th>소계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>A공구</td>
								<td>B사</td>
								<td>Gimin</td>
								<td>규격</td>
								<td>45</td>
								<td>50,000</td>
								<td>수식</td>
							</tr>
							<tr>
								<td>B공구</td>
								<td>C사</td>
								<td>JISOO</td>
								<td>규격</td>
								<td>50</td>
								<td>1,000</td>
								<td>수식</td>
							</tr>
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
	window.print();

</script>
</body>
</html>