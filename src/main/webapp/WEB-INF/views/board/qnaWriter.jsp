<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<%--<style>
    body {
        background-color: beige;
    }

    .board_write .title {
        padding: 15px;

    }

    .board_write .cont textarea {
        display: block;
        width: 100%;
        height: 400px;
        padding: 20px;
        box-sizing: border-box;
        resize: vertical;
    }

    .board_write .title dt,
    .board_write .title dd {
        display: inline-block;
        vertical-align: middle;
        font-size: 1.4rem;
    }

    .board_write .title dt {
        width: 100px;

    }

    .board_write .title dd {
        width: 90%

    }


    .board_write .title input[type="text"] {
        padding: 10px;
        box-sizing: border-box;

    }


    .board_write [type="text"] {
        width: 100%;
    }


    .board_write .title dl {
        font-size: 0;
    }

    .board_write .title, .cont {
        border-color: #FFC007;
        border-style: solid;
    }

    .bt_wrap {
        text-align: right;
        font-size: 20px;
    ' width: 100 px;

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
        height: 50px;
        line-height: 50px;
    }

    .table tr td {
        border-bottom: 1px solid #ddd;
        height: 50px;
        line-height: 50px;
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
    boardContent {
        margin: 10px;
    }
</style>
<section class="qnaMain py-5">
    <article class="contain">
        <div class="text-center">
            <h1 class="text-center">QNA</h1>
            <p class="fw-bolder">게시글 작성</p>
        </div>
        <form action="<%=request.getContextPath()%>/qnaWrite" method="post">
            <input type="text" name="userNo" value="${login.userNo}" style="display:none">
            <div class="board_write_wrap">
                <div class="board_write">
                    <table class="title">
                        <tr style="border-collapse: collapse">
                            <th> 작성자</th>
                            <td><input class="boardContent" type="text" name="writer" value="${login.corpManager}" readonly></td>
                        </tr>
                        <tr>
                            <th style="">제목</th>
                            <td><input class="boardContent" type="text" name="title" placeholder="제목을 입력하세요."></td>
                        </tr>
                        <tr style="">
                            <th>문의 내용</th>
                            <td><textarea placeholder="내용 입력을 입력하세요." name="content"></textarea></td>
                        </tr>
                    </table>
                <div class="bt_wrap">
                    <button type="submit"
                            style="font-size:20px; background-color: #FFC007; border-radius: 10px; width:100px; height:50px;">
                        등록
                    </button>

                    <button onclick="location.href='qna'" type="reset" id="no"
                            style="font-size:20px; background-color: #FFC007; border-radius: 10px; width:100px; height:50px;">
                        취소
                    </button>
                </div>
            </div>
            </div>
        </form>
    </article>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
