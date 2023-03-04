<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<link rel="../resources/css/exam.css">
<section class="py-5 findId" id="features">
    <article class="qnaMain">
        <div class="w3-content w3-container w3-margin-top contain">
            <div class="w3-container w3-card-4 w3-auto">
                <div class="w3-center w3-large w3-margin-top">
                    <h3 class="tit30B">아이디 찾기</h3>
                </div>
                <form action="<%=request.getContextPath()%>/user/findUserId" method = "post">
                <div style="text-align: center;">
                    <p>
                        <label style="margin-right: 7px;">이름</label>
                        <input class="w3-input input-area" type="text" id="corpName" name="corpName" placeholder="이름을 입력하세요" required>
                    </p>
                    <p>
                        <label style="margin-right: 7px;">이메일</label>
                        <input class="w3-input input-area" type="text" id="userEmail" name="userEmail" placeholder="회원가입한 이메일주소를 입력하세요" required>
                    </p>
                    <p class="w3-center" style="display: flex; justify-content: center;">
                        <button type="submit" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round gold_btn" style="width: auto; padding: 0 15px;">아이디찾기</button>
                        <button type="button" onclick="history.go(-1);" class="gold_btn w3-button w3-hover-white w3-ripple w3-margin-top w3-round" style="width: auto; padding: 0 15px;">로그인으로</button>
                    </p>
                </div>
                </form>
            </div>
        </div>
    </article>
</section>











<%@ include file="/WEB-INF/views/include/footer.jspf" %>
