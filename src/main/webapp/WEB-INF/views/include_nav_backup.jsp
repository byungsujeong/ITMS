<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value=""/>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.css">
    <script src="${pageContext.request.contextPath}/resources/include/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ITMSjs.js"></script>
    <meta charset="UTF-8">
    <title>ITMS</title>
</head>
<body>
<div>
    <div id="nav_html">
        <div class="ui sidebar inverted vertical menu">
            <div class="item">
                <div class="header">업무관리</div>
                <div class="menu">
                    <a class="item" href="${pageContext.request.contextPath}/operation/customer/customerRead">
                        거래처관리
                    </a>
                    <a class="item" href="${pageContext.request.contextPath}/operation/product/productRead">
                        제품관리
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="header">수출관리</div>
                <div class="menu">
                    <a href="" class="item">
                        수출관리
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="header">수입관리</div>
                <div class="menu">
                    <a href="${pageContext.request.contextPath}/import/importprocess/importMain.do" class="item">
                        수입관리
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="header">재무관리</div>
                <div class="menu">
                    <a href="${pageContext.request.contextPath}/financialMng/request/page1.do" class="item">
                        결제요청관리
                    </a>
                    <a href="${pageContext.request.contextPath}/financialMng/request/page2.do" class="item">
                        입금요청관리
                    </a>
                    <a href="${pageContext.request.contextPath}/financialMng/transfer/page3.do" class="item">
                        입출금관리
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="header">종합보고</div>
                <div class="menu">
                    <a class="item" href="${pageContext.request.contextPath}/report/monthly/monthly.do">
                        월별집계표
                    </a>
                    <a class="item" href="${pageContext.request.contextPath}/report/tradeRecord/tradeRecord.do">
                        수출입관리대장
                    </a>
                    <a class="item" href="${pageContext.request.contextPath}/report/myReport/myReportList.do">
                        나의보고서
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="ui stackable menu">
        <a class="active item" id="open_menu">
            <i class="align justify icon"></i>
        </a>

        <div class="right menu">
            <div class="item" id="goBackHome">
                <i class="home icon"></i>
            </div>
            <c:choose>
                <c:when test="${id eq null}">
                    <div class="item">
                        <div class="ui dropdown"><i class="user icon"></i>
                            <div class="menu">
                                <a class="item"
                                   href="${pageContext.request.contextPath}/user/division/deptInfo?curPage=1&key=&value=">
                                    부서관리
                                </a>
                                <a class="item"
                                   href="${pageContext.request.contextPath}/user/usermanage/authority?curPage=1&key=&value=">권한관리</a>
                                <a class="item"
                                   href="${pageContext.request.contextPath}/user/account/accountInfo?curPage=1&key=&value=">법인계좌관리</a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/user/usermanage/userInfo">
                        <div class="item">
                            <i class="user icon"></i>
                        </div>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>