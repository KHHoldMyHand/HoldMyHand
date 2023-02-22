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
                    <form id="joinForm" action="<%= request.getContextPath() %>/index.jsp" method="post"
                          onsubmit="return validate();">
                        <h1>신용정보 입력</h1>
                        <hr id="line2">

                        <!-- 설립자 -->
                        <div>
                            <h4>* 설립자명</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="userId"
                                                            required placeholder="(-없이) 000-00-00000"></span>
                            <hr id="line2">
                        </div>
                        <!-- 설립일자 -->
                        <div>
                            <h4>* 설립일자</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="userId"
                                                            required placeholder="(-없이) 예시. 2000.01.01"></span>
                            <hr id="line2">
                        </div>

                        <!-- 기업규모 -->
                        <div>
                            <h4>* 기업규모</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="userId"
                                                            required placeholder="(-없이) 000-00-00000"></span>
                            <hr id="line2">
                        </div>

                        <!-- 종업원수 -->
                        <div>
                            <h4>* 종업원수</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="userId"
                                                            required placeholder="(-없이) 000-00-00000"></span>
                            <hr id="line2">
                        </div>

                        <!-- 세금관련 (홈택스링크걸기) -->
                        <div>
                            <h4>* 세금</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="userId"
                                                            required placeholder="(-없이) 000-00-00000"></span>
                            <hr id="line2">
                        </div>

                        <!-- 파일첨부 -->
                        <div>
                            <h4>* 파일첨부</h4>
                            <span class="input_area"><input type="text" maxlength="13" name="userId"
                                                            required placeholder="(-없이) 000-00-00000"></span>
                            <hr id="line2">
                        </div>

                    </form>
                </div>
            </div>

            </body>
        </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>

