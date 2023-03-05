<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<section class="qnaMain qnaInfo py-5">
    <div class="contain px-5 my-5">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">QNA</h1>
            <p class="lead fw-normal text-muted mb-0">게시물 상세보기</p>
        </div>
        <div id="wrap">
            <form method="post" role="form">
                <input type="text" name="QANo" value="${vo.QANo}" style="display:none">
                <input type="text" name="userNo" value="${vo.userNo}" style="display:none">
                <input type="text" name="count" value="${vo.count}" style="display:none">
                <ul>
                    <li class="row">
                        <span class="tit17B col-2" name="writeDate">작성일</span>
                        <span class="write_input col-10"><input class="tit15B" type="text" value="${vo.writeDate}" readonly></span>
                    </li>
                    <li class="row">
                        <span class="tit17B col-2" name="writer">작성자</span>
                        <span class="write_input col-10"><input class="tit15B" type="text" value="${vo.writer}" readonly></span>
                    </li>
                    <li class="row">
                        <span class="tit17B col-2" name="title">제 목</span>
                        <span class="write_input col-10"><input class="tit15B" type="text" value="${vo.title}" readonly></span>
                    </li>
                    <li class="row">
                        <span class="tit17B col-2" name="content">내 용</span>
                        <span class="write_input col-10" style="height: 250px;"><textarea
                                    class="tit15B" readonly>${vo.content}</textarea></span>
                    </li>
                </ul>
            </form>

                <ul class="btn_wrp">
                    <li><button class="gold_btn" id="update_btn" type="submit">수정</button></li>
                    <li><button class="gold_btn" type="button" onclick="location.href='qna'">목록</button></li>
                    <li><button class="gold_btn" id="delete_btn" type="submit">삭제</button></li>
                </ul>

                <ul style="margin: 0 200px -25px;padding: 10px 0; border-radius: 7px; text-align: center">댓글 목록</ul>
                <ul id="write" style="margin: 30px 200px; border-radius: 7px; padding: 5px 20px; border: 1px solid #ddd;background-color: #fefefe;">
                    <c:forEach items="${getReplyList}" var="li">
                    <li style="padding: 5px;">${li.reWriter} > ${li.replyContent}</c:forEach></li>
                </ul>

                <!-- 댓글 부분 -->
                <div div class="comment_wrp">
                    <form id="writeCommentForm">
                        <list class="row">
                            <input type="hidden" name="comment_board">
                            <input type="hidden" name="comment_id">
                            <!-- 아이디 / 본문작성 / 댓글 등록 버튼-->
                            <span class="col-2 tit17B" readonly>작성자 : ${vo.writer}</span>
                            <!-- 본문 작성-->
                            <span class="col-8"><textarea style="width: 100%;" name="comment_content" id="commentInput" rows="4" cols="150"></textarea></span>
                            <span class="col-2"><a class="gold_btn" id="replyRegistration">댓글등록</a></span>
                        </list>
                    </form>
                </div>

                <!-- -------------------------------------- 아래는... ----------------------------------- -->
                <list>
                    <c:forEach items="${readReply}" var="replyList">
                    <input type="text" name="ReplyNo" value="${replyList.ReplyNo}" style="display:none">
                    <input type="text" name="QANo" value="${replyList.QANo}" style="display:none">
                    <input type="text" name="userNo" value="${replyList.userNo}" style="display:none">

                        <!-- 댓글 읽기/수정/삭제-->
                        <tr bgcolor="#FFC007">
                            <td size="7" color="yellow"> ${replyList.ReWriter} </td>
                            <td>${replyList.replyContent}</td>
                            <td width="200">
                                <div id="btn">
                                    <a href="<%=request.getContextPath()%>/qnaWriter" style="color:blue;">[수정]</a><br>
                                    <a href="" style="color: blue;">[삭제]</a>

                                </div>
                                <table>
                                    <c:forEach items="${replyList}" var="replyList">
                                        <div>
                                            <input type="text" name="ReplyNo" value="${replyList.ReplyNo}"
                                                   style="display:none">
                                            <input type="text" name="QANo" value="${replyList.QANo}"
                                                   style="display:none">
                                            <input type="text" name="userNo" value="${replyList.userNo}"
                                                   style="display:none">
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
                                    </c:forEach>
                                </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function () {
        let formObj = $("form[role='form']");
        <!-- 삭제 -->
        $("#delete_btn").click(function () {
            formObj.attr("action", "/delete");
            formObj.attr("method", "post");
            formObj.submit();
        });
        <!-- 수정 -->
        $("#update_btn").click(function () {
            formObj.attr("action", "/Gupdate");
            formObj.attr("method", "get");
            formObj.submit();
        });
    })
    $("#replyRegistration").click(function () {
        // 작성자, 댓글 ,
        let commentInput = $("#commentInput").val();
        console.log("commentInput : " + commentInput);
        let jsonObj = {
            "replyContent": commentInput,
            "qaNo": parseInt("${QANo}")
        }
        $.ajax({
            type: "POST",
            url: "/saveReply",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(jsonObj),
            success: function (data) {
                let qy = ``;
                for (let dt of data) {
                    qy += `<li style="padding: 5px;">\${dt.reWriter} > \${dt.replyContent}</li>`
                }
                $("#write").html(qy);
            }, error: function (data) {
                alert("실패");
            }
        })
    })
</script>


<%@ include file="/WEB-INF/views/include/footer.jspf" %>