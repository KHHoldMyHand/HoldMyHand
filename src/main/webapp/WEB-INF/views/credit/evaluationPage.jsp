<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<link rel="../resources/css/exam.css">
<body>
<section class="qnaMain evolPage py-5">
    <div class="contain">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">신용평가 페이지</h1>
            <p class="lead fw-normal text-muted mb-0">유저번호 : ${userNo}의 신용평가 페이지</p>
        </div>
        <div class="row">
            <div class="col-7">
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
                                    <select class="select_input" id="score" Type="text" name="score" placeholder="A"
                                            class="necessary insert_input">
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
                            <input class="date_input" type="date" id="today-date" name="fileDate">
                        </div>
                        <div>
                            <a href="/fileDownload?fileName=${FileInfo.fileName}">
                                <input style="margin-bottom: 10px; width: auto; padding: 0 15px;" class="gold_btn" type="button"
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
