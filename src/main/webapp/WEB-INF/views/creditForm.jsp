<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <title>신용정보 입력</title>
            <link href="../resources/css/join.css" rel="stylesheet" type="text/css">
            <body>

            <div class="outer">
                <!-- 사업자명 가져오기 -->
                <div id="joinInfoArea">
                    <form id="joinForm" action="<%= request.getContextPath() %>/creditInfo" method="post"
                          enctype="multipart/form-data">
                        <h1>신용정보 입력</h1>
                        <hr id="line2">

                        <!-- 설립자 -->
                        <div>
                            <h4>* 설립자명</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="establishmentName" required
                                                            required placeholder="설립자명을 입력해주세요."></span>
                            <hr id="line2">
                        </div>
                        <!-- 설립일자 -->
                        <div>
                            <h4>* 설립일자</h4>
                            <span class="input_area"><input type="number" maxlength="8" name="establishmentDate"
                                                            required placeholder="19950907"></span>
                            <hr id="line2">
                        </div>

                        <!-- 기업규모 -->
                        <%-- 리스트형으로 선택 하게--%>
                        <div>
                            <h4>* 기업규모</h4>
                            <input type="text" id="CompanyName" name="CompanyName" placeholder="업체명"
                                   required="required" style="width: 272px;height: 45px;border: solid 1px #dadada;
                                   padding: 10px 10px 14px 10px;background: white;vertical-align: middle;border-radius: 6px;">
                            <!-- 업체규모 -->
                            <div class="mt8">
                                <div class="select w240">
                                    <select name="companyScale" id="companyScale"
                                            class="necessary" title="업체규모"
                                            style="width: 272px;height: 45px;border: solid 1px #dadada;
                                            padding: 10px 10px 14px 10px;background: white;vertical-align: middle;border-radius: 6px;">
                                        <option value="">기업종류</option>
                                        <option value="중소기업">중소기업</option>
                                        <option value="중견기업">중견기업</option>
                                        <option value="대기업">대기업</option>
                                        <option value="공기업">공기업</option>
                                        <option value="기타법인">기타법인</option>
                                    </select>
                                </div>
                                <hr id="line2">
                            </div>

                            <!-- 종업원수 -->
                            <div>
                                <h4>* 종업원수</h4>
                                <span class="input_area">
                                    <input type="text" name="employeers" id="employeers" required></span>
                                <hr id="line2">
                            </div>

                            <!-- 파일첨부 -->
                            <div>
                                <h4>* 파일첨부</h4>
                                <label>
                                    <div class="file_btn">파일 선택</div>
                                </label>
                                <input type="file" id="addfile" name="addfile" multiple/>
                                <hr id="line2">
                            </div>

                            <!-- 세금관련 (홈택스링크걸기) -->
                            <div>
                                <h4>* 세금 관련서류제출</h4>
                                <a href="https://www.hometax.go.kr/"><img src="/resources/images/hometax.jpg"
                                              width="30%" height="30%"></img></a>
                                <hr id="line2">
                            </div>

                            <div class="btnArea">
                                <button id="joinBtn">제출</button>
                            </div>

                    </form>
                </div>
            </div>

            </body>
        </div>
</section>
<style>
    .file_btn {
        width: 100px;
        height: 30px;
        border: 5px;
        color: black;
        background: gold;
        margin: 10px;
        border-radius: 10px;
        text-align: center;
    }

</style>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


