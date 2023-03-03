<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<script>
    function selChange() {
        let sel = document.getElementById('cntPerPage').value;
        location.href="oracle?nowPage=${paging.nowPage}&cntPerPage="+sel;
    }
</script>
<script>
    let queryString = window.location.search;
    // 쿼리 문자열에서 `?` 문자를 제외한 나머지 부분을 추출합니다.
    let queryParams = queryString.substring(1);
    // 파라미터 이름과 값으로 분리하여 객체에 저장합니다.
    let params = {};
    queryParams.split('&').forEach(function(param) {
        let keyValue = param.split('=');
        params[keyValue[0]] = keyValue[1];
    });
    // `param1` 파라미터 값을 가져와 출력합니다.
    console.log('keyword 값: ' + params['keyword']);
    let selectElement = document.getElementById('keywordSetValue');
    if(params['keyword']==="a"){
        selectElement.selectedIndex=0;
    }
    if(params['keyword']==="b"){
        selectElement.selectedIndex=1;
    }
    if(params['keyword']==="c"){
        selectElement.selectedIndex=2;
    }
    if(params['keyword']==='d'){
        selectElement.selectedIndex=3;
    }
    if(params['keyword']==='e'){
        selectElement.selectedIndex=4;
    }
    if(params['keyword']==='f'){
        selectElement.selectedIndex=5;
    }
</script>
<style>
    body {
        background: rgba(255, 247, 137, 0.132);
    }
    .qnaMain {
        max-width: 1200px;
        margin: 0 auto;
    }
    .contain {
        background: rgba(255, 247, 137, 0.132);
        box-shadow: rgb(0 0 0 / 6%) 0px 0px 4px 0px;
        margin: 70px 0;
        padding: 50px;
    }
    .table tr {
        text-align: center;
    }

    .table tr:first-child {
        border-top: 3px solid gold;
    }
    .table tr th {
        border-bottom: 1px solid #ddd;
        height: 35px;
        line-height: 35px;
    }
    .table tr td {
        border-bottom: 1px solid #ddd;
        height: 35px;
        line-height: 35px;
    }

    .table .table_btn {
        background: gold;
        padding: 7px 10px;
        font-weight: 500;
        font-size: 14px;
        outline: none;
        border: none;
        border-radius: 7px;
    }
</style>
<body>
<section class="qnaMain py-5">
    <article class="contain">
        <div class="text-center">
            <c:choose>
                <c:when test="${param.keyword=='a'}">
                    <h2 class="fw-bolder">전체 회원</h2>
                </c:when>
                <c:when test="${param.keyword=='b'}">
                    <h2 class="fw-bolder">고객 데이터</h2>
                </c:when>
                <c:when test="${param.keyword=='c'}">
                    <h2 class="fw-bolder">관리자 데이터</h2>
                </c:when>
                <c:when test="${param.keyword=='d'}">
                    <h2 class="fw-bolder">신용평가미신청 고객</h2>
                </c:when>
                <c:when test="${param.keyword=='e'}">
                    <h2 class="fw-bolder">신용평가진행중 고객</h2>
                </c:when>
                <c:when test="${param.keyword=='f'}">
                    <h2 class="fw-bolder">신용평가완료 고객</h2>
                </c:when>
            </c:choose>
        </div>
        <div style="border-radius: 5px; margin-bottom: 10px;">
            <form action="${contextPath}/oracle2" method="get">
            <select name="keyword" id="keywordSetValue">
                <option value="a">전체</option>
                <option value="b">고객</option>
                <option value="c">관리자</option>
                <option value="d">신용평가미신청</option>
                <option value="e">신용평가진행중</option>
                <option value="f">신용평가완료</option>
            </select>
                <button type="submit" value="검색"
                        style="border: 1px solid #999; border-radius: 4px;
                            background-color: #ffda70">검색</button>
            </form>
        </div>
        <!-- 옵션선택 끝 -->
        <table class="table table-hover">
            <tr>
                <th>기업이름</th>
                <th>유저ID</th>
                <th>휴대전화</th>
            </tr>
            <c:forEach items="${list}" var="dept">
            <tr>
                <td>${dept.corpName}</td>
                <td>${dept.userID}</td>
                <td>${dept.phoneNo}</td>
            </tr>
            </c:forEach>
        </table>
        <div style="display: block; text-align: center; font-size: 20px;">
            <c:if test="${paging.startPage != 1 }">
                <a href="/oracle2?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${param.keyword}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b>${p }</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage }">
                        <a href="/oracle2?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${param.keyword}">${p }</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/oracle?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${param.keyword}">&gt;</a>
            </c:if>
        </div>
    </article>
</section>
</body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
