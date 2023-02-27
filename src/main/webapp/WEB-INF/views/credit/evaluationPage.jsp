<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

    <style>
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
            width: 90px;

        }

        .board_write .title dd {
            width: 80%
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

        .board_write .title, .cont{
            border-color: #FFC007;
            border-style: solid;
        }

        .bt_wrap {
            text-align:right;
            font-size:20px;
        }
    </style>

    <body>

        <section class="py-5">
            <div class="container px-5 my-5">
                <div class="text-center mb-5">
                    <h1 class="fw-bolder">신용평가 페이지</h1>
                    <p class="lead fw-normal text-muted mb-0">유저번호 : ${userNo}의 신용평가 페이지</p>
                </div>
                <div class="board_write_wrap">
                <form action="<%=request.getContextPath()%>/evaluateSuccess" method="POST">
                    <div>
                        <div>
                            <input type="text" name="userNo" value="${userNo}" style="display: none">

                            <dl>
                                <dt>점수</dt>
                                <dd><input type="text" name="score" placeholder="재무재표를 보고 점수를 기입."></dd>
                            </dl>
                            <dl>
                                <dt>여기서 첨부파일을 볼 수 있어야 함.</dt>
                                <dd><input type="text" placeholder="?"></dd>
                            </dl>
                        </div>
                        <div class="bt_wrap">
                            <button type="submit" value="평가" style="font-size:20px; background-color: #FFC007; border-radius: 10px">
                        </div>
                        <a href="<%=request.getContextPath()%>/creditManage"><input type="button" value="취소" style="font-size:20px; background-color: #FFC007; border-radius: 10px"></a>
                    </div>
                </form>
                </div>
            </div>
        </section>
    </body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
