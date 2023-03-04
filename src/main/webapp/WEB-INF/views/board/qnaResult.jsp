<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link rel="../resources/css/exam.css">
<body>
<section class="qnaMain qnaPage py-5">
    <article class="contain">
        <div class="text-center">
            <h1 class="fw-bolder">Q&A</h1>
        </div>
        <div class="btn_wrp">
            <!-- 검색 -->
            <form action="${contextPath}/qnaResult" method="get">
                <div class="search_wrap">
                    <div class="search_area">
                        <select name="searchType">
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
                            <option value="cw" <c:out value="${param.searchType eq 'cw'?'selected':'' }"/>>
                                내용+작성자
                            </option>
                            <option value="tw" <c:out value="${param.searchType eq 'tw'?'selected':'' }"/>>
                                제목+작성자
                            </option>
                        </select>
                        <input type="text" name="keyword" value="${param.keyword}">
                        <button class="gold_btn" type="submit">검색</button>
                    </div>
                </div>
            </form>
            <!-- 글쓰기 버튼 -->
            <form action="<%=request.getContextPath()%>/qnaWriter">
                <div class="buttons">
                    <c:choose>
                        <c:when test="${login!=null}">
                            <button class="gold_btn" id="QaBtn" type="submit">글쓰기</button>
                        </c:when>
                    </c:choose>
                </div>
            </form>
        </div>
        <table id="qnaList" class="table table-hover">
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

        <div style="text-align: center;">
            <c:if test="${paging.startPage != 1 }">
                <a href="/qnaResult?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchType=${param.searchType}&keyword=${param.keyword}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b>${p }</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage }">
                        <a href="/qnaResult?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${param.searchType}&keyword=${param.keyword}">${p }</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/qnaResult?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${param.searchType}&keyword=${param.keyword}">&gt;</a>
            </c:if>
        </div>
    </article>
</section>
</body>

<script>
    $(".test").click(function () {
        let dataNo = $(this).closest("tr").attr("data-QANo");

        console.log("dataNo : " + dataNo);
        location.href = "/qnaInfo?QANo=" + dataNo
    })
</script>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>