<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
    
<script>
	$(function () {		
		var count = 0;
		var balance = 0;
		
		 <c:forEach items="${list}" var="dto">
		 	<c:choose>
		 	<c:when test="${dto.action_type eq 1}">
		 		balance = balance + ${dto.amount_krw};
		 	</c:when>
			<c:when test="${dto.action_type eq 2}">
		 		balance = balance - ${dto.amount_krw+dto.amount_hdc};
		 	</c:when>
		 	</c:choose>
		 </c:forEach>
		 
		 $("#balance").text("현재잔액 : " + balance+ "원" );
		
		$("#insertBtn").click(function() {
			for (var i = 0; i < count+1; i++) {
					$.ajax({
						url:"${pageContext.request.contextPath}/financialMng/transfer/insertAll",
						async:false,
						type: "POST",
						data:{
							finance_id : $("#finance_id"+i).val(),
							action_type : $("#action_type"+i).val(),
							item : $("#item"+i).val(),
							amount_krw : $("#amount_krw"+i).val(),
							amount_hdc : $("#amount_hdc"+i).val(),
							note : $("#note"+i).val()
						},
						success:function(){
							console.log("ajax success!!!");
							location.reload();
				}
							
							
					}); //ajax end
			} //for end
			
							alert("입출금내역이 등록되었습니다.");
			
 		});//insertBtn end
 		
// 		$(".rq").change(function() {
//  			var dropID = $(this).attr("id");
// 			var krw = $("#"+dropID+"option:selected").data("options");
// // 			var krw = $("#dropID option:selected").data("values").amount_krw;
// 			console.log(dropID);
// 			console.log(krw 	);
// // 			var num = $("#"+dropID+"option:selected").data("value").num;
// // 			$("#note"+num).text(krw);
			
// 		});//rq end
		
		
		$('#btn-add-row').click(function () {
			count = count + 1;
			
			
		    var time = new Date().toLocaleTimeString();
		    
		    $('#statement> tbody:last').append(' <tr>\n' +
		        '                <td><select class="rq" id="finance_id'+count+'">\n'+
		        '						<option value="">재무고유번호</option>\n'+
									    <c:forEach items="${request_list}" var="request_dto">
						        			<c:choose>
							        			<c:when test="${request_dto.receive_date ne null}">
				'				                	<option value="${request_dto.id}" data-options="{\'amount_krw\':\'${request_dto.amount_krw }\',\'note\':\'${request_dto.note }\'}">${request_dto.id}</option>\n'+
							        			</c:when>
							        		</c:choose>
							        	</c:forEach>
		        '					 </select></td>\n' +
		        '                <td><select class="ui search dropdown" id="action_type'+count+'">\n'+
	    		'						<option value="">입금/출금</option>\n'+
	    		'						<option value="1">입금</option>\n'+
	    		'						<option value="2">출금</option>\n'+
	    		'					</select></td>\n' +
		        '                <td><select class="ui search dropdown" id="item'+count+'">\n'+
		        '       				<option value="">적요</option>\n'+
		        '        				<option value="1">수입물품대금</option>\n'+
		        '        				<option value="2">관세</option>\n'+
		        '        				<option value="3">물류비</option>	\n'+
		        '        				<option value="4">관리물류비</option>\n'+
		        '        				<option value="5">기타</option>\n'+
		        '       		</select></td>\n' +
		        '                <td><div class="input"><input id="amount_krw'+count+'" placeholder="금액" type="text"></div></td>\n' +
		        '                <td><div class="input"><input id="amount_hdc'+count+'" placeholder="수수료" type="text"></div></td>\n' +
		        '                <td><div class="input"><input id="note'+count+'" placeholder="비고" type="text"></div></td>\n' +
		        '            </tr>');
		});
		$('#btn-del-row').click(function () {
			count = count - 1;
		    $('#statement > tbody:last > tr:last').remove();
		});

	    $("#open_menu").click(function () {
	        $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
	    });
	    $('.ui.dropdown').dropdown({
	        direction:'auto',
	        duration:100,
	        onChange:function(value, text, $choice){

	        }
	    });
		
	    
		$(".transferupdate").click(function () {
			var btnID = $(this).attr("id");
			var transfer_id = $("#"+btnID).data("options").id;
			
			var url = "${pageContext.request.contextPath}/financialMng/transfer/transfer_update?id="+transfer_id;
			var name = "update";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		
		$(".transferdelete").click(function () {
			alert("정말 삭제하시겠습니까?");
			var btnID = $(this).attr("id");
			var transfer_id = $("#"+btnID).data("options").id;
			
			$.ajax({
				url : "${pageContext.request.contextPath}/financialMng/transfer/transfer_delete",
				data : {
						id : transfer_id				
				},
				success : function() {
					alert("삭제가 완료되었습니다.");
					location.reload();
				} 
				
			});
			
		});
	});	
</script>
</head>
<body>

<div class="content_body">

<div class="ui form segment">

    <h1>입출금내역</h1>
    <label>검색</label>
    <div class="ui icon input">
        <i class="search icon"></i>
        <input placeholder="검색어를 입력하세요" type="text">
    </div>
    <div class="field">
        <table class="ui celled table">
            <thead>
            <tr>
            		<th>전표번호</th>
	                <th>재무고유번호</th>
	                <th>입금/출금</th>
	                <th>적요</th>
	                <th>금액</th>
	                <th>수수료</th>
	                <th>실 입(출)금액</th>
	                <th>날짜</th>
	                <th>비고</th>
            </tr></thead>
            <tbody id="tbody1">
     			 <c:forEach items="${list}" var="dto" varStatus="status">
     			 	<tr>
            		<td>${dto.id}</td>
	                <td>${dto.finance_id}</td>
	                <td>
	                <c:choose>
	                	<c:when test="${dto.action_type eq 1}">입금</c:when>
	                	<c:when test="${dto.action_type eq 2}">출금</c:when>
	                </c:choose>
	                </td>
	                <td>
	                <c:choose>
	                	<c:when test="${dto.item eq 1}">수입물품대금</c:when>
	                	<c:when test="${dto.item eq 2}">관세</c:when>
	                	<c:when test="${dto.item eq 3}">물류비</c:when>
	                	<c:when test="${dto.item eq 4}">관리물류비</c:when>
	                	<c:when test="${dto.item eq 5}">기타</c:when>
	                </c:choose>
	                </td>
	                <td>${dto.amount_krw}</td>
	                <td>${dto.amount_hdc}</td>
	                <c:choose>
	                	<c:when test="${dto.amount_hdc ne null}">
	                	<td>${dto.amount_krw+dto.amount_hdc}</td>
	                	</c:when>
	                </c:choose>
	                
	                <td>${dto.closed_date}</td>
	                <td>${dto.note}</td>
	                <td>
			        	<button class="ui button transferupdate" id="update${status.index }" data-options='{"id":"${dto.id }"}'>수정</button>
			        	<button class="ui button transferdelete" id="delete${status.index }" data-options='{"id":"${dto.id }"}'>삭제</button>
			        </td>
            </tr>
     			 </c:forEach>
            </tbody>
        </table>
            <h4 align="center" id="balance"></h4>
    </div>
</div>


<div class="ui form segment">
    <h1>입출금내역등록</h1>

    <div class="field">
        <table class="ui celled table" id="statement">
            <thead>
	            <tr>
	                <th>재무고유번호</th>
	                <th>입금/출금</th>
	                <th>적요</th>
	                <th>금액</th>
	                <th>수수료</th>
	                <th>비고</th>
	            </tr>
            </thead>
            <tbody>
	            <tr>
	                <td><select id="finance_id0" class="rq">
	                	<option value="">재무고유번호</option>
	                	<c:forEach items="${request_list}" var="request_dto" varStatus="status">
	                		<c:choose>
	                			<c:when test="${request_dto.receive_date == null}">
				                	<option value="${request_dto.id}" data-options='{"num":"${status.index }", "amount_krw":"${request_dto.amount_krw }", "note":"${request_dto.note }"}'>${request_dto.id}</option>
	                				
	                			</c:when>
	                		</c:choose>
	                	</c:forEach>
	                	</select></td>
	                <td><select class="ui search dropdown" id="action_type0">
	                		<option value="">입금/출금</option>
	                		<option value="1">입금</option>
	                		<option value="2">출금</option>
	                </select></td>
	                <td><select class="ui search dropdown" id="item0">
	                		<option value="">적요</option>
	                		<option value="1">수입물품대금</option>
	                		<option value="2">관세</option>
	                		<option value="3">물류비</option>	
	                		<option value="4">관리물류비</option>
	                		<option value="5">기타</option>
	                </select></td>
	                <td><div class="input"><input id="amount_krw0" placeholder="금액" type="text"></div></td>
					<td><div class="input"><input id="amount_hdc0" placeholder="수수료" type="text"></div></td>
	                <td><div class="input"><input id="note0" placeholder="비고" type="text"></div></td>
	            </tr>
        <div class="ui left floated icon buttons">
            <button class="ui button" id="btn-add-row"><i class="plus icon"></i></button>
            <button class="ui button" id="btn-del-row"><i class="minus icon"></i></button>
        </div>
            </tbody>
        </table>
</div>

            <table class="ui definition table">
     
        <div class="ui right floated small primary labeled icon button" id="insertBtn">
            <i class="pencil alternate icon"></i>입출금내역등록
        </div>
        </table>
    </div>
</div>

</body>
</html>