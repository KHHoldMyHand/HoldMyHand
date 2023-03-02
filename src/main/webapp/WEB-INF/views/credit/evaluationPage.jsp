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
                                <%-- 첨부파일 여기--%>

                                <dt>재무재표 첨부파일의 날짜를 기입하세요.</dt>
                                <dd><input type="date" id="today-date" name="fileDate"></dd>
                            </dl>
                        </div>
                        <div >
                            <a href="/fileDownload?fileName=${FileInfo.fileName}">${FileInfo.fileName}<input type="button" value="재무재표" style="font-size:20px; background-color: #FFC007; border-radius: 10px"></a>
                            <a href="<%=request.getContextPath()%>/creditManage"><input type="button" value="취소" style="font-size:20px; background-color: #FFC007; border-radius: 10px"></a>
<%--                            <input type="button" value="평가" onclick="Evaluation()" style="font-size:20px; background-color: #FFC007; border-radius: 10px">--%>
                            <button type="submit" value="평가" style="font-size:20px; background-color: #FFC007; border-radius: 10px">

                        </div>

                    </div>
                </form>
                </div>
            </div>
        </section>
    </body>
<%--<script type="text/javascript">--%>
<%--    function Evaluation() {--%>
<%--        document.submit(); // 전송--%>
<%--    }--%>
<%--</script>--%>
<script>
    let today = new Date().toISOString().slice(0,10);
    document.getElementById("today-date").max = today;
    document.getElementById("today-date").value = today;
    // function ho(){
    //     alert(today);
    // }
</script>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
