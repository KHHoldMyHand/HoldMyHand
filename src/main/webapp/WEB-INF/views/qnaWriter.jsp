<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


    <style>
        body {
            background-color: beige;
        }
        .board_write .title,
        .board_write .info {
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
        .board_write .title dd,
        .board_write .info dt,
        .board_write .info dd {
            display: inline-block;
            vertical-align: middle;
            font-size: 1.4rem;
        }

        .board_write .title dt,
        .board_write .info dt {
            width: 90px;

        }

        .board_write .title dd {
            width: 80%
        }


        .board_write .title input[type="text"],
        .board_write .info input[type="text"],
        .board_write .info input[type="password"],
        .board_write .info input[type="email"] {
            padding: 10px;
            box-sizing: border-box;

        }


        .board_write .title input[type="text"] {
            width: 100%;
        }


        .board_write .title dl {
            font-size: 0;
        }

        .board_write .info dl {
            display: inline-block;
            width: 100%;
            vertical-align: middle;
        }

        .board_write .title, .info, .cont{
            border-color: white;
            border-style: groove;
        }

        .bt_wrap {
            text-align:right;
            font-size:16px;
        }
    </style>

    <body>

        <section class="py-5">
            <div class="container px-5 my-5">
                <div class="text-center mb-5">
                    <h1 class="fw-bolder">Q&A</h1>
                    <p class="lead fw-normal text-muted mb-0">게시글 작성</p>
                </div>
                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="title">
                            <dl>
                                <dt>제목</dt>
                                <dd><input type="text" placeholder="제목을 입력하세요."></dd>
                            </dl>
                        </div>
                        <div class="info">
                            <dl>
                                <dt>작성자</dt>
                                <dd><input type="text" placeholder="작성자" disabled></dd>
                            </dl>
                            <dl>
                                <dt>비밀번호</dt>
                                <dd><input type="password" placeholder="비밀번호 입력"></dd>
                            </dl>
                            <dl>
                                <input type="radio" name="open" checked>
                                <dt style="font-size: 20px;">공개</dt>
                                <input type="radio" name="open" checked>
                                <dt style="font-size: 20px;">비공개</dt>
                            </dl>
                        </div>
                        <div class="cont">
                            <h3>내용<h3>
                                    <textarea placeholder="내용 입력" cols="30" rows="10"></textarea>
                        </div>
                        <br>
                        <div class="bt_wrap">
                            <button>등록</button>
                            <button>취소</button>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>