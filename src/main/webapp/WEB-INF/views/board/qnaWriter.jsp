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

        .board_write .title, .cont{
            border-color: #FFC007;
            border-style: solid;
        }

        .bt_wrap {
            text-align:right;
            font-size:20px;'
            width : 100px;

        }
    </style>

    <body>
        <section class="py-5">
            <div class="container px-5 my-5">
                <div class="text-center mb-5">
                    <h1 class="fw-bolder">QNA</h1>
                    <p class="lead fw-normal text-muted mb-0">게시글 작성</p>
                </div>
                <form action="<%=request.getContextPath()%>/qnaWrite" method="post">

                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="title">
                            <dl>
                                <dt>제목</dt>
                                <input type="text" name="userNo" value="${login.userNo}" style="display:none">
                                <dd><input type="text" name="title" placeholder="제목을 입력하세요."></dd>
                            </dl>
                        </div>
                        <div>
                        <dl>
                            <dt>작성자</dt>
                            <input type="text" name="writer" value="${login.corpManager}" readonly>
                        </dl>
                        </div>
                        <br>
                        <div class="cont">
                            <h3>내용<h3>
                                    <textarea placeholder="내용 입력" name="content" cols="50" rows="50"></textarea>
                        </div>
                        <br>
                        <div class="bt_wrap">


                            <button type="submit"  style="font-size:20px; background-color: #FFC007; border-radius: 10px; width:100px; height:50px;">등록</button>

                            <button onclick="location.href='qna'"  type="reset"  id="no"  style="font-size:20px; background-color: #FFC007; border-radius: 10px; width:100px; height:50px;">취소</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </section>
    </body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>