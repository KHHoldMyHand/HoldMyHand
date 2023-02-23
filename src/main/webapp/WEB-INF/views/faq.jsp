<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<!-- 검색창 -->
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<!-- 리스트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<body>
<section class="py-5 container px-3 my-3">
    <div class="height:40px; width:400px; border:1px;">

        <head>
            <meta charset="UTF-8">
            <title>자주묻는질문게시판</title>
            <link href="../resources/css/faq.css" rel="stylesheet" type="text/css">
        </head>

        <body>
            <div class="text-center mb-5">
                <h1 class="fw-bolder">자주 하는 질문 모아봤어요~!</h1>
            </div>

            <div class="search_wrap ">
                <div class="search_box">
                    <input type="text" class="input" placeholder="검색어를 입력하세요">
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
                    <span>까꿍</span>
                </div>

                <div class="que">
                    <span>질문2</span>
                    <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                        <span class="arrow-top" style="font-size:20px" ;>▲</span>
                        <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                    </div>
                </div>
                <div class="anw">
                    <span>메롱</span>
                </div>

                <div class="que">
                    <span>질문3</span>
                    <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                        <span class="arrow-top" style="font-size:20px" ;>▲</span>
                        <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                    </div>
                </div>
                <div class="anw">
                    <span>까꿍</span>
                </div>

                <div class="que">
                    <span>질문4</span>
                    <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                        <span class="arrow-top" style="font-size:20px" ;>▲</span>
                        <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                    </div>
                </div>
                <div class="anw">
                    <span>까꿍</span>
                </div>

                <div class="que">
                    <span>질문5</span>
                    <div class="arrow-wrap" style="margin-right:20px; color: #006633;">
                        <span class="arrow-top" style="font-size:20px" ;>▲</span>
                        <span class="arrow-bottom" style="font-size:20px" ;>▼</span>
                    </div>
                </div>
                <div class="anw">
                    <span>까꿍</span>
                </div>
            </div>

    </div>
</section>


</body>
       <script>
        $(".que").click(function() {
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
        });
       </script>


<%@ include file="/WEB-INF/views/include/footer.jspf" %>
