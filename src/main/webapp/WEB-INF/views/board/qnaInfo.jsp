<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

    <style>
        body {
            background-color: beige;
        }

        #wrap {
            width: 100%;
            margin: 0 auto 0 auto;
        }

        #title {
            height: 40;
            font-family: '돋움';
            font-size: 20;
            text-align: center;
            background-color: #FFC007;
        }

        #btn {
            font-family: '돋움';
            font-size: 20;
            text-align: center;
        }

        #comment {
            width: 100%;
        }
    </style>

    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="text-center mb-5">
                <h1 class="fw-bolder">QNA</h1>
                <p class="lead fw-normal text-muted mb-0">게시물 상세보기</p>
            </div>
    <div id="wrap">
        <br><br>
        <div id="board">
            <table id="detailBoard" width="100%" border="3" bordercolor="skyblue">

                <tr>
                    <td id="title">작성일</td>
                    <td>${data.writeDate}</td>
                </tr>
                <tr>
                    <td id="title">작성자</td>
                    <td><input type="text" value="${data.writer}" readonly></td>
                </tr>
                <tr>
                    <td id="title">제 목</td>
                    <td>${data.title}</td>
                </tr>
                <tr>
                    <td id="title" style="height: 300px;">내 용</td>
                    <td>${data.content}</td>
                </tr>


                <tr align="center" valign="middle" style="height: 50;">
                    <td colspan="5">
                        <input type="button" value="수정" style="font-size:20px; background-color: #FFC007; border-radius: 10px";>
                        <input type="button" value="삭제" style="font-size:20px; background-color: #FFC007; border-radius: 10px;">
                        <input type="button" value="답글" style="font-size:20px; background-color: #FFC007; border-radius: 10px;">
                        <input type="button" value="목록" style="font-size:20px; background-color: #FFC007; border-radius: 10px;">
                    </td>
                </tr>
            </table>
        </div>
        <br><br>

        <!-- 댓글 부분 -->
        <div id="comment">
            <table border="1" bordercolor="skyblue" style="width: 100%;">
                <!-- 댓글 목록 -->
                <tr>
                    <!-- 아이디, 작성날짜 -->
                    <td width="150">
                        <div class="formwriter">
                            <div class="writer" size="7" color="yellow">작성자</div>
                        </div>
                    </td>
                    <!-- 본문내용 -->
                    <td width="800">
                        <div class="text_wrapper">

                        </div>
                    </td>
                    <!-- 버튼 -->
                    <td width="200">
                        <div id="btn">
                            <a href="#" style="color:blue;">[답변]</a><br>
                            <a href="#" style="color:blue;">[수정]</a><br>
                            <a href="#" style="color: blue;">[삭제]</a>
                        </div>
                    </td>
                </tr>

                <!-- 로그인 했을 경우만 댓글 작성가능 -->
                <tr bgcolor="#FFC007">
                    <form id="writeCommentForm">
                        <input type="hidden" name="comment_board">
                        <input type="hidden" name="comment_id">
                        <!-- 아이디-->
                        <td>
                            <div>
                                작성자
                            </div>
                        </td>
                        <!-- 본문 작성-->
                        <td>
                            <div>
                                <textarea name="comment_content" rows="4" cols="150"></textarea>
                            </div>
                        </td>
                        <!-- 댓글 등록 버튼 -->
                        <td>
                            <div id="btn">
                                <p><a href="#" style="color: blue;">[댓글등록]</a></p>
                            </div>
                        </td>
                    </form>
                </tr>

            </table>
        </div>
    </div>
    </section>


<%@ include file="/WEB-INF/views/include/footer.jspf" %>