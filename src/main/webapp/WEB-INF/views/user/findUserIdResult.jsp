<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<section class="py-5" id="features">

           <head>
               <meta charset="UTF-8">
               <link href="../resources/css/login.css" rel="stylesheet" type="text/css">
               <script src="http://code.jquery.com/jquery-latest.js"></script>
               <script>
               	$(function(){
               		$("#loginBtn").click(function(){
               			location.href='<%=request.getContextPath()%>/user/login';
               		})
               	})
               </script>
               <title>아이디 찾기</title>
           </head>
           <body>
            <div class="w3-content w3-container w3-margin-top">
                <div class="w3-container w3-card-4">
                    <div class="w3-center w3-large w3-margin-top">
                        <h3>아이디 찾기 검색결과</h3>
                    </div>
                    <div>
                        <h5>
                            ${ userid }
                        </h5>
                        <p class="w3-center">
                            <button type="button" id=loginBtn class="">로그인</button>
                            <button type="button" onclick="history.go(-1);" class="">취소</button>
                        </p>
                    </div>
                </div>
            </div>
   </body>
</section>












<%@ include file="/WEB-INF/views/include/footer.jspf" %>
