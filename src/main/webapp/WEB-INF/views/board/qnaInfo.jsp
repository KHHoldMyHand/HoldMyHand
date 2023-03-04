<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link rel="../resources/css/exam.css">
<!-- 제이쿼리 -->
    <section class="qnaMain qnaInfo py-5">
        <div class="contain px-5 my-5">
            <div class="text-center mb-5">
                <h1 class="fw-bolder">QNA</h1>
                <p class="lead fw-normal text-muted mb-0">게시물 상세보기</p>
            </div>
            <div id="wrap">
                <div id="board">
                    <ul id="detailBoard">
                        <form method="post" role="form">
                            <input type="text" name="QANo" value="${vo.QANo}" style="display:none">
                            <input type="text" name="userNo" value="${vo.userNo}" style="display:none">
                            <input type="text" name="count" value="${vo.count}" style="display:none">
                            <li class="row">
                                <span class="tit17B col-2" name="writeDate">작성일</span>
                                <span class="write_input col-10"><input class="tit15B" type="text" value="${vo.writeDate}" readonly></span>
                            </li>
                            <li class="row">
                                <span class="col-2 tit17B" name="writer">작성자</span>
                                <span class="col-10 write_input"><input class="tit15B" type="text" value="${vo.writer}" readonly></span>
                            </li>
                            <li class="row">
                                <span class="col-2 tit17B" name="title">제 목</span>
                                <span class="col-10 write_input"><input class="tit15B" type="text" value="${vo.title}"></span>
                            </li>
                            <li class="row">
                                <span class="tit17B col-2" name="content">내 용</span>
                                <span class="col-10 write_input" style="height: 250px;"><textarea class="tit15B">${vo.content}</textarea></span>
                            </li>
                        </form>
                    </ul>
                    <ul class="btn_wrp">
                        <li>
                            <button class="gold_btn" id="update_btn" type="submit">수정</button>
                        </li>
                        <li>
                            <button class="gold_btn" type="button" onclick="location.href='qna'">목록</button>
                        </li>
                        <li>
                            <button class="gold_btn" id="delete_btn" type="submit">삭제</button>
                        </li>
                    </ul>
                    <!-- 댓글 부분 -->
                    <div id="comment">
                        <div class="comment_wrp">
                            <form class="comment" id="writeCommentForm">
                                <input type="hidden" name="comment_board">
                                <input type="hidden" name="comment_id">
                                <!-- 아이디-->
                                <span class="col-2 tit17B">작성자</span>
                                <!-- 본문 작성-->
                                <span class="col-8">
                                    <textarea style="width: 100%;" name="comment_content" rows="4" cols="150"></textarea>
                                </span>
                                <!-- 댓글 등록 버튼 -->
                                <span class="col-2">
                                    <a class="gold_btn" href="#">댓글등록</a>
                                </span>
                            </form>
                        </div>
                        <table>
                            <c:forEach items="${replyList}" var="replyList">
                                <div>
                                    <input type="text" name="ReplyNo" value="${replyList.ReplyNo}" style="display:none">
                                    <input type="text" name="QANo" value="${replyList.QANo}" style="display:none">
                                    <input type="text" name="userNo" value="${replyList.userNo}" style="display:none">
                                </div>
                                <!-- 댓글 읽기/수정/삭제-->
                                <tr>
                                    <td> ${replyList.ReWriter} </td>
                                    <td>${replyList.replyContent}</td>
                                    <td>
                                        <div id="btn">
                                            <a href="<%=request.getContextPath()%>/qnaWriter">[수정]</a><br>
                                            <a href="">[삭제]</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
    $(document).ready(function(){
        let formObj = $("form[role='form']");

        <!-- 삭제 -->
        $("#delete_btn").click(function(){
            formObj.attr("action","/delete");
            formObj.attr("method","post");
            formObj.submit();
        });

        <!-- 수정 -->
        $("#update_btn").click(function(){
            formObj.attr("action","/Gupdate");
            formObj.attr("method","get");
            formObj.submit();
        });


    })
    </script>



<%@ include file="/WEB-INF/views/include/footer.jspf" %>