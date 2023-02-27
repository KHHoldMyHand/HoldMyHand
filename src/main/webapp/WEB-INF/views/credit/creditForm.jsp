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
                        <!-- 설립자 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 설립자명</h4>
                            <span class="in_area"><input class="insert_input" type="text" maxlength="13" name="establishmentName" required
                                                            required placeholder="설립자명을 입력해주세요."></span>
                        </div>
                        <!-- 설립일자 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 설립일자</h4>
                            <span class="in_area"><input class="insert_input" type="text" maxlength="8" name="establishmentDate" required placeholder="19950907"></span>
                        </div>

                        <!-- 기업규모 -->
                        <%-- 리스트형으로 선택 하게--%>
                        <div class="gold_line">
                            <h4 class="tit17">* 기업규모</h4>
                            <input class="insert_input" type="text" id="companyName" name="companyName" placeholder="업체명"
                                   required="required">
                            <!-- 업체규모 -->
                            <div style="margin-bottom: 50px;">
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

                            <!-- 종업원수 -->
                            <div class="gold_line">
                                <h4 class="tit17">* 종업원수</h4>
                                <span class="in_area">
                                    <input class="insert_input" type="text" name="employeers" id="employeers" required></span>
                            </div>

                            <!-- 파일첨부 -->
                            <div class="gold_line">
                                <h4 class="tit17">* 파일첨부</h4>
                                <div class="filebox">
                                    <input type="file" name="uploadFile" multiple="multiple">
                                    <!--<input style="cursor: pointer;" placeholder="첨부파일"
                                           class="insert_input upload-name" type=file" name= "uploadFile" value="첨부파일"/>
                                    <label for="file">파일첨부</label>
                                    <input type="file" id="file">-->
                                </div>
                            </div>

                            <!-- 세금관련 (홈택스링크걸기) -->
                            <div class="gold_line">
                                <h4 class="tit17">* 세금 관련서류제출</h4>
                                <a class="hometax_link" target="_blank" href="https://www.hometax.go.kr/"><img src="/resources/images/hometax.jpg"></a>
                            </div>

                            <div class="btnArea" style="padding: 0;">
                                <button type="button" id="joinBtn" onclick="ClickSubmit()">제출</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

            </body>
        </div>
    </div>
</section>
<!-- 실패 메세지를 출력(modal) -->
<div id="myMessage" class="modal fade" role="dialog" >
    <div class="modal-dialog">
        <!-- Modal content-->
        <div id="messageType" class="modal-content panel-info">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="tit17" class="modal-title">${msgType}</h4>
            </div>
            <div class="modal-body">
                <p>${msg}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<style>
    * {font-family: 'Pretendard', sans-serif; font-size: 16px; font-weight: 600; color: #111;}
    .gold_btn {width: 100px; height: 40px; color: #333; background: gold; margin: 10px; border-radius: 10px; display: inline-block;}
    .outer {padding: 20px !important;}
    .tit30B {font-size: 30px; font-weight: 700; margin-bottom: 25px;}
    .tit17 {font-size: 17px; font-weight: 600; margin-top: 15px; margin-bottom: 10px;}
    .gold_line {border-top: 5px solid gold; margin-bottom: 50px;}
    .hometax_link img {max-width: 100%; width: 114px; height: 57px;}
    .insert_input {background: #fff; border-radius: 10px; outline: none; border: 2px solid #ddd; padding: 7px 10px; font-size: 15px; font-weight: 500; color: #444;}
    .in_area {display: inline-block;}
    .insert_input::placeholder {color: #999;}
</style>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
    // 알림창
    $(document).ready(function () {
        <%--if (${!empty msgType}) {--%>
        <%--    $("#messageType").attr("class", "modal-content panel-success");--%>
        <%--    $("#myMessage").modal("show");--%>
        <%--}--%>

    });

    // 파일찾기 커스텀
    $("#file").on('change',function(){
        var fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });

    // 제출 시 전송
    function ClickSubmit() {
        document.frm.submit(); // 전송
    }


</script>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


