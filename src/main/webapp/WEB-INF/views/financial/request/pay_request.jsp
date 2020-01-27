<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>

      
<script>
	$(function () {
		$("#save").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_save";
			var name = "save";
			var option = "width=800, height=800, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$(document).on("click",".payupdate",function () {
			var request_id = $(this).data("value").id;
			console.log($(this))
			console.log(request_id);
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_update?id="+request_id;
			var name = "update";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$(".paydelete").click(function () {
			var request_id = $(this).data("value").id;
			alert("정말 삭제하시겠습니까?");
			$.ajax({
				url : "${pageContext.request.contextPath}/financialMng/request/request_delete",
				data : {
						id : request_id				
				},
				success : function(result) {
					alert("삭제가 완료되었습니다.");
					location.reload();
				} 
				
			});
		});
		
		$(".detail").click(function () {
		
			var com_name = $(this).data("value").com_name;
			var c_key = $(this).data("value").c_key;
			var c_value = $(this).data("value").c_value;
			
			console.log(com_name);
			console.log(c_key);
			console.log(c_value);
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_account_detail";
		 	var name = "account_detail";
			var option = "width=1100, height=230, top=100, left=200, location=no";
			window.open(url, name, option);
		});

		$(".pay").click(function () {
			var requestID = $(this).data("value").id;
			var divID = $(this).data("value").divID;
			var btnID = $(this).attr("id");
 			 $.ajax({
					url:"${pageContext.request.contextPath}/financialMng/request/pay_check",
					data:{
						id : requestID 
					},
					success:function(result){
						if(result.length>0){
						$("#"+btnID).hide();
							$(result).each(function(i, dto) {
								var id = dto.id;
								var receive_date = dto.receive_date;
								
								if (id == requestID) {
									$("#"+divID).html("<i class = 'check icon'></i>"+receive_date);
									
									$("#d2").append(
											"<tr> \n"
											+"<td><div class='fid' data-options={'fid':"+dto.id+"}>"+dto.id+"</td></div> \n"
							                +"<td>"+dto.doc_no+"</td> \n"
							                +"<td>"+dto.note+"</td> \n"
							                +"<td>"+dto.amount_krw+"</td> \n"
							                +"<td> \n"
							                +"<button class='ui button detail' data-value={'com_name':"+dto.name+",'c_key':"+dto.c_key+",'c_value':"+dto.c_value+"}>상세</button> \n"
							                +"</td> \n"
							                +"<td>"+dto.request_id+"</td> \n"
							                +"<td>"+dto.response_id+"</td> \n"
							                +"<td><div class='payend_d2'> \n"
							                +"<input type='hidden' value="+dto.id+"> \n"
							                +"<button disabled='disabled' class='ui button payend' data-value={'id':"+dto.id+"}>결제 대기중</button> \n"
							                +"</div></td> \n"
							                +"<td> \n"
							                +'<button class="ui button payupdate" id="update" data-value={"id":"'+dto.id+'"}>수정</button> \n'
							                +'<button class="ui button paydelete" id="delete" data-value={"id":"'+dto.id+'"}>삭제</button> \n'
							                +"</td> \n"
							        		+"</tr>");
								}
							});
						}
					}	// success end		
				}); // ajax end
 		}); //click end
 		
 		
 		$(".payend").click(function() {
			var finance_id = $(this).data("value").id;
			$.ajax({
				url:"${pageContext.request.contextPath}/financialMng/request/payend",
				data:{
					finance_id : finance_id
				},
				success:function(result){
					
					console.log(result.finance_id);
					console.log($(".payend_d2").children());
					/* console.log($(".payend_d2").children()[0])
					console.log($(".payend_d2").children().eq(0))
					console.log($(".payend_d2").children()[1])
					console.log($(".payend_d2").children().eq(1)) */
					$(".payend_d2").children().each(function(i, tag){
						if(tag.value == result.finance_id){
							$(".payend_d2").children().eq(i).parent().html("<i class = 'check icon'></i>"+result.closed_date);
						}
					});
				}
			});
		});
	});	
</script>
      
</head>
<body>
		

