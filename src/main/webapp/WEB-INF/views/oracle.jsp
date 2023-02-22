<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<h1>오라클 테스트 유저정보 받아오기</h1>

<section class="py-5" id="features">
    <div class="container">
        <table class="table table-hover">
            <tr>
                <th>기업이름</th>
                <th>유저아이디</th>
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
    </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
