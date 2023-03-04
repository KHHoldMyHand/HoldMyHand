<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
   <!-- 제이쿼리 -->
   <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

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

        #write {
            width: 100%;
            height : 300px;
            border : 1px solid black;
            margin : 1% 0;
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
        <div id="board" readonly>
            <table id="detailBoard" width="100%" border="3" bordercolor="skyblue">
            <form method="post" role="form">
                <input type="text" name="QANo" value="${vo.QANo}" style="display:none">
                <input type="text" name="userNo" value="${vo.userNo}" style="display:none">
                <input type="text" name="count" value="${vo.count}" style="display:none">
                <tr>
                    <td id="title" name="writeDate">작성일</td>
                    <td>${vo.writeDate}</td>
                </tr>
                <tr>
                    <td id="title" name="writer">작성자</td>
                    <td><input type="text" value="${vo.writer}" readonly></td>
                </tr>
                <tr>
                    <td id="title" name="title">제 목</td>
                    <td>${vo.title}</td>
                </tr>
                <tr>
                    <td id="title" name="content" style="height: 300px;">내 용</td>
                    <td>${vo.content}</td>
                </tr>


                <tr align="center" valign="middle" style="height: 50;">
                    <td colspan="5">
                        <button id="update_btn" type="submit"  style="font-size:20px; background-color: #FFC007; border-radius: 10px";>수정</button>
                        <button type="button" onclick="location.href='qna'"  style="font-size:20px; background-color: #FFC007; border-radius: 10px;">목록</button>
                        <button id="delete_btn" type="submit"  style="font-size:20px; background-color: #FFC007; border-radius: 10px;">삭제</button>
                    </td>
                </tr>
                </form>
            </table>
        </div>

        <div id="write" readonly>
        <c:forEach items="${getReplyList}" var="li">
            <div>${li.reWriter} : ${li.replyContent} </div>
        </c:forEach>
        </div>



        <br><br>

        <!-- 댓글 부분 -->
        <div id="comment">
            <table>
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
                                <textarea name="comment_content" id="commentInput" rows="4" cols="124"></textarea>
                            </div>
                        </td>
                        <!-- 댓글 등록 버튼 -->
                        <td>
                            <div id="btn">
                                <p><div class="btn btn-success" id="replyRegistration">[댓글등록]</div> </p>
                            </div>
                        </td>
                    </form>
                </tr>
            </table>
            <table width="100%" border="3" bordercolor="skyblue" >
                <c:forEach items="${readReply}" var="replyList">
                <div>
                <input type="text" name="ReplyNo" value="${replyList.ReplyNo}" style="display:none">
                <input type="text" name="QANo" value="${replyList.QANo}" style="display:none">
                <input type="text" name="userNo" value="${replyList.userNo}" style="display:none">
                </div>
                <!-- 댓글 읽기/수정/삭제-->
                <tr bgcolor="#FFC007">
                    <td size="7" color="yellow"> ${replyList.ReWriter} </td>
                    <td>${replyList.replyContent}</td>
                    <td width="200">
                        <div id="btn">
                            <a href="<%=request.getContextPath()%>/qnaWriter" style="color:blue;">[수정]</a><br>
                            <a href="" style="color: blue;">[삭제]</a>
                        </div>
                    </td>
                </tr>
                </c:forEach>
            </table>
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

    $("#replyRegistration").click(function(){
        // 작성자, 댓글 ,
        let commentInput = $("#commentInput").val();

        console.log("commentInput : "+commentInput);
        let jsonObj = {
            "replyContent" : commentInput,
            "qaNo" : parseInt("${QANo}")
        }
        $.ajax({
            type : "POST",
            url : "/saveReply",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(jsonObj),
            success : function(data){
            let qy = ``;

            for(let dt of data){
            qy += `
                <div>\${dt.reWriter} : \${dt.replyContent}</div>
            `
            }
            $("#write").html(qy);

            },error : function(data){
            alert("실패");
            }
        })
    })


    </script>



<%@ include file="/WEB-INF/views/include/footer.jspf" %>