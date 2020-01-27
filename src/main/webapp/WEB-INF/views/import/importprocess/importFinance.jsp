<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<title>ITMS</title>
<script type="text/javascript">
	$(function() {
		console.log("페이지로딩용");
		console.log("페이지로딩용");
		$("#bsDropdown")
				.change(
						function() {
							$("#dropCustomer").html("");
							var selected = $("#bsDropdown option:selected")
									.val();

							if (selected == "${bsDTO.id}") {
								$("#dropCustomer")
										.append(
												"<option value='${cusDTO.id}'>${cusDTO.name}</option>");
								$("#CPtel").text("${cusDTO.tel}");
								$("#detail_cb_id").val("${cusDTO.id}");
								$("#cb_id").val("${bsDTO.id}");
							} else {
								$("#dropCustomer")
										.append(
												"<option value='${cusPartnerDTO.id}'>${cusPartnerDTO.name}</option>");
								$("#CPtel").text("${cusPartner.tel}");
								$("#detail_cb_id").val("${cusPartner.id}");
								$("#cb_id").val("${bsPartnerDTO.id}");
							}
						});//bsDd change end

						
		$("#btn").click(function() {
			$("#amount_krw").val($("#sum").val());
			$("#note").val($("#noteInput").val());
			$("form").submit();
		});//btn click
	}); //func end
</script>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/import/importprocess/importFinanceRequest" method="POST">
		<input type="hidden" name="com_id" id="com_id" value="${comDTO.id}"> <input
			type="hidden" name="basic_id" id="basic_id" value="${basicDTO.id}"> <input
			type="hidden" name="request_id" id="request_id" value="${temporaryEmployeeID}"> <input
			type="hidden" name="cb_id" id="cb_id"> <input type="hidden"
			name="detail_cb_id" id="detail_cb_id"> <input type="hidden"
			name="issued_date" id="issued_date"> <input type="hidden"
			name="amount_krw" id="amount_krw" > <input type="hidden"
			name="note" id="note">
	</form>

	<div class="content_body">

		<div class="row">
			<div class="ui grid">
				<div class="left floated four wide column">
					<h2 class="ui header">재무요청</h2>

				</div>
				<div class="right floated four wide column"></div>
			</div>
			<div class="row">
				<div class="ui form segment">
					<div class="two fields">
						<div class="field">
							<table class="ui definition table">
								<h4>신청인</h4>
								<tbody>
									<tr>
										<td>신청인아이디</td>
										<td>${temporaryEmployeeID}</td>
									</tr>
								</tfoot>
								<tr>
									<td>회사아이디</td>
									<td>${comDTO.name}</td>
								</tr>
								<tr>
									<td>거래아이디</td>
									<td>${basicDTO.doc_no}</td>
								</tr>
								</tbody>
							</table>
						</div>
						<div class="field">
							<table class="ui definition table">
								<tbody>
									<tr>
										<td>상대회사아이디</td>
										<td><select class="ui search dropdown" id="bsDropdown">
												<option value="">거래처/협력업체 검색</option>
												<option value="${bsDTO.id}">거래처: ${bsDTO.name}</option>
												<option value="${bsPartnerDTO.id}">협력업체:
													${bsPartnerDTO.name}</option>

										</select></td>
									</tr>
									<tr>
										<td>상대담당자아이디</td>
										<td><select class="ui search dropdown" id="dropCustomer">
										</select></td>
									</tr>
									<tr>
										<td>담당자 연락처</td>
										<td><span id="CPtel"></span></td>
									</tr>

									<tr>
										<td>금액</td>
										<td>
											<div class="ui icon input">
												<input id="sum" placeholder="금액" type="text">
											</div>
										</td>
									</tr>

									<tr>
										<td>비고</td>
										<td>
											<div class="ui icon input">
												<input id="noteInput" placeholder="비고" type="text">
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>

					</div>
				</div>
						<div class="ui right floated primary labeled icon button" id="btn">
							<i class="pencil alternate icon"></i>요청
						</div>
			</div>
		</div>



	</div>


	<script>
		
	</script>
</body>
</html>