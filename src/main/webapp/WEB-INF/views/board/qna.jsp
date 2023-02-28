<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<style>
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
</style>

<body>
    <section class="qnaMain py-5 h-100">
        <div class="text-center" style="margin-bottom: 20px">
            <h1 class="fw-bolder">Q&A</h1>
        </div>
        <form action="<%=request.getContextPath()%>/qnaWriter" >
             <div class="buttons" style="text-align: right;" "font-size:20px; background-color: #FFC007; border-radius: 10px">
                <button id="QaBtn" type ="submit">글쓰기</button>
             </div>
        </form>

        <div class="ListView">
            <table id="qnaList" style="width:100%">

                <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
                <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.QANo}</td>
                    <td>${list.title}</td>
                    <td>${list.writer}</td>
                    <td>${list.writeDate}</td>
                    <td>${list.count}</td>
                </tr>
                </c:forEach>
            </table>
        </div>

    </section>
</body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>