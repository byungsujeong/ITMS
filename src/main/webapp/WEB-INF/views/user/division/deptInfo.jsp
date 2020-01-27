<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../../resources/js/deptInfo.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
	<div class="content_body">
		<table align="center">
			<tr>
				<td>
					<form action="deptInfo">
					<input type="hidden" name="curPage" value=1>
					<div class="ui action input">
					  <select name="key" class="ui compact selection dropdown">
					  <c:choose>
					  	<c:when test="${key eq 'name'}">
						    <option value="name" selected>부서명</option>
					  	</c:when>
					  	<c:otherwise>
					  		<option value="name">부서명</option>
					  	</c:otherwise>
					  </c:choose>
					  <c:choose>
					  	<c:when test="${key eq 'id'}">
						    <option value="id" selected>부서코드</option>
					  	</c:when>
					  	<c:otherwise>
					  		<option value="id">부서코드</option>
					  	</c:otherwise>
					  </c:choose>
					  </select>
					  <input type="text" name="value" placeholder="Search...">
					  <button type="submit" class="ui icon button">
					    <i class="search icon"></i>
					  </button>
					</div>
					</form>
				</td>
			</tr>
		</table>
		<form action="editDepartment" method="post">
		<!-- <table class="ui compact definition table"> -->
		<table class="ui compact definition selectable table">
		  <thead class="full-width">
		    <tr>
		      <th>순번</th>
		      <th>부서명</th>
		      <th>부서코드</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${list}" var="dto" varStatus="status">
		    <tr>
		      <td><div class="ui test checkbox"><input type="checkbox" name="seq" value="${dto.id}"><label>${seq[status.index]}</label></div></td>
		      <td><div class="ui fluid input"><input type="text" name="name" value="${dto.name}"></div></td>
		      <td><div class="ui fluid input"><input type="text" name="id" value="${dto.id}" readonly></div></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		  <tfoot class="full-width">
		    <tr>
		      <th></th>
		      <th colspan="2">
		      	<a class="ui small button" href="register_dept"><i class="sitemap icon"></i>
          		addDepartment
        		</a>
		      	<button id="update" class="ui small button" type="submit"><i class="edit icon"></i>
          		Update
        		</button>
        		<button id="delete" class="ui small button" type="button"><i class="trash alternate icon"></i>
          		delete
        		</button>
		      </th>
		    </tr>
		  </tfoot>
		</table>
		</form>
		  <table align="center">
		    <tr>
		      <th colspan="3">
			      <div class="ui pagination menu">
			        <c:choose>
			        	<c:when test="${curPage eq 1}">
					        <!-- <div class="icon item">
		      	        	<i class="left chevron icon"></i></div> -->
			        	</c:when>
			        	<c:otherwise>
					        <a class="icon item" href="<c:url value="?curPage=${curPage-1}&key=${key}&value=${value}"/>">
		      	        	<i class="left chevron icon"></i></a>
			        	</c:otherwise>
			        </c:choose>
			        <c:choose>
			        	<c:when test="${pageLen eq 0}">
			        		<div class="item"><h4><b>1</b></h4></div>
			        	</c:when>
			        	<c:otherwise>
			        		<c:forEach var="page" begin="1" end="${pageLen}">
					        	<c:choose>
					        		<c:when test="${curPage eq page}">
								        <div class="item"><h4><b>${page}</b></h4></div>
					        		</c:when>
						        	<c:otherwise>
						        		<a class="item" href="<c:url value="?curPage=${page}&key=${key}&value=${value}"/>">${page}</a>
						        	</c:otherwise>
					        	</c:choose>
					        </c:forEach>
			        	</c:otherwise>
			        </c:choose>
			        <c:choose>
			        	<c:when test="${curPage eq pageLen or pageLen eq '0'}">
					        <!-- <div class="icon item">
		      	        	<i class="right chevron icon"></i></div> -->
			        	</c:when>
			        	<c:otherwise>
					        <a class="icon item" href="<c:url value="?curPage=${curPage+1}&key=${key}&value=${value}"/>">
		      	        	<i class="right chevron icon"></i></a>
			        	</c:otherwise>
			        </c:choose>
			      </div>
		      </th>
		    </tr>
		  </table>
	</div>
</body>
</html>