<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!--<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$("#joinBtn").click(function(){
// 업로드 파일 전부 append
var str="";
$(".deleteFile").each(function(index){
var that = $(this);
var data = that.attr("data-src");
str += "<input type='file' name='files["+index+"]' value='"+data+"' >";
});

$("form").append(str);
$("form").submit();
});
</script>-->


<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <title>신용정보 입력</title>
            <link href="../resources/css/join.css" rel="stylesheet" type="text/css">
            <body>

            <div class="outer">
                <!-- 사업자명 가져오기 -->
                <div id="joinInfoArea">
                    <form id="joinForm" action="${contextPath}/submitCreditInfo" method="post"
                          name="frm" enctype="multipart/form-data">
                        <h1 class="tit30B">신용정보 입력</h1>
                        <!-- -->
                        <input style="display: none" type="text" name="userNo" value="${login.userNo}"/>
                        <!-- 설립자 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 설립자명</h4>
                            <span class="in_area"><input class="insert_input" type="text" maxlength="13"
                                                         name="establishmentName" id="establishmentName"
                                                         required placeholder="설립자명을 입력해주세요."></span>
                        </div>
                        <!-- 설립일자 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 설립일자</h4>
                            <span class="in_area"><input class="insert_input" type="text" maxlength="8"
                                                         name="establishmentDate" id="establishmentDate"
                                                         required placeholder="19950907"></span>
                        </div>

                        <!-- 기업규모 -->
                        <%-- 리스트형으로 선택 하게--%>

                        <!-- 업체명 -->
                        <div class="gold_line" style="margin-bottom: 50px;">
                            <h4 class="tit17">* 업체명</h4>
                            <input class="insert_input" type="text" id="companyName" name="companyName"
                                   placeholder="업체명"
                                   required="required">
                        </div>

                        <div class="gold_line">
                            <h4 class="tit17">* 기업규모</h4>
                            <div class="select">
                                <select name="companyScale" id="companyScale"
                                        class="necessary insert_input" title="업체규모"
                                        style="width: 200px; height: 39px; margin-top: 10px;">
                                    <option value="">기업종류</option>
                                    <option value="중소기업">중소기업</option>
                                    <option value="중견기업">중견기업</option>
                                    <option value="대기업">대기업</option>
                                    <option value="공기업">공기업</option>
                                    <option value="기타법인">기타법인</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <!-- 종업원수 -->
                            <div class="gold_line">
                                <h4 class="tit17">* 종업원수</h4>
                                <span class="in_area">
                                    <input class="insert_input" type="text"
                                           name="employeers" id="employeers" required></span>
                            </div>
                        </div>


                        <!-- 파일첨부 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 파일첨부</h4>
                            <div class="filebox">
                                <%--                                    <input type="file" name="uploadFile">--%>
                                <input readonly placeholder="첨부파일" class="upload-name insert_input" value="첨부파일"/>
                                <label style="cursor: pointer;" class="gold_btn" for="uploadFile">파일첨부</label>
                                <input class="hidden" type="file" id="uploadFile" name="uploadFile">
                            </div>
                        </div>

                        <!-- 세금관련 (홈택스링크걸기) -->
                        <div class="gold_line" style="margin-bottom: 25px;">
                            <h4 class="tit17">* 세금 관련서류제출</h4>
                            <a class="hometax_link" target="_blank" href="https://www.hometax.go.kr/"><img
                                    src="/resources/images/hometax.jpg"></a>
                        </div>

                        <div class="btnArea" style="padding: 0;">
                            <button type="button" id="joinBtn" onclick="ClickSubmit()">제출</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        </body>
</section>

<style>
    * {
        font-family: 'Pretendard', sans-serif;
        font-size: 16px;
        font-weight: 600;
        color: #111;
    }

    .gold_btn {
        width: 100px;
        height: 40px;
        color: #333;
        background: gold;
        margin: 10px;
        border-radius: 10px;
        display: inline-block;
        text-align: center;
        line-height: 40px;
    }

    .outer {
        padding: 20px !important;
    }

    .tit30B {
        font-size: 30px;
        font-weight: 700;
        margin-bottom: 25px;
    }

    .tit17 {
        font-size: 17px;
        font-weight: 600;
        margin-top: 15px;
        margin-bottom: 10px;
    }

    .gold_line {
        border-top: 5px solid gold;
        margin-bottom: 50px;
    }

    .hometax_link img {
        max-width: 100%;
        width: 114px;
        height: 57px;
    }

    .insert_input {
        background: #fff;
        border-radius: 10px;
        outline: none;
        border: 2px solid #ddd;
        padding: 7px 10px;
        font-size: 15px;
        font-weight: 500;
        color: #444;
    }

    .in_area {
        display: inline-block;
    }

    .insert_input::placeholder {
        color: #888;
    }

    #joinForm {
        width: 500px !important;
    }

    .hidden {
        position: absolute;
        top: 0;
        left: 0;
        z-index: -1;
        visibility: hidden;
        opacity: 0;
    }
</style>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">

    // 파일찾기 커스텀
    $(document).ready(function () {
        $("#uploadFile").on('change', function () {
            var fileName = $("#uploadFile").val();
            $(".upload-name").val(fileName);
        });

    });
</script>
<script type="text/javascript">
    // 제출 시 전송
    function ClickSubmit() {
        let establishmentName = document.getElementById("establishmentName");
        let establishmentDate = document.getElementById("establishmentDate");
        let companyName = document.getElementById("companyName");
        let companyScale = document.getElementById("companyScale");
        let employeers = document.getElementById("employeers");
        let uploadFile = document.getElementById("uploadFile");

        //전송 입력값 없으면 알림
        if (establishmentName.value == "") {
            alert("설립자명을 입력해주세요.");
            establishmentName.focus();
            return false;
        }
        var onlyNum = /^[0-9]+/g; //숫자만 입력
        if (!onlyNum.test(establishmentDate.value)) {
            alert("설립일자를 입력해주세요.");
            establishmentDate.focus();
            return false;
        }
        if (companyName.value == "") {
            alert("업체명을 입력해주세요.");
            companyName.focus();
            return false;
        }
        if (companyScale.value == "") {
            alert("기업규모를 선택해 주십시오.");
            companyScale.focus();
            return false;
        }
        var onlyNum2 = /^[0-9]+/g; //숫자만 입력
        if (!onlyNum2.test(employeers.value)) {
            alert("종업원수를 입력해주세요.");
            employeers.focus();
            return false;
        }
        if (uploadFile.value == "") {
            alert("재무제표 등 첨부해 주세요.");
            uploadFile.focus();
            return false;
        }
        var lastCheck = confirm("설립자명 : " + establishmentName.value + "\n"
                              + "설립일자 : " + establishmentDate.value + "\n"
                              + "업체명 : " + companyName.value + "\n"
                              + "업체규모 : "  + companyScale.value + "\n"
                              + "종업원 수 : "  + employeers.value + "명\n 작성하신 내용이 맞습니까?");
        if (lastCheck == true) {
            document.frm.submit(); // 전송
        } else {
            return false;
        }
    }

</script>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


