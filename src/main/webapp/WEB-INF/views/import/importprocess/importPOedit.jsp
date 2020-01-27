<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<meta charset="UTF-8">
<title>ITMS</title>

<script type="text/javascript">
	var count = 0;
	var employeeEdit = "${emDTO.id}";
	var customerEdit = ${cusDTO.id};
	var notesEdit = "${basicDTO.notes}";
	var qtyEdit = 0;
	$(function() {
		$('#dropEmployee').change(function() {//구매자 (자사)의 담당자 드롭박스 값 변경시
			var employeeID = $('#dropEmployee').val();

			<c:forEach var="employeeList" items="${eList2}" varStatus="status">

			if (employeeID == "${employeeList.id}") {
				var employeeTel = "<c:out value="${employeeList.tel}" />";
				var employeeID = "<c:out value="${employeeList.id}" />";
				$("#employeeTel").text(employeeTel);

			}//if end

			</c:forEach>
			
		});//dropEmployee change end

		$("#dropCustomer").change(
				function() {
					console.log($("#dropCustomer").val());
					$("#customerTel")
							.text(
									$('#dropCustomer option:selected').data(
											"value").tel);

				}); //dropCustomer change end
				
				
				
/*   		$("#dropProduct0").change(function() { //첫번째 제품 등록
  			
			console.log("dropProduct 테스트");
			$("#productCode0").text($('#dropProduct0 option:selected').data("value").code);
			$("#productName0").text($('#dropProduct0 option:selected').data("value").name);
			$("#productSpec0").text($('#dropProduct0 option:selected').data("value").spec);
			$("#productPrice0").text($('#dropProduct0 option:selected').data("value").price);
			}); //dropProduct change end
 */		
		
		$('#btn-add-row').click(
				function() {
					var time = new Date().toLocaleTimeString();
					count = count + 1;
					$('#goodsTable> tbody:last')
							.append(
									' <tr>\n'
											+ '                <td>\n'
											+ '                    <select class="ui search dropdown testDrop" id="dropProduct'+count+'" data-value="'+count+'">\n'
											+'						<option value="">제품 검색</option> \n'


		 									+'<c:forEach var="product" items="${product2}" varStatus="status"> \n'
		 									
											+'<option value="${product.id}" data-value=\'{"code":"${product.code}", "name":"${product.name}", "spec":"${product.spec}","price":"${product.price}"}\'>${product.name}</option>\n'
												
											+'</c:forEach> \n'
											
											+'</select>\n'
											+ '                </td>\n'
											+ '                <td><span id="productCode'+count+'"></span></td>\n'
											+ '                <td><span id="productName'+count+'"></span></td>\n'
											+ '                <td><span id="productSpec'+count+'"></span></td>\n'
											+ '                <td><span id="productPrice'+count+'"></span></td>\n'
											+ '                <td><input placeholder="수량" type="text" class="productInput" id="productInput'+count+'"></td>\n'
											+ '                <td>\n'
											+ '						<span id="productResult'+count+'"></span>\n'
											+ '                </td>\n'
											+ '            </tr>');
					$(document).ready(function() {
						var result = "";
						$(".testDrop").change(function() {
							var dropProductValue = $(this).attr("id");
							var dataValue = $("#"+dropProductValue).data("value");
							$("#productCode"+dataValue).text($('#'+dropProductValue+' option:selected').data("value").code);
							$("#productName"+dataValue).text($('#'+dropProductValue+' option:selected').data("value").name);
							$("#productSpec"+dataValue).text($('#'+dropProductValue+' option:selected').data("value").spec);
							$("#productPrice"+dataValue).text($('#'+dropProductValue+' option:selected').data("value").price);
							}); //testDrop change end
						$(".productInput").keyup(function() {
							var pInputInt= $(this).attr("id").replace(/[^0-9]/g,"");
							var pInputValue = $(this).val();
							var prodPrice= $('#dropProduct'+pInputInt+' option:selected').data("value").price;
							var result = (pInputValue * prodPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							console.log("입력값: "+ pInputValue +"단가: " + prodPrice);
							console.log(result);
							$("#productResult"+pInputInt).text(result);
							this.result = result;
							
						}); //productInput end
						
					}); //doc ready end

				});
				$('#btn-del-row').click(function() { //제품 열 삭제
					$('#goodsTable > tbody:last > tr:last').remove();
					count = count - 1;
				}); //btn-del end
				
				$("#POeditBtn").click(function() {
					if($("#notesInput").val() == "${basicDTO.notes}"){
						console.log("비고란 변경사항 없음");
					}else{
						console.log("비고란 변경");
						notesEdit = $("#notesInput").val();
					} //else end
					
					if($('#dropEmployee option:selected').val() == "${emDTO.id}"){
						console.log("사측 담당자 변경사항 없음.");
					}else{
						console.log("사측 담당자 변경");
						employeeEdit = $('#dropEmployee option:selected').val();
					} //else end
					
					if($('#dropCustomer option:selected').val() == "${cusDTO.id}"){
						console.log("판매측 담당자 변경사항 없음.");
					}else{
						console.log("판매측 담당자 변경");
						customerEdit = $('#dropCustomer option:selected').val();
					}//else 1 end
					
					
 					for (var i = 1; i < count+1; i++) {
 						eval("\n"
 	 				     +" var $form"+i+" = $('<form></form>');\n"
 				    		     +" $form"+i+".attr('action', '${pageContext.request.contextPath}/import/importprocess/importProductInsert2.do'); \n"
 				    		     +" $form"+i+".attr('method', 'get'); \n"
 				    		     +" $form"+i+".attr('target', 'iframe'); \n"
 				    		     +" $form"+i+".appendTo('body'); \n"
 				    		     +" var qtyInput = $('#productInput"+i+"').val(); \n"
 				    		     +" var pID = $(\'#dropProduct"+i+" option:selected\').val(); \n"
 				    		     
 				    		     +" var qty= $(\"<input type=\'hidden\' value=\'\"+qtyInput+\"\' name=\'qty\'>\"); \n"
 				    		     +" var p_id= $(\"<input type=\'hidden\' value=\'\"+pID+\"\' name=\'p_id\'>\"); \n"
 				    		     +" var basic_id= $(\"<input type=\'hidden\' value=\'${basicDTO.id}\' name=\'basic_id\'>\"); \n"

 				    		     +" $form"+i+".append(qty); \n"
 				    		     +" $form"+i+".append(p_id); \n"
 				    		     +" $form"+i+".append(basic_id); \n"
 	  			    		     +" $form"+i+".submit();  \n" //eval end
 	   							 +" console.log(\'"+i+"번째 form 되었어요.\')   \n"	
 	  					);
 						} // for end

					$.ajax({ //수정 ajax
						url: "${pageContext.request.contextPath}/import/importprocess/importPOeditAjax",
						data : {
							notes : notesEdit,
							user_id : employeeEdit,
							c_id : customerEdit,
							id : ${basicDTO.id}
						},
						success : function (result) {
							location.href = "${pageContext.request.contextPath}/import/importprocess/importMain.do"
						} // success end
					});//ajax end 
					
					
					

				}); //POeditBtn click end
				
			$(".delete").click(function() {
				console.log($(this).attr("id"));
				console.log($(this).data("option"));
				var productID = $(this).data("option");
				console.log($(this).parent("tr"));
				$(this).closest("tr").attr('style', "display:none;");
 				$.ajax({
					url : "${pageContext.request.contextPath}/import/importprocess/importPOdetailAjax",
					data: {
						id : productID
					},
					success : function(result) {
						console.log(result);
					}
				}); //ajax end
 				
			}); // delete func end



	}); //func end
</script>

</head>
<body>


	<div class="content_body">


		<form id="importAddOrder"
			action="${pageContext.request.contextPath}/import/importprocess/importAddOrder.do"
			method="get" target="iframe2">
			<input type="hidden" id="com_id" name="com_id"
				value="${companyDTO.id}"> <input type="hidden" id="user_id"
				name="user_id" value=""> <input type="hidden" id="b_id"
				name="b_id" value=""> <input type="hidden" id="c_id"
				name="c_id" value=""> <input type="hidden" id="type_tr"
				name="type_tr" value="2"> <input type="hidden" id="doc_no"
				name="doc_no" value=""> <input type="hidden" id="notes"
				name="notes" value="">
		</form>

		<form id="importAddShip"
			action="${pageContext.request.contextPath}/import/importprocess/importAddShipping.do"
			method="get" target="iframe2">
			<input type="hidden" id="id" name="id" value="0"> <input
				type="hidden" id="basic_id" name="basic_id" value="0"> <input
				type="hidden" id="cb_id" name="cb_id" value="0"> <input
				type="hidden" id="dcb_id" name="dcb_id" value="0"> <input
				type="hidden" id="track_no" name="track_no" value=""> <input
				type="hidden" id="o_from" name="o_from" value=""> <input
				type="hidden" id="o_to" name="o_to" value=""> <input
				type="hidden" id="event" name="event" value="0"> <input
				type="hidden" id="date" name="date" value="">
		</form>

		<div id="nav_html"></div>
		<!--상단,좌측메뉴-->

		<h2 class="ui header">수입신규등록</h2>
		<div class="ui form segment">
			<div class="two fields">
				<div class="field">
					<table class="ui definition table">
						<h4>구매자(기본값:나의정보)</h4>
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
								<td><select class="ui search dropdown" id="dropEmployee">
										<option value="${emDTO.id}">${emDTO.name}</option>
										<c:forEach var="employeeList" items="${eList2}"
											varStatus="status">
											<c:choose>
												<c:when test="${employeeList.id != emDTO.id }">
													<option value="${employeeList.id}">
														${employeeList.name}</option>

												</c:when>
											</c:choose>
										</c:forEach>


								</select></td>


							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><div id="employeeTel"></div></td>
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
								<td>${basicDTO.doc_no}</td>
							</tr>
							<tr>
								<td>인보이스발행일</td>
								<td>${basicDTO.issued_date}</td>
							</tr>
							<tr>
								<td>Notes</td>
								<td><input placeholder="${basicDTO.notes }" type="text" class="productInput"
								id="notesInput" value="${basicDTO.notes }"></td>
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
								<td><select class="ui search dropdown" id="dropCustomer">
										<option value="${cusDTO.id}">${cusDTO.name}</option>
										<c:forEach var="cList" items="${cList}" varStatus="status">

											<c:choose>
												<c:when test="${cList.id != cusDTO.id}">
													<option value="${cList.id}"
														data-value='{"name":"${cList.name}", "tel":"${cList.tel}"}'>
														${cList.name}</option>
												</c:when>
											</c:choose>


										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><span id="customerTel"></span></td>
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
								<td><span id="businessPAddr">${bsPartnerDTO.addr }</span></td>
							</tr>
							<tr>
								<td>Tel</td>
								<td><span id="businessPTel">${bsPartnerDTO.tel}</span></td>
							</tr>
							<tr>
								<td>담당자</td>
								<td>${cusPartnerDTO.name }</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><span id="partnerTel">${cusPartnerDTO.tel }</span></td>
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
							<th colspan="8">Description of Goods</th>
						</tr>
						<tr>
							<th></th>
							<th>제품코드</th>
							<th>제품명</th>
							<th>상세규격</th>
							<th>단가</th>
							<th>수량</th>
							<th>소계</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${detailList}" var="detailList"
							varStatus="status">
							<tr id="tr${status.index}">
								<td>${proList[status.index].name}</td>
								<td>${proList[status.index].code}</td>
								<td>${proList[status.index].name}</td>
								<td>${proList[status.index].spec}</td>
								<td>${proList[status.index].price}</td>
								<td><input placeholder="${detailList.qty }" type="text" class="productInput"
								id="productInput" value="${detailList.qty }"></td>
								<td><span id="result${status.index}">${proList[status.index].price * detailList.qty}</span></td>
								<td><i class="ui button delete" id="delete${status.index}" data-option="${detailList.id}">삭제</i></td>
							</tr>
						</c:forEach>

<%-- 						<tr>
							<td><select class="ui search dropdown testDrop"
								id="dropProduct0">
									<option value="">제품 검색</option>


									<c:forEach var="product" items="${product2}" varStatus="status">
										<option value="${product.id}"
											data-value='{"code":"${product.code}", "name":"${product.name }", "spec":"${product.spec }","price":"${product.price }"}'>${product.name}</option>

									</c:forEach>
							</select></td>
							<td><span id="productCode0"></span></td>
							<td><span id="productName0"></span></td>
							<td><span id="productSpec0"></span></td>
							<td><span id="productPrice0"></span></td>
							<td><input placeholder="수량" type="text" class="productInput"
								id="productInput0"></td>
							<td><span id="productResult0"></span></td>
						</tr>
 --%>					</tbody>
				</table>

				<div class="field">
					<table class="ui definition table">
						<tbody>
							<tr>
								<td colspan="3">합계</td>
								<td colspan="1">총수량: 수량수식</td>
								<td colspan="1">총금액: 금액수식</td>
								<td colspan="1">
									<div class="ui right floated small primary labeled icon button"
										id="resultBtn">
										<i class="pencil alternate icon"></i>수량 금액 확인
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ui left floated icon buttons">
					<button class="ui button" id="btn-add-row">
						<i class="plus icon"></i>
					</button>
					<button class="ui button" id="btn-del-row">
						<i class="minus icon"></i>
					</button>
				</div>
				<div class="ui right floated small primary labeled icon button"
					id="POeditBtn">
					<i class="pencil alternate icon"></i>PO 수정
				</div>
			</div>
		</div>
	</div>
	<iframe name="iframe" style="display: none;"></iframe>
	<iframe name="iframe2" style="display: none;"></iframe>
</body>
</html>






