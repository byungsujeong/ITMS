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
<script src="../../resources/js/authority.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
	<div class="content_body">
		<table align="center">
			<tr>
				<td>
					<form action="authority">
					<input type="hidden" name="curPage" value=1>
					<div class="ui action input">
					  <select name="key" class="ui compact selection dropdown">
					  <c:choose>
					  	<c:when test="${key eq 'name'}">
						    <option value="name" selected>이름</option>
					  	</c:when>
					  	<c:otherwise>
					  		<option value="name">이름</option>
					  	</c:otherwise>
					  </c:choose>
					  <c:choose>
					  	<c:when test="${key eq 'id'}">
						    <option value="id" selected>사번</option>
					  	</c:when>
					  	<c:otherwise>
					  		<option value="id">사번</option>
					  	</c:otherwise>
					  </c:choose>
					  <c:choose>
					  	<c:when test="${key eq 'dept_name'}">
						    <option value="dept_name" selected>부서명</option>
					  	</c:when>
					  	<c:otherwise>
					  		<option value="dept_name">부서명</option>
					  	</c:otherwise>
					  </c:choose>
					  <c:choose>
					  	<c:when test="${key eq 'dept_id'}">
						    <option value="dept_id" selected>부서코드</option>
					  	</c:when>
					  	<c:otherwise>
					  		<option value="dept_id">부서코드</option>
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
				<td align="right">
					<button type="button" id="downExcel">엑셀 다운로드</button>
					<input type="hidden" id="xlskey" value="${key}">
					<input type="hidden" id="xlsvalue" value="${value}">
				</td>
			</tr>
		</table>
		<form action="editUser" method="post">
		<!-- <table class="ui compact definition table"> -->
		<table class="ui compact definition selectable table">
		  <thead class="full-width">
		    <tr>
		      <th>순번</th>
		      <th>이름</th>
		      <th>사번</th>
		      <th>부서명</th>
		      <th>연락처</th>
		      <th>이메일</th>
		      <th>제품메뉴</th>
		      <th>수입메뉴</th>
		      <th>수출메뉴</th>
		      <th>재무메뉴</th>
		      <th>보고메뉴</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  	<c:forEach items="${list}" var="dto" varStatus="status">
		    <tr>
		      <td><div class="ui test checkbox"><input type="checkbox" name="seq" value="${dto.id}"><label>${seq[status.index]}</label></div></td>
		      
		      <td><div class="ui fluid input"><input type="text" name="name" value="${dto.name}"></div></td>
		      <td><div class="ui fluid input"><input type="text" name="id" value="${dto.id}" readonly></div></td>
		      <td>
		      	<select class="ui fluid dropdown" name="dept_id">
					<c:forEach items="${deptList}" var="deptdto">
						<c:choose>
							<c:when test="${deptdto.id eq dto.dept_id}">
								<option value="${deptdto.id}" selected>${deptdto.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${deptdto.id}">${deptdto.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
		      </td>
		      <td><div class="ui fluid input"><input type="text" name="tel" value="${dto.tel}"></div></td>
		      <td><div class="ui fluid input"><input type="text" name="email" value="${dto.email}"></div></td>
		      <td class="collapsing">
		        <div class="ui product slider checkbox">
		          <c:choose>
		          	<c:when test="${dto.pmenu==1}">
		          		<input type="checkbox" checked> <label></label>
		          	</c:when>
		          	<c:otherwise>
		          		<input type="checkbox"> <label></label>
		         	</c:otherwise>
		          </c:choose>
		          <input type="hidden" name="pmenu" value="${dto.pmenu}">
		        </div>
		      </td>
		      <td class="collapsing">
		        <div class="ui import slider checkbox">
		          <c:choose>
		          	<c:when test="${dto.imenu==1}">
		          		<input type="checkbox" checked> <label></label>
		          	</c:when>
		          	<c:otherwise>
			            <input type="checkbox"> <label></label>
		         	</c:otherwise>
		          </c:choose>
		          <input type="hidden" name="imenu" value="${dto.imenu}">
		        </div>
		      </td>
		      <td class="collapsing">
		        <div class="ui export slider checkbox">
		          <c:choose>
		          	<c:when test="${dto.emenu==1}">
		          		<input type="checkbox" checked> <label></label>
		          	</c:when>
		          	<c:otherwise>
			            <input type="checkbox"> <label></label>
		         	</c:otherwise>
		          </c:choose>
		          <input type="hidden" name="emenu" value="${dto.emenu}">
		        </div>
		      </td>
		      <td class="collapsing">
		        <div class="ui finance slider checkbox">
		          <c:choose>
		          	<c:when test="${dto.fmenu==1}">
		          		<input type="checkbox" checked> <label></label>
		          	</c:when>
		          	<c:otherwise>
			            <input type="checkbox"> <label></label>
		         	</c:otherwise>
		          </c:choose>
		          <input type="hidden" name="fmenu" value="${dto.fmenu}">
		        </div>
		      </td>
		      <td class="collapsing">
		        <div class="ui report slider checkbox">
		          <c:choose>
		          	<c:when test="${dto.rmenu==1}">
		          		<input type="checkbox" checked> <label></label>
		          	</c:when>
		          	<c:otherwise>
			            <input type="checkbox"> <label></label>
		         	</c:otherwise>
		          </c:choose>
		          <input type="hidden" name="rmenu" value="${dto.rmenu}">
		        </div>
		      </td>
		    </tr>
		    </c:forEach>
		  </tbody>
		  <tfoot class="full-width">
		    <tr>
		      <th></th>
		      <th colspan="5">
		      	<a class="ui small button" href="register_employee"><i class="user icon"></i>
          		addUser
        		</a>
		      	<button id="update" class="ui small button" type="submit"><i class="edit icon"></i>
          		Update
        		</button>
        		<button id="delete" class="ui small button" type="button"><i class="trash alternate icon"></i>
          		delete
        		</button>
		      </th>
		      <th>
		      	<div class="ui icon buttons">
		      		<button type="button" class="ui mini basic icon product check button"><i class="green check icon"></i></button>
		      		<button type="button" class="ui mini basic icon product uncheck button"><i class="red ban icon"></i></button>
		      	</div>
		      </th>
		      <th>
		      	<div class="ui icon buttons">
		        	<button type="button" class="ui mini basic icon import check button"><i class="green check icon"></i></button>
		        	<button type="button" class="ui mini basic icon import uncheck button"><i class="red ban icon"></i></button>
		        </div>
		      </th>
		      <th>
		      	<div class="ui icon buttons">
		        	<button type="button" class="ui mini basic icon export check button"><i class="green check icon"></i></button>
		        	<button type="button" class="ui mini basic icon export uncheck button"><i class="red ban icon"></i></button>
		        </div>
		      </th>
		      <th>
		      	<div class="ui icon buttons">
			        <button type="button" class="ui mini basic icon finance check button"><i class="green check icon"></i></button>
			        <button type="button" class="ui mini basic icon finance uncheck button"><i class="red ban icon"></i></button>
		        </div>
		      </th>
		      <th>
		      	<div class="ui icon buttons">
			        <button type="button" class="ui mini basic icon report check button"><i class="green check icon"></i></button>
			        <button type="button" class="ui mini basic icon report uncheck button"><i class="red ban icon"></i></button>
		        </div>
		      </th>
		    </tr>
		  </tfoot>
		</table>
		</form>
		  <table align="center">
		    <tr>
		      <th colspan="11">
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