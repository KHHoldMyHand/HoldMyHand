<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<style>
    body {
        background: rgba(255, 247, 137, 0.132);
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

    .table tr {
        text-align: left;
    }

    .table tr:first-child {
        border-top: 3px solid gold;
    }

    .table tr td {
        border-bottom: 1px solid #ddd;
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
        margin: 5px 5px;
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
    .gold_line {
        border-top: 5px solid gold;
        margin-bottom: 50px;
    }
</style>
<body>

<section class="qnaMain py-5">
    <div class="contain">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">신용평가 페이지</h1>
            <p class="lead fw-normal text-muted mb-0">유저번호 : ${userNo}의 신용평가 페이지</p>
            <hr class="gold_line">
        </div>
        <div class="row">
            <div class="col-7" style="background: rgba(255, 247, 137, 0.132);">
                <div style="padding: 0 20px;">
                    <table class="table table-hover">
                        <tr>
                            <th class="text-left">기업 신용 정보</th>
                        </tr>
                        </thead>
                        <tbody class="table table-hover">
                        <tr>
                            <td class="text-left">* 설립자명</td>
                            <td class="text-left">${info.establishmentName}</td>
                        </tr>
                        <tr>
                            <td class="text-left">* 설립일자</td>
                            <td class="text-left">${info.establishmentDate}</td>
                        </tr>
                        <tr>
                            <td class="text-left">* 업체명</td>
                            <td class="text-left">${info.companyName}</td>
                        </tr>
                        <tr>
                            <td class="text-left">* 기업규모</td>
                            <td class="text-left">${info.companyScale}</td>
                        </tr>
                        <tr>
                            <td class="text-left">* 종업원 수</td>
                            <td class="text-left">${info.employeers}</td>
                        </tr>
                        <tr>
                            <td class="text-left">* 신청일</td>
                            <td class="text-left">${info.receiptDate}</td>
                        </tr>

                    </table>
                </div>
            </div>
            <div class="col-5" style="padding: 0 20px;">
                <div class="board_write_wrap">
                    <form action="<%=request.getContextPath()%>/evaluateSuccess" id="scoreFrm" method="POST">
                        <div>
                            <div>
                                <input type="text" name="userNo" value="${userNo}" style="display: none">
                                <span style="display: block; margin: 0 10px; width: 110px; text-align: center;
                                 vertical-align: middle; font-size: 20px; font-weight: 700;">점수입력</span>
                                <div class="select">
                                    <select id="score" Type="text" name="score" placeholder="A"
                                            class="necessary insert_input"
                                            style="background: rgba(255, 247, 137, 0.132); border: 1px solid #555;
                                                width: 130px; height: 80px; margin: 5px 5px; border-radius: 7px;
                                                text-align: center; font-size: 45px; outline: none;">
                                        <option value="S">AAA</option>
                                        <option value="A">AA</option>
                                        <option value="B">A</option>
                                        <option value="B">BBB</option>
                                        <option value="B">BB</option>
                                        <option value="B">B</option>
                                        <option value="C">CCC</option>
                                        <option value="C">CC</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="E">NR</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div>
                            <input type="date" id="today-date" name="fileDate"
                                   style="background: rgba(255, 247, 137, 0.132); margin: 5px 5px;
                                            width: 130px; height: 40px; border-radius: 7px; text-align:
                                            center; font-size: 17px;">
                        </div>
                        <div>
                            <a href="/fileDownload?fileName=${FileInfo.fileName}">
                                <input style="margin-bottom: 10px;" class="gold_btn" type="button"
                                       value="재무재표 다운로드"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/creditresult">
                                <input class="gold_btn" type="button" value="취소"></a>
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
    let today = new Date().toISOString().slice(0, 10);
    document.getElementById("today-date").max = today;
    document.getElementById("today-date").value = today;
    // function ho(){
    //     alert(today);
    // }
</script>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>
