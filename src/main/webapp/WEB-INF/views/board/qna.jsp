<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%--<style>
    body {
        background-color: beige
    }

    .buttons {
        display: flex;
        justify-content: right;
        align-items: right;
    }

    .btn {
        margin: 1rem;
        height: 30px;
    }


    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>--%>
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
            <h1 class="fw-bolder">Q&A</h1>
        </div>
        <!-- 검색 -->
        <form action="${contextPath}/qnaResult" method="get" style="float: left; margin-bottom: 10px;">
            <div class="search_wrap">
                <div class="search_area">
                    <select name="searchType" style="border-radius: 5px;">
                        <option value="n"
                                <c:out value="${param.searchType == null?'selected':''}"/>>
                            ---
                        </option>
                        <option value="t"
                                <c:out value="${param.searchType eq 't'?'selected':''}"/>>
                            제목
                        </option>
                        <option value="c"
                                <c:out value="${param.searchType eq 'c'?'selected':''}"/>>
                            내용
                        </option>
                        <option value="w"
                                <c:out value="${param.searchType eq 'w'?'selected':''}"/>>
                            작성자
                        </option>
                        <option value="tc"
                                <c:out value="${param.searchType eq 'tc'?'selected':''}"/>>
                            제목+내용
                        </option>
                        <option value="tw" <c:out value="${param.searchType eq 'tw'?'selected':'' }"/>>
                            제목 + 작성자
                        </option>
                    </select>
                    <input type="text" name="keyword" value="${param.keyword}" style="height: 25px">
                    <button type="submit" style="border: 1px solid #999; border-radius: 4px;
                                    background-color: #ffda70">검색
                    </button>
                </div>
            </div>
        </form>
        <!-- 글쓰기 버튼 -->
        <form action="<%=request.getContextPath()%>/qnaWriter" style="float: right;">
            <div class="buttons" style="text-align: right;
                    background-color: #FFC007; border-radius: 10px">
                <c:choose>
                    <c:when test="${login!=null}">
                        <button id="QaBtn" type="submit" style="border: 1px solid #999; border-radius: 4px;
                            background-color: #ffda70">글쓰기
                        </button>
                    </c:when>
                </c:choose>
            </div>
        </form>

        <table class="table table-hover">
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>

            <c:forEach items="${viewAll}" var="list">
                <tr data-qano="${list.QANo}">
                    <td class="test">${list.QANo}</td>
                    <td class="test">${list.title}</td>
                    <td class="test">${list.writer}</td>
                    <td class="test"><fmt:formatDate value="${list.writeDate}" pattern="yy-MM-dd"/></td>
                    <td class="test">${list.count}</td>
                </tr>

            </c:forEach>
        </table>

        <div style="display: block; text-align: center; font-size: 20px;">
            <c:if test="${paging.startPage != 1 }">
                <a href="/qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b>${p }</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage }">
                        <a href="/qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
            </c:if>
        </div>
    </article>
</section>

<script>
    $(".test").click(function () {
        let dataNo = $(this).closest("tr").attr("data-QANo");

        console.log("dataNo : " + dataNo);
        location.href = "/qnaInfo?QANo=" + dataNo
    })
</script>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>