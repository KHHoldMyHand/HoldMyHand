<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<script>
    function selChange() {
        let sel = document.getElementById('cntPerPage').value;
        location.href="oracle?nowPage=${paging.nowPage}&cntPerPage="+sel;
    }
</script>

<link rel="../resources/css/exam.css">
<body>
<section class="qnaMain py-5">
    <article class="contain">
        <div class="text-center">
            <h2 class="fw-bolder">전체 회원</h2>
        </div>
        <div style="border-radius: 5px; margin-bottom: 10px;">
            <form action="${contextPath}/oracle2" method="get">
                <select class="select_btn" name="keyword">
                    <option value="a">전체</option>
                    <option value="b">고객</option>
                    <option value="c">관리자</option>
                    <option value="d">신용평가미신청</option>
                    <option value="e">신용평가진행중</option>
                    <option value="f">신용평가완료</option>
                </select>
                <button class="gold_btn" type="submit" value="검색">검색</button>
            </form>
        </div>
        <!-- 옵션선택 끝 -->
        <table class="table table-hover">
            <tr>
                <th>유저번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>기업명</th>
                <th>업종</th>
            </tr>
            <c:forEach items="${list}" var="dept">
            <tr>
                <td>${dept.userNo}</td>
                <td>${dept.userID}</td>
                <td>${dept.corpManager}</td>
                <td>${dept.userEmail}</td>
                <td>${dept.userAddress}</td>
                <td>${dept.phoneNo}</td>
                <td>${dept.corpName}</td>
                <td>${dept.corpType}</td>
            </tr>
            </c:forEach>
        </table>
        <div style="text-align: center; font-size: 20px;">
            <c:if test="${paging.startPage != 1 }">
                <a href="/oracle?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b class="paging">${p }</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage }">
                        <a href="/oracle?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/oracle?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
            </c:if>
        </div>
    </article>
</section>
</body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