<div class="content_body">
<div class="ui form segment">

        <h1>결제요청</h1>
        <label>검색</label>
        <div class="ui icon input">
            <i class="search icon"></i>
            <input placeholder="검색어를 입력하세요" type="text">
        </div>
    <div class="field">
        <table class="ui celled table">
            <thead>
            <tr>
                <th rowspan="2">전표번호</th>
                <th rowspan="2">PO번호</th>
                <th rowspan="2">항목</th>
                <th rowspan="2">금액(원)</th>
                <th rowspan="1" colspan="3">송금정보</th>
                <th rowspan="2">신청인아이디</th>
                <th rowspan="2">요청한날짜</th>
                <th rowspan="2">요청확인</th>
            </tr>
            <tr>
                <th>회사명</th>
                <th>은행명</th>
                <th>계좌 no.</th>
            </tr>

            </thead>
            <tbody>
            
            <c:forEach items="${list}" var="dto" varStatus="status">
            <tr>
                <td>${dto.id}</td>
                <td>${dto.doc_no}</td>
                <td>${dto.note}</td>
                <td>${dto.amount_krw}</td>
                <td>${dto.name }</td>
                <td>${dto.c_key }</td>
                <td>${dto.c_value }</td>
                <td>${dto.request_id}</td>
                <td>${dto.issued_date}</td>
                <td>
                	<div id="d1${status.count}">
                	<c:choose>
                		<c:when test="${dto.receive_date eq null}">
		                    <button class="ui button pay" id="check${status.count}" data-value='{"id":"${dto.id}","divID":"d1${status.count}"}'>요청확인</button>
                		</c:when>
                		<c:otherwise>
                			<i class ='check icon'></i>${dto.receive_date}
                		</c:otherwise>
                	</c:choose>
                    </div>
                </td>
            </tr>
            </c:forEach>

            </tbody>
        </table>

    </div>
</div>


<div class="ui form segment">
    <h1>결제예정</h1>
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
                <th>PO번호</th>
                <th>항목</th>
                <th>금액(원)</th>
                <th>송금계좌정보</th>
                <th>신천인아이디</th>
                <th>수령인아이디</th>
                <th>결제유무</th>
                <th colspan=2></th>
            </tr></thead>
            
            <c:forEach items="${list}" var="dto" varStatus="status">
            <tbody id="d2">
	            <c:choose>
	            	<c:when test="${dto.receive_date ne null}"> <!-- 널이 아니면 -->
			            <tr>
			                <td><div class="fid" data-options='{"fid":"${dto.id}"}'>${dto.id}</div></td>
			                <td>${dto.doc_no }</td>
			                <td>${dto.note}</td>
			                <td>${dto.amount_krw}</td>
			                <td><button class='ui button detail' data-value='{"com_name":"${dto.name}", "c_key":"${dto.c_key}","c_value":"${dto.c_value}"}'>상세</button></td>
			                <td>${dto.request_id}</td>
			                <td>${dto.response_id}</td>
			                <td>
			        <c:choose>
	            	<c:when test="${dto.id eq transfer_list[status.index].finance_id}">
			                	<i class ='check icon'></i>${transfer_list[status.index].closed_date}
	            	</c:when>
	            	<c:otherwise>
			                	<div class="payend_d2">
			                	<input type="hidden" value="${dto.id}">
			                    <button disabled="disabled" class="ui button payend" data-value='{"id":"${dto.id}"}'>결제 대기중</button>
			                	</div>
	            	</c:otherwise>
			        </c:choose>   
			                </td>
			                 <td>
			                    <button class="ui button payupdate" id="update${status.index }" data-value='{"id":"${dto.id }"}'>수정</button>
			                    <button class="ui button paydelete" id="delete${status.index }" data-value='{"id":"${dto.id }"}'>삭제</button>
			                </td>
			            </tr>
	            	</c:when>
	            </c:choose>
            </c:forEach>
            </tbody>
        </table>


    </div>
</div>



<div class="ui form segment">
    <h1>결제완료</h1>
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
                <th>PO번호</th>
                <th>항목</th>
                <th>송금금액</th>
                <th>수수료</th>
	                <th>실송금액</th>
                <th>송금계좌정보</th>
            </tr></thead>
            <tbody>
            
<%--             <c:forEach items="transfer_list" var="dto"> --%>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <button class="ui button">상세</button>
                </td>
<!--                 <td> -->
<!--                     <button class="ui button" id="update2">수정</button> -->
<!--                     <button class="ui button" id="delete2">삭제</button> -->
<!--                 </td> -->
            </tr>
<%--             </c:forEach> --%>
            </tbody>
        </table>


    </div>
</div>

</div>
</body>
</html>