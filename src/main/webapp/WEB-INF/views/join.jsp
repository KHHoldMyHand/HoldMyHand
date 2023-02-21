<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


<section class="py-5" id="features">
    <%--    아래 주석까지 코드 삭제해서 새로 짜는게 편할 거야 넵~~^^--%>
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <title>회원가입</title>

            <style>
                #h{
                    margin-top : 30px;
                    border-radius:10px;
                    border;
                }

                h1{
                    bold;
                }

                h4 {
                    color: black;
                    margin : 80px;
                    margin-top : 26px;
                    margin-bottom : 16px;
                }

                #idCheck{
                    margin-top : 16px;
                    margin-left : 0px;
                    margin-bottom : 0px;

                }

                .outer{
                    width:60%;
                    min-width : 650px;
                    background: rgb(248, 249, 250);
                    box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px;
                    margin:auto;
                    margin-top : 70px;
                    margin-bottom : 70px;
                }

                #joinForm {
                    width : 400px;
                    margin: auto;
                    padding: 10px;
                }

                #joinForm h1 {
                    text-align:center;
                }


                .input_area {
                    border: solid 1px #dadada;
                    padding : 10px 10px 14px 10px;
                    background : white;
                }

                .input_area input:not([type=checkbox]) {
                    width : 250px;
                    height : 30px;
                    border: 0px;
                }

                .btnArea {
                    text-align:center;
                    padding : 50px;
                }

                button {
                    width : 100px;
                    height : 35px;
                    border : 0px;
                    color:white;
                    background:#282A35;
                    margin : 10px;
                }

            </style>

            </head>
            <body>
            <!-- index.jsp 생성 후 모든 페이지에 include할 menubar.jsp 생성 -->

            <div class="outer">
                <div id="joinInfoArea">
                    <form id="joinForm" action="<%= request.getContextPath() %>/index.jsp"
                          method="post" onsubmit="return validate();">
                        <h1>회원 가입</h1>

                        <h4>* ID(사업자등록번호)</h4>
                        <span class="input_area"><input type="text" maxlength="13" name="userId" required
                                                        placeholder="(-없이) 000-00-00000"></span>
                        <button id="idCheck" type="button">중복확인</button>
                        <h4>* 비밀번호</h4>
                        <span class="input_area"><input type="password" maxlength="15" name="userPwd" required
                                                        placeholder="영문,숫자,특수문자 8~15자 입력"></span>
                        <h4>* 비밀번호 확인</h4>
                        <span class="input_area"><input type="password" maxlength="15" name="userPwd2" required
                                                        placeholder="영문,숫자,특수문자 8~15자 입력"></span>
                        <label id="pwdResult"></label>
                        <hr id="h">
                        <tr>
                            <h4>* 업체명</h4>

                            <td class="bt0">
                                <input type="text" id="enpNm" name="enpNm" placeholder="업체명"
                                       required="required" class>
                                <button type="button" class="btn_del">
                                    <span>입력내용 삭제</span>
                                </button>
                                <p class="txt_error" id="enp_nm_txt_error" style="display: none;">업체명을 입력해 주세요.</p>
                                <div class="mt8">
                                    <div class="select w240">

                                        <select name="searchSvcGrpCd" id="searchSvcGrpCd" class="necessary" title="기업종류" style=""><option value="">기업종류</option><option value="01">주식회사</option><option value="02">합명회사</option><option value="03">합자회사</option><option value="04">유한회사</option><option value="05">비영리재단법인</option><option value="06">비영리사단법인</option><option value="07">조합</option><option value="08">외국법인</option><option value="09">의료법인</option><option value="10">학교법인</option><option value="11">종교법인</option><option value="12">학술장학법인</option><option value="13">사회복지법인</option><option value="14">기타공익법인</option><option value="18">법인격없는 단체</option><option value="19">유한책임회사</option><option value="99">기타법인</option></select>
                                    </div>
                                </div>

                                <p class="txt_caption">
                                    업체명 항목에 순수기업명을 입력하시기 바랍니다.<br> <strong class="mt6 bold">(예:‘주식회사 가나’, ‘㈜가나’, ‘의료법인가나’인 경우 ‘가나’만 입력)</strong>
                                <h4>* 대표자명</h4>
                                <span class="input_area"><input type="text" maxlength="5" name="userName" required
                                                                placeholder="대표자명"></span>

                                <h4>대표 연락처</h4>
                                <span class="input_area"><input type="tel" maxlength="11" name="phone"
                                                                placeholder="(-없이)01012345678"></span>

                                <h4>이메일</h4>
                                <span class="input_area"><input type="email" name="email"
                                                                placeholder="대표 이메일"></span>

                                <h4>우편번호</h4>
                                <span class="input_area"><input type="text" name="address" class="postcodify_postcode5"
                                                                placeholder="우편번호 검색"></span>
                                <button type="button" id="postcodify_search_button">검색</button>
                                <h4>사업자등록상 주소</h4>
                                <span class="input_area"><input type="text" name="address" class="postcodify_address"></span>
                                <h4>상세주소</h4>
                                <span class="input_area"><input type="text" name="address" class="postcodify_details"></span>

                                <div class="btnArea">
                                    <button id="joinBtn">가입하기</button>
                                </div>
                    </form>
                </div>
            </div>

            <!— 주소 API 스크립트 —>
            <!— jQuery와 Postcodify를 로딩한다 —>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

            <!— "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 —>
            <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

            <script>
                function validate(){
                    return true;
                }
            </script>
            </body>
            </html>
        </div>
            <%—  여기 주석까지 코드 삭제해서 새로 짜는게 편할 거야 넵~~^^  —%>
</section>

