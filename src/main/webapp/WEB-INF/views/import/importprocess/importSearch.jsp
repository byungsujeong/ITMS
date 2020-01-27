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
<script>
	$(function() {
		var idValue = "";
		$("#importOrderAdd")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/import/importprocess/importOrder.do";
						}); // click end
		$(".ui button")
				//각각 아이콘 메뉴 버튼 클릭시
				.click(
						function() {
							console.log("클릭");
							var clickData = $(this).data("option")

							location.href = "${pageContext.request.contextPath}/import/importprocess/import"
									+ clickData.process
									+ clickData.category
									+ ".do?basicID=" + clickData.basicID;
						}); // click end

		<c:forEach var="tradeList" items="${tradeFileList}">
		console.log("${tradeList}");
		</c:forEach>

		$("#searchIcon").click(function() {
			var doc_no = $("#searchInput").val();
			location.href = "${pageContext.request.contextPath}/import/importprocess/importSearch.do?doc_no="+doc_no;
		});//search icon click end
	}); //func end
</script>


</head>
<body>


	<div class="content_body">
		<h2>수입관리</h2>
		<table>
			<tr>
				<td>
					<div class="ui icon input">
						<i class="search icon"></i> <input type="text"
							placeholder="Search..." id="searchInput">
					</div>
				</td>
				<td>
					<div class="ui blue icon button" id="searchIcon">
						<i class="search icon"></i>검색
					</div>
				</td>

				<td>
					<div class="ui blue icon button" id="importOrderAdd">
						<i class="pencil alternate icon"></i>발주등록
					</div>
				</td>

			</tr>
		</table>

		<br>
		<div class="ui styled fluid accordion">
			<div>
				<c:forEach var="tlist" items="${tlist}" varStatus="status">
					<c:choose>
						<c:when test="${tlist.type_file == 1 }">

							<div class="title">
								<i class="dropdown icon"></i> 수입번호: ${tlist.doc_no}
							</div>
							<div class="content">
								<div class="ui ordered steps">
									<div class="completed step">

										<div class="content">

											<div class="title">PO</div>

											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="active step">
										<div class="content">
											<div class="title">PI</div>
											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="ui steps">
										<div class="content">
											<table class="ui celled table" id="goodsTable"
												style="max-height: 100px; overflow-x: scroll;">
												<thead>
													<tr>
														<th>item</th>
														<th>amount</th>
														<th>재무확인일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="flist" items="${flist}" varStatus="st">
														<c:choose>
															<c:when test="${tlist.basic_id eq flist.basic_id}">
																<tr>
																	<td>${flist.note}</td>
																	<td>${flist.amount_krw}KRW</td>
																	<td>${flist.receive_date}</td>
																</tr>
															</c:when>


														</c:choose>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>



								</div>
								<i class="big disabled window close outline icon"></i>
							</div>

						</c:when>
						<c:when test="${tlist.type_file == 2 }">
							<div class="title">
								<i class="dropdown icon"></i> 수입번호: ${tlist.doc_no}
							</div>
							<div class="content">
								<div class="ui ordered steps">
									<div class="completed step">

										<div class="content">

											<div class="title">PO</div>

											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="completed step">
										<div class="content">
											<div class="title">PI</div>
											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="active step">
										<div class="content">
											<div class="title">CI/PL</div>
											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>





									<div class="ui steps">
										<div class="content">
											<table class="ui celled table" id="goodsTable"
												style="max-height: 100px; overflow-x: scroll;">
												<thead>
													<tr>
														<th>item</th>
														<th>amount</th>
														<th>재무확인일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="flist" items="${flist}" varStatus="st">
														<c:choose>
															<c:when test="${tlist.basic_id eq flist.basic_id}">
																<tr>
																	<td>${flist.note}</td>
																	<td>${flist.amount_krw}KRW</td>
																	<td>${flist.receive_date}</td>
																</tr>
															</c:when>


														</c:choose>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>


								</div>
								<i class="big disabled window close outline icon"></i>
							</div>

						</c:when>

						<c:when test="${tlist.type_file == 3 }">
							<div class="title">
								<i class="dropdown icon"></i> 수입번호: ${tlist.doc_no}
							</div>
							<div class="content">
								<div class="ui ordered steps">
									<div class="completed step">

										<div class="content">

											<div class="title">PO</div>

											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"PO","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="completed step">
										<div class="content">
											<div class="title">PI</div>
											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"PI","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="completed step">
										<div class="content">
											<div class="title">CI/PL</div>
											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"CIPL","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="active step">
										<div class="content">
											<div class="title">운송</div>
											<%-- 											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													data-option='{"basicID":"${tlist.basic_id}","process":"trans","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													data-option='{"basicID":"${tlist.basic_id}","process":"trans","category":"print"}'>
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													data-option='{"basicID":"${tlist.basic_id}","process":"trans","category":"edit"}'>
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													data-option='{"basicID":"${tlist.basic_id}","process":"trans","category":"finance"}'>
													<i class="upload icon"></i>
												</button>

											</div>
 --%>
										</div>
									</div>



									<div class="ui steps">
										<div class="content">
											<table class="ui celled table" id="goodsTable"
												style="max-height: 100px; overflow-x: scroll;">
												<thead>
													<tr>
														<th>item</th>
														<th>amount</th>
														<th>재무확인일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="flist" items="${flist}" varStatus="st">
														<c:choose>
															<c:when test="${tlist.basic_id eq flist.basic_id}">
																<tr>
																	<td>${flist.note}</td>
																	<td>${flist.amount_krw}KRW</td>
																	<td>${flist.receive_date}</td>
																</tr>
															</c:when>


														</c:choose>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>


								</div>
								<i class="big disabled window close outline icon"></i>
							</div>

						</c:when>

						<c:when test="${tlist.type_file == 4 }">

							<div class="title">
								<i class="dropdown icon"></i> 수입번호: ${tlist.doc_no}
							</div>
							<div class="content">
								<div class="ui ordered steps">
									<div class="completed step">

										<div class="content">

											<div class="title">PO</div>

											<div class="ui small basic icon buttons">
												<button class="ui button" data-content="상세보기"
													id="IM001POdetail"
													data-option='{"no":"001","process":"PO","category":"detail"}'>
													<i class="file icon"></i>
												</button>
												<button class="ui button" data-content="프린트"
													id="IM001POprint">
													<i class="save icon"></i>
												</button>
												<button class="ui button" data-content="등록/수정"
													id="IM001POedit">
													<i class="edit icon"></i>
												</button>
												<button class="ui button" data-content="재무팀요청"
													id="IM001POfina">
													<i class="upload icon"></i>
												</button>

											</div>
										</div>
									</div>

									<div class="completed step">
										<div class="content">
											<div class="title">PI</div>
											<div class="ui disabled icon input">
												<i class="search icon"></i> <input value="내용조회"
													type="button">
											</div>
											<button class="ui grey basic button">입금요청</button>
										</div>
									</div>


								</div>
								<i class="big disabled window close outline icon"></i>
							</div>


						</c:when>


					</c:choose>
				</c:forEach>



				<!-- 				<div class="active title">
					<i class="dropdown icon"></i> 수입번호: 001
				</div>

				<div class="active content">
					<div class="ui ordered steps">

						<div class="completed step">

							<div class="content">

								<div class="title">PO</div>

								<div class="ui small basic icon buttons">
									<button class="ui button" data-content="상세보기"
										id="IM001POdetail"
										data-option='{"no":"001","process":"PO","category":"detail"}'>
										<i class="file icon"></i>
									</button>
									<button class="ui button" data-content="프린트" id="IM001POprint">
										<i class="save icon"></i>
									</button>
									<button class="ui button" data-content="등록/수정" id="IM001POedit">
										<i class="edit icon"></i>
									</button>
									<button class="ui button" data-content="재무팀요청" id="IM001POfina">
										<i class="upload icon"></i>
									</button>

								</div>
							</div>
						</div>

						<div class="completed step">
							<div class="content">
								<div class="title">PI</div>
								<div class="ui small basic icon buttons">
									<button class="ui button">
										<i class="file icon"></i>
									</button>
									<button class="ui button">
										<i class="save icon"></i>
									</button>
									<button class="ui button">
										<i class="edit icon"></i>
									</button>
									<button class="ui button">
										<i class="upload icon"></i>
									</button>

								</div>

							</div>
						</div>

						<div class="completed step">
							<div class="content">
								<div class="title">PL/CI</div>
								<div class="ui small basic icon buttons">
									<button class="ui button">
										<i class="file icon"></i>
									</button>
									<button class="ui button">
										<i class="save icon"></i>
									</button>
									<button class="ui button">
										<i class="edit icon"></i>
									</button>
									<button class="ui button">
										<i class="upload icon"></i>
									</button>

								</div>
							</div>
						</div>

						<div class="active step">
							<div class="content">
								<div class="title">물류처리</div>
								<div class="ui small basic icon buttons">
									<button class="ui button">
										<i class="file icon"></i>
									</button>
									<button class="ui button">
										<i class="save icon"></i>
									</button>
									<button class="ui button">
										<i class="edit icon"></i>
									</button>
									<button class="ui button">
										<i class="upload icon"></i>
									</button>

								</div>
							</div>
						</div>
						<div class="ui steps">
							<div class="content">
								<table class="ui celled table" id="goodsTable"
									style="max-height: 100px; overflow-x: scroll;">
									<thead>
										<tr>
											<th>item</th>
											<th>amount</th>
											<th>재무확인일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>관세</td>
											<td>50,000 USD</td>
											<td>2020-02-02</td>
										</tr>
										<tr>
											<td>물품관리비</td>
											<td>1,000 USD</td>
											<td>2020-02-02</td>
										</tr>
										<tr>
											<td>물품관리비</td>
											<td>2,000 USD</td>
											<td>2020-02-02</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>


					</div>
					<i class="big disabled window close outline icon"></i>
				</div>

				<div class="title">
					<i class="dropdown icon"></i> 수입번호: 005
				</div>
				<div class="content">
					<div class="ui ordered steps"></div>
					<i class="big disabled window close outline icon"></i>
				</div>
 -->



			</div>
		</div>
	</div>


</body>
</html>