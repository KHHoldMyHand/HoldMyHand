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
<section class="qnaMain py-5">
    <article class="contain">
        <div class="text-center">
            <h1 class="text-center">자주묻는질문게시판</h1>
        </div>

        <div class="search_wrap"style="margin: 20px 20px; text-align: center">
            <div class="search_box">
                <input style="border-radius: 4px; width: 300px; height: 35px;" type="text" class="input" placeholder="검색어를 입력하세요">
                <div class="btn">
                    <i class="fas fa-search"></i>
                </div>
            </div>
        </div>


        <div class="Accordion_wrap">
            <div class="que">
                <span>질문1</span>
                <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                    <span class="arrow-top" style="font-size:20px" ;>▲</span>
                    <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                </div>
            </div>
            <div class="anw">
                <span>내용1</span>
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
<style>
    body {
        background: rgba(255, 247, 137, 0.132);
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

    .table tr {
        text-align: center;
    }

    .table tr:first-child {
        border-top: 3px solid gold;
    }

    .table tr th {
        border-bottom: 1px solid #ddd;
        height: 35px;
        line-height: 35px;
    }

    .table tr td {
        border-bottom: 1px solid #ddd;
        height: 35px;
        line-height: 35px;
    }

    .table .table_btn {
        background: gold;
        padding: 7px 10px;
        font-weight: 500;
        font-size: 14px;
        outline: none;
        border: none;
        border-radius: 7px;
    }
</style>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>
