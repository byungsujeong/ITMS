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
    <script type="text/javascript">
    	var com_name = opener.document.getElementById("com_name").value;
     	var c_key = opener.document.getElementById("c_key").value;
     	var c_value = opener.document.getElementById("c_value").value;
    
     	$(function() {
			
     		$("#td1").text(com_name);
     		$("#td2").text(c_key);
     		$("#td3").text(c_value);
     		
		
     	
     	
     	});
    </script>
    <title>ITMS</title>
</head>
<body>

<div class="content_body">
<div class="ui form segment">

        <h1>계좌상세</h1>
    <div class="field">
        <table class="ui celled table">
            <thead>
            <tr>
                <th>회사명</th>
                <th>은행명</th>
                <th>계좌번호</th>
            </tr>

            </thead>
            <tbody>
            <tr>
                <td id="td1"></td>
                <td id="td2"></td>
                <td id="td3"></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>