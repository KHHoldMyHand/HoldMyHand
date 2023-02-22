<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


<section class="py-5" id="features">
    <div class="container">
        <table class="table table-hover">
            <tr>
                <th>deptno</th>
                <th>dname</th>
                <th>loc</th>
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
