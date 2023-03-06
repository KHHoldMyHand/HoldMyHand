<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<!-- 검색창 -->
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<!-- 리스트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<%--<link href="../resources/css/faq.css" rel="stylesheet" type="text/css">--%>
<link href="../resources/css/join.css" rel="stylesheet" type="text/css">
<section class="qnaMain faqPage py-5">
    <article class="contain">
        <div class="text-center">
            <h1 class="text-center">자주묻는질문게시판</h1>
        </div>

        <div class="search_wrap">
            <div class="search_box">
                <input type="text" class="input" placeholder="검색어를 입력하세요">
            </div>
            <div class="btn">
                <i class="fas fa-search"></i>
            </div>
        </div>


        <div class="Accordion_wrap">
            <div class="que">
                <span>신용을 자바 어떻게 진행하나요??</span>
                <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                    <span class="arrow-top" style="font-size:20px" ;>▲</span>
                    <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                </div>
            </div>
            <div class="anw">
                <span>안녕하세요. 신용을 자바 입니다. 먼저 회원가입을 하신 후 신용평가를 눌러 양식에 맞게 작성 및 재무제표 파일을 첨부해주시면, 심사 진행 후 신용평가 결과를 보여드립니다.</span>
            </div>

            <div class="que">
                <span>질문2</span>
                <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                    <span class="arrow-top" style="font-size:20px" ;>▲</span>
                    <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                </div>
            </div>
            <div class="anw">
                <span>내용2</span>
            </div>

            <div class="que">
                <span>질문3</span>
                <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                    <span class="arrow-top" style="font-size:20px" ;>▲</span>
                    <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                </div>
            </div>
            <div class="anw">
                <span>내용3</span>
            </div>

            <div class="que">
                <span>질문4</span>
                <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                    <span class="arrow-top" style="font-size:20px" ;>▲</span>
                    <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                </div>
            </div>
            <div class="anw">
                <span>내용4</span>
            </div>

            <div class="que">
                <span>질문5</span>
                <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                    <span class="arrow-top" style="font-size:20px" ;>▲</span>
                    <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                </div>
            </div>
            <div class="anw">
                <span>내용5</span>
            </div>
        </div>
    </article>
</section>


<script>
    $(".que").click(function () {
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });
</script>

<style>
    /*아코디언 리스트*/
    .Accordion_wrap {
        width: 80%;
        height: 400px;
        margin: auto;
    }

    .que:first-child {
        border-top: 1.5px solid white;
    }

    .que {
        position: relative;
        padding: 20px 0;
        cursor: pointer;
        font-size: 15px;
        border-bottom: 1px solid #dddddd;
        background-color: white;
        border-radius: 10px;
    }

    .que::before {
        display: inline-block;
        content: 'Q';
        font-size: 20px;
        font-weight: bold;
        color: #006633;
        margin: 0 30px;
    }

    .que.on > span {
        color: #006633;
    }

    .anw {
        display: none;
        overflow: hidden;
        font-size: 14px;
        background-color: #f4f4f2;
        padding: 20px 0;
        border-radius: 10px;
    }

    .anw::before {
        display: inline-block;
        content: 'A';
        font-size: 20px;
        font-weight: bold;
        color: #666;
        margin: 0 30px;
    }

    .arrow-wrap {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translate(0, -50%);
    }

    .que .arrow-top {
        display: none;
    }

    .que .arrow-bottom {
        display: block;
    }

    .que.on .arrow-bottom {
        display: none;
    }

    .que.on .arrow-top {
        display: block;
    }
</style>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>
