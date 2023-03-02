<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    .board_write .title, .cont {
        border-color: #FFC007;
        border-style: solid;
    }

    .bt_wrap {
        text-align: right;
        font-size: 20px;
    }
</style>
<style>
    * {
        font-family: 'Pretendard', sans-serif;
        font-size: 16px;
        font-weight: 600;
        color: #111;
    }

    .gold_btn {
        border: none;
        min-width: 100px;
        height: 40px;
        color: #333;
        background: gold;
        margin-right: 10px;
        border-radius: 10px;
        display: inline-block;
        text-align: center;
        transition: 0.3s ease;
        padding: 0px 10px;
    }

    .gold_btn:hover {
        background: #fbe878;
        transition: 0.3s ease;
    }
</style>
<body>

<section class="py-5">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">신용평가 페이지</h1>
            <p class="lead fw-normal text-muted mb-0">유저번호 : ${userNo}의 신용평가 페이지</p>
        </div>
        <div class="row">
            <div class="col-7" style="background: #fff;">
                <div>
                    쟈기양 여기에다가 테이블 넣어요
                </div>
            </div>
            <div class="col-5" style="padding: 0 20px;">
                <div class="board_write_wrap">
                    <form action="<%=request.getContextPath()%>/evaluateSuccess" id="scoreFrm" method="POST">
                        <div>
                            <div>
                                <input type="text" name="userNo" value="${userNo}" style="display: none">
                                <span style="display: block; width: 100%; margin-bottom: 10px; vertical-align: middle; font-size: 20px; font-weight: 700;">점수입력</span>
                                <input style="background: #fff; border: 1px solid #555; margin-bottom: 15px; width: 130px;
                                            border-radius: 7px; outline: none; height: 100px; font-size: 45px; text-align: center;"
                                           type="text" name="score" placeholder="재무재표를 보고 점수를 기입.">
                            </div>
                            <div>
                                <input type="date" id="today-date" name="fileDate">
                            </div>
                            <div>
                                <a href="/fileDownload?fileName=${FileInfo.fileName}">
                                    <input style="margin-bottom: 10px;" class="gold_btn" type="button"
                                        value="재무재표 다운로드"></a>
                            </div>
                            <div>
                                <a href="<%=request.getContextPath()%>/creditresult"><input class="gold_btn"
                                                                                            type="button"
                                                                                            value="취소"></a>
                                <input class="gold_btn" type="button" value="평가" onclick="Evaluation()">
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    function Evaluation() {
        alert("전송")
        document.getElementById("scoreFrm").submit(); // 전송
    }
</script>
<script>
    let today = new Date().toISOString().slice(0,10);
    document.getElementById("today-date").max = today;
    document.getElementById("today-date").value = today;
    // function ho(){
    //     alert(today);
    // }
</script>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>
