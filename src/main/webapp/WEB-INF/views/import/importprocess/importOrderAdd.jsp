<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	$(document).ready(function() {
		var customerList = new Array();
		var businessList = new Array();
		var businessPList = new Array();
		var partnerList = new Array();
		var date = new Date();
		var user_id;
		var b_id = 0;
		var c_id;
		var businessID;
		var partnerID;
		var com_id = ${companyDTO.id};
        var currentDate = date.getFullYear() + "년 " + ( date.getMonth() + 1 ) + "월 " + date.getDate() + "일";
        var count = 0;
		
		<c:forEach var="businessList" items="${businessAList}" varStatus="status">
			 businessList[${status.index}] = {"name":"<c:out value="${businessList.name}" />", "tel":"<c:out value="${businessList.tel}" />", 
					 "addr":"<c:out value="${businessList.addr}" />", "id":"<c:out value="${businessList.id}" />"		 
			 };
		 </c:forEach>
		 
		 <c:forEach var="businessPList" items="${businessPList}" varStatus="status">
		 businessPList[${status.index}] = {"name":"<c:out value="${businessPList.name}" />", "tel":"<c:out value="${businessPList.tel}" />", 
				 "addr":"<c:out value="${businessPList.addr}" />", "id":"<c:out value="${businessPList.id}" />"		 
		 };
		 </c:forEach>
			 

		
		$("#nav_html").load("nav.html");
		$('.ui.dropdown').dropdown();
		
		$('#dropEmployee').dropdown({onChange(value, text, selItem) { //구매자 (자사)의 담당자 드롭박스 값 변경시
			var employeeName = $('#dropEmployee').dropdown('get value');
			
			 <c:forEach var="employeeList" items="${employeeList}" varStatus="status">

			 if(employeeName == "<c:out value="${employeeList.name}" />"){
				 var employeeTel = "<c:out value="${employeeList.tel}" />";
				 var employeeID= "<c:out value="${employeeList.id}" />";
				 $("#employeeTel").text(employeeTel);
				 $("#user_id").val(employeeID);
				 user_id = employeeID;
				 
				 
				 
			 }

			 </c:forEach>
		}});
		
		$('#dropBusiness').dropdown({onChange(value, text, selItem) { //판매업체 드롭박스 값 변경시


			businessID = $('#dropBusiness').dropdown('get value');
			console.log("판매처아이디"+businessID)
			for (var i = 0; i < businessList.length; i++) {
				if(businessID == businessList[i].id){ //판매업체 리스트와 드롭박스의 value 값이 일치시
					$("#businessTel").text(businessList[i].tel);
					$("#businessAddr").text(businessList[i].addr);
				}
			}
	 						$("#dropCustomer").html("");

	 			$.ajax({ // 판매업체 드롭박스 선택한 담당자 검색 ajax
	 				url: "${pageContext.request.contextPath}/import/importprocess/importAJaxCustomer.do",
	 			    traditional : true,
	 				type: "POST",
	 				data: {
	 					com_id : '${companyDTO.id}',
	 					b_id : businessID
	 				},
	 				success: function(data) {
	 					$("#dropCustomer").append("<option value=''>담당자를 선택하세요</option>");
	 					for (var i = 0; i < data.length; i++) { // 판매업체의 담당자 드롭박스 항목 루프문
							$("#dropCustomer").append("<option value="+data[i].id+">"+data[i].name+"</option>");
							customerList[i] = data[i];
							console.log(customerList[i]);
						} //sucs for end
	 				}// success end
	 			});//ajax end

		}//business dropdown end
		
		}); //+++
		
		$("#dropCustomer").change(function() { //판매자 담당자 드롭박스 변경시
			console.log("@customer 드롭다운 값: "+$(this).val());
			var value = $("#dropCustomer option:selected").val();
			console.log(value);
			
			for (var i = 0; i < customerList.length; i++) { 
				console.log("customerList 값: " + customerList[i].tel); 
				if($(this).val() == customerList[i].id){ //담당자의 드롭박스 아이디와 customerList[i].id 값과 같을시
					$("#customerTel").text(customerList[i].tel);
					c_id = customerList[i].id;
				}
			}
			
		}); //dropCustomer end 
		
		$('#dropPBusiness').change(function() { //협력업체 드롭박스
			console.log($(this).val());
			for (var i = 0; i < businessPList.length; i++) {
				if($(this).val() == businessPList[i].id){
					$("#businessPAddr").text(businessPList[i].addr);
					$("#businessPTel").text(businessPList[i].tel);
					$("#cb_id").val(businessPList[i].id);
					partnerID = businessPList[i].id;
					
				}
			}
			
 			$.ajax({ // 판매업체 드롭박스 선택한 담당자 검색 ajax
 				url: "${pageContext.request.contextPath}/import/importprocess/importAJaxCustomer.do",
 			    traditional : true,
 				type: "POST",
 				data: {
 					com_id : '${companyDTO.id}',
 					b_id : partnerID
 				},
 				success: function(data) {
 					for (var i = 0; i < data.length; i++) { // 판매업체의 담당자 드롭박스 항목 루프문
 						console.log("ajax partnerID 테스트" + data[i].name);
						$("#dropPartner").append("<option value="+data[i].id+">"+data[i].name+"</option>");
						partnerList[i] = data[i];
					} //sucs for end
 				}// success end
 			});//ajax end

		}); // 협력업체 드롭박스 end
		
		$("#dropPartner").change(function() { //협력업체 담당자 드롭박스
			console.log("협력업체 담당자 드롭박스 확인");
			for (var i = 0; i < partnerList.length; i++) {
				if(partnerList[i].id == $(this).val()){
					console.log("협력업체 담당자 드롭박스 if값 확인");
					$("#partnerTel").text(partnerList[i].tel);
					$("#dcb_id").val(partnerList[i].id);
				}
			}
		}); //협력업체 담당자 드롭박스 end
		
  		$("#dropProduct0").change(function() { //첫번째 제품 등록
  			
			console.log("dropProduct 테스트");
			$("#productCode0").text($('#dropProduct0 option:selected').data("value").code);
			$("#productName0").text($('#dropProduct0 option:selected').data("value").name);
			$("#productSpec0").text($('#dropProduct0 option:selected').data("value").spec);
			$("#productPrice0").text($('#dropProduct0 option:selected').data("value").price);
			}); //dropProduct change end
			

		$(".productInput").keyup(function() {
			var pInputInt= $(this).attr("id").replace(/[^0-9]/g,"");
			var pInputValue = $(this).val();
			var prodPrice= $('#dropProduct'+pInputInt+' option:selected').data("value").price;
			var result = (pInputValue * prodPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			console.log("입력값: "+ pInputValue +"단가: " + prodPrice);
			console.log(result);
			$("#productResult"+pInputInt).text(result);
			
		}); //productInput end

 
		$("#invoiceDate").text(currentDate); //인보이스 날짜 자동출력
		
		
		
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


		 										<c:forEach var="product" items="${productList}" varStatus="status">
											+'<option value="${product.id}" data-value=\'{"code":"${product.code}", "name":"${product.name}", "spec":"${product.spec}","price":"${product.price}"}\'>${product.name}</option>\n'
												</c:forEach>
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
						
						function result() {
							return this.result;
						} // var func end

					}); //doc ready end
				});
				$('#btn-del-row').click(function() { //제품 열 삭제
					$('#goodsTable > tbody:last > tr:last').remove();
					count = count - 1;
				}); //btn-del end
 				
				$("#importInsertBtn").click(function () { //수입신규등록 버튼 누를 시
					console.log("누름");
					var doc_no  = $("#invoiceInput").val(); //수입번호 input 변수에 저장
					var notes = $("#notesInput").val(); //비고 input 변수에 저장
					$("#doc_no").val(doc_no); //form hidden 삽입
					$("#notes").val(notes); //form hidden 삽입
 					
					$.ajax({ // basic_trade 테이블 삽입 ajax
							url: "${pageContext.request.contextPath}/import/importprocess/importAddOrderAjax.do",
						    traditional : true,
							type: "POST",
							async: false,
							data: {
								doc_no : doc_no,
 								notes : notes,
								user_id : user_id,
								b_id : businessID,
								c_id : c_id,
								type_tr : 2,
								com_id : com_id
 							},
							success: function(data) {

								console.log(data);
							}// success end
						});//ajax end
 
 					for (var i = 0; i < count+1; i++) {
					eval("\n"
 				     +" var $form"+i+" = $('<form></form>');\n"
			    		     +" $form"+i+".attr('action', '${pageContext.request.contextPath}/import/importprocess/importProductInsert.do'); \n"
			    		     +" $form"+i+".attr('method', 'get'); \n"
			    		     +" $form"+i+".attr('target', 'iframe'); \n"
			    		     +" $form"+i+".appendTo('body'); \n"
			    		     +" var qtyInput = $('#productInput"+i+"').val(); \n"
			    		     +" var pID = $(\'#dropProduct"+i+" option:selected\').val(); \n"
			    		     
			    		     +" var qty= $(\"<input type=\'hidden\' value=\'\"+qtyInput+\"\' name=\'qty\'>\"); \n"
			    		     +" var p_id= $(\"<input type=\'hidden\' value=\'\"+pID+\"\' name=\'p_id\'>\"); \n"

			    		     +" $form"+i+".append(qty); \n"
			    		     +" $form"+i+".append(p_id); \n"
  			    		     +" $form"+i+".submit();  \n" //eval end
   							 +" console.log(\'"+i+"번째 form 되었어요.\')   \n"	
  					);
					} // for end
					
					$("#importAddShip").submit();
					
 				    }); //importInsertBtn end
 				    		
 				    $("#resultBtn").click(function () {
  				    	var qtyInput = $("#productInput"+count).val();
		    		    var pID = $("#dropProduct"+count+" option:selected").val();
 				    	console.log("테스트: " + qtyInput + " .. " + pID);

 						
 				    }); //resultBtn click end

}); // func end

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
			<input type="hidden" id="id" name="id" value="0"> <input type="hidden"
				id="basic_id" name="basic_id" value="0"> <input type="hidden"
				id="cb_id" name="cb_id" value="0"> <input type="hidden" id="dcb_id"
				name="dcb_id" value="0"> <input type="hidden" id="track_no"
				name="track_no" value=""> <input type="hidden" id="o_from"
				name="o_from" value=""> <input type="hidden" id="o_to" name="o_to" value="">
			<input type="hidden" id="event" name="event" value="0"> <input
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
								<td><c:out value='${companyDTO.name}' /></td>
							</tr>
							<tr>
								<td>회사주소</td>
								<td><c:out value='${companyDTO.addr}' /></td>
							</tr>
							<tr>
								<td>회사 Tel</td>
								<td>${companyDTO.tel }</td>
							</tr>

							<tr>
								<td>담당자</td>
								<td>
									<div class="ui selection dropdown" id="dropEmployee">
										<input type="hidden" name="gender"> <i
											class="dropdown icon"></i>
										<div class="default text"></div>
										<div class="menu">

											<c:forEach var="employeeList" items="${employeeList}"
												varStatus="status">

												<div class="item" data-value="${employeeList.name}">
													<c:out value="${employeeList.name}" />

												</div>
											</c:forEach>
										</div>
									</div>
								</td>
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
								<td><input placeholder="Invoice no" type="text"
									id="invoiceInput"></td>
							</tr>
							<tr>
								<td>인보이스발행일</td>
								<td><span id="invoiceDate"></span></td>
							</tr>
							<tr>
								<td>Notes</td>
								<td><input placeholder="비고란" type="text" id="notesInput"></td>
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
								<td>
									<div class="ui selection dropdown" id="dropBusiness">
										<input type="hidden" name="BusinessName"> <i
											class="dropdown icon"></i>
										<div class="default text"></div>
										<div class="menu">

											<c:forEach var="businessList" items="${businessAList}"
												varStatus="status">

												<div class="item" data-value="${businessList.id}">
													<c:out value="${businessList.name}" />

												</div>
											</c:forEach>
										</div>
									</div>
								</td>
							</tr>
							<!-- 		</tfoot> -->
							<tr>
								<td>회사주소</td>
								<td><div id="businessAddr"></div></td>
							</tr>
							<tr>
								<td>Tel</td>
								<td><div id="businessTel"></div></td>
							</tr>

							<tr>
								<td>담당자</td>
								<td>
									<!-- 									<div class="ui selection dropdown" id="dropCustomer">
										<input type="hidden" name="customer"> <i
											class="dropdown icon"></i>
										<div class="default text"></div>
										<div class="menu" id="customerSelect"></div>
									</div>
 --> <select class="ui search dropdown" id="dropCustomer">
										<option value="">담당자 검색</option>
								</select>
								</td>
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
								<td><select class="ui search dropdown" id="dropPBusiness">
										<option value="">협력업체 검색</option>


										<c:forEach var="businessPList" items="${businessPList}"
											varStatus="status">
											<option value="${businessPList.id}">${businessPList.name}</option>

										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>회사주소</td>
								<td><span id="businessPAddr"></span></td>
							</tr>
							<tr>
								<td>Tel</td>
								<td><span id="businessPTel"></span></td>
							</tr>
							<tr>
								<td>담당자</td>
								<td><select class="ui search dropdown" id="dropPartner">
										<option value="">담당자 검색</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><span id="partnerTel"></span></td>
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
							<td><select class="ui search dropdown testDrop"
								id="dropProduct0">
									<option value="">제품 검색</option>


									<c:forEach var="product" items="${productList}"
										varStatus="status">
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
					</tbody>
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
					id="importInsertBtn">
					<i class="pencil alternate icon"></i>수출신규등록
				</div>
			</div>
		</div>
	</div>
	<iframe name="iframe" style="display: none;"></iframe>
	<iframe name="iframe2" style="display: none;"></iframe>
</body>
</html>






