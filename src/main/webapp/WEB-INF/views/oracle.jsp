<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<script>
    function selChange() {
        let sel = document.getElementById('cntPerPage').value;
        location.href="oracle?nowPage=${paging.nowPage}&cntPerPage="+sel;
    }
</script>

<h1>오라클 테스트 유저정보 받아오기</h1>

<section class="py-5" id="features">
    <div class="container">
        <select name="category">
            <option value="a">전체</option>
            <option value="b">고객</option>
            <option value="c">관리자</option>
            <option value="d">신용평가미신청</option>
            <option value="e">신용평가진행중</option>
            <option value="f">신용평가완료</option>
        </select>
        <div style="float: right;">
            <select id="cntPerPage" name="sel" onchange="selChange()">
                <option value="5"
                        <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
                <option value="10"
                        <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                <option value="15"
                        <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                <option value="20"
                        <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
            </select>
        </div> <!-- 옵션선택 끝 -->
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
                <a href="/oracle?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b>${p }</b>
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
    </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
