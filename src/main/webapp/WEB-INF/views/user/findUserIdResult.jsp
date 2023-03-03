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

                  <style type="text/css">
                          .mybtn{
                            width:150px;
                            height:40px;
                            padding:0;
                            display:inline;
                            border-radius: 25px;
                            background: #FFD700;
                            color: black;
                            margin-top: 25px;
                            border: solid 2px white;
                            transition: all 0.5s ease-in-out 0s;
                          }
                          .mybtn:hover .mybtn:focus {
                            background: white;
                            color: #212529;
                            text-decoration: none;
                          }
                          .mybtn:active{
                              position: relative;
                              top:2px;
                          }
                          .input-area{
                               width:300px;
                               height:40px;
                               border-radius: 10px;
                               border: solid 1.5px gray;

                          }
                         .board{
                           border: solid 2px white;
                           border-radius: 25px;
                           background: rgba(255, 247, 137, 0.132);
                           margin-top: 100px;
                           margin-bottom: 100px;
                           height:600px;
                           width:800px;
                          }
                          .result{
                             border: solid 2px black;
                               border-radius: 25px;
                               background: rgba(255, 247, 137, 0.132);
                               width:500px;
                               height:300px;
                          }
                          </style>
           </head>
           <body>
            <div class="w3-content w3-container w3-margin-top" style="display: flex; justify-content: center; margin-bottom:100px;" >
                            <div class="w3-container w3-card-4 w3-auto board">
                                <div class="w3-center w3-large w3-margin-top " style="display: flex; justify-content: center; margin-top:100px; margin-bottom:100px;" >
                        <h3>아이디 찾기 검색결과</h3>
                    </div>
                    <div style="display: flex; justify-content: center; margin-top:50px; margin-bottom:100px;">
                        <div class = "result" >
                        <h5 style="display: flex; justify-content: center; margin-top:50px;">ID : ${ userid }</h5>
                        <div style="display: flex; justify-content: center;">
                            <button type="button" id="loginBtn" class="mybtn">로그인</button>
                            <button type="button" onclick="history.go(-1);" class="mybtn">취소</button>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
   </body>
</section>












<%@ include file="/WEB-INF/views/include/footer.jspf" %>
