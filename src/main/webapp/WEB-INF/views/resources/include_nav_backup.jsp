<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.css">
    <script src="${pageContext.request.contextPath}/resources/include/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js.js"></script>
    <meta charset="UTF-8">
    <title>ITMS</title>
</head>
<body>
<div><div id="nav_html">
    <div class="ui sidebar inverted vertical menu">
        <div class="item">
            <div class="header">업무관리</div>
            <div class="menu">
                <a class="item">거래처관리
                </a>
                <a class="item">
                    제품관리
                </a>
                <a class="item">
                    단가이력관리
                </a>
            </div>
        </div>
        <div class="item">
            <div class="header">수출관리</div>
        </div>
        <div class="item">
            <div class="header">수입관리</div>
        </div>
        <div class="item">
            <div class="header">재무관리</div>
            <div class="menu">
                <a class="item">
                    결제요청관리
                </a>
                <a class="item">
                    입금요청관리
                </a>
                <a class="item">
                    입출금관리
                </a>
            </div>
        </div>
        <div class="item">
            <div class="header">종합보고</div>
            <div class="menu">
                <a class="item">
                    월별집계표
                </a>
                <a class="item">
                    수출입관리대장
                </a>
                <a class="item">
                    개별보고작성
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
        <a href=""><div class="item">
            <i class="home icon"></i>
        </div></a>
        <div class="item">
            <div class="ui dropdown"><i class="user icon"></i>

                <div class="menu">
                    <div class="item">법인정보관리</div>
                    <div class="item">직원비밀번호관리</div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ui dropdown"><i class="users icon"></i>
                <div class="menu">
                    <div class="item">부서등록
                        <i class="dropdown icon"></i>
                        <div class="menu">
                            <div class="item">필요한경우1</div>
                            <div class="item">필요한경우2</div>
                        </div>
                    </div>
                    <div class="item">직원등록</div>
                    <div class="item">권한관리</div>
                    <div class="item">법인계좌관리</div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    // $("#open_menu").click(function () {
    // $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
    // });
</script>
</body>
</html>