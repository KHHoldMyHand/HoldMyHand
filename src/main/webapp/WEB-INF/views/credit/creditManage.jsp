<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<script>
    function selChange() {
        let sel = document.getElementById('cntPerPage').value;
        location.href = "creditManage?nowPage=${paging.nowPage}&cntPerPage=" + sel;
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
    }
    .table tr td {
        border-bottom: 1px solid #ddd;
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
            <h2 class="fw-bolder">신용 정보 등록 평가</h2>
        </div>
        <div style="float: right; margin-bottom: 10px;">
            <select id="cntPerPage" name="sel" onchange="selChange()" style="border-radius: 5px;">
                <option value="5"
                        <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기
                </option>
                <option value="10"
                        <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기
                </option>
                <option value="15"
                        <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기
                </option>
                <option value="20"
                        <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기
                </option>
            </select>
        </div>
        <!-- 옵션선택 끝 -->
        <table class="table table-hover">
            <tr>
                <th>유저번호</th>
                <th>대표자명</th>
                <th>기업이름</th>
                <th>평가버튼</th>
            </tr>

            <c:forEach items="${list}" var="crbGET">
            <tr>
                <td>${crbGET.userNo}</td>
                <td>${crbGET.establishmentName}</td>
                <td>${crbGET.companyName}</td>
                <td><a href="<%=request.getContextPath()%>/evaluationPage?userNo=${crbGET.userNo}">
                    <button class="table_btn">평가하기</button></a></td>
            </tr>
            </c:forEach>
        </table>
        <div style="display: block; text-align: center; font-size: 20px;">
            <c:if test="${paging.startPage != 1 }">
                <a href="/creditManage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b>${p }</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage }">
                        <a href="/creditManage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/creditManage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
            </c:if>
        </div>
    </article>
</section>
</body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>