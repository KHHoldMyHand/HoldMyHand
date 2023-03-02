<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<section class="py-5" id="features">

           <head>
               <meta charset="UTF-8">
               <title>비밀번호찾기화면</title>
               <link href="../resources/css/login.css" rel="stylesheet" type="text/css">
               <script src="http://code.jquery.com/jquery-latest.js"></script>
             <script src="http://code.jquery.com/jquery-latest.js"></script>
             <script>
             	$(function(){
             		$("#findBtn").click(function(){
             			$.ajax({
             				url : "/user/findUserPwd",
             				type : "POST",
             				data : {
             					userID : $("#userID").val(),
             					userEmail : $("#userEmail").val()
             				},
             				success : function(result) {
             					alert(result);
             				},
             			})
             		});
             	})
             </script>
           </head>
           <body>
               <div class="w3-center w3-large w3-margin-top">
               				<h3>비밀번호 찾기</h3>
               			</div>
               			<div>
               				<p>
               					<label>아이디</label>
               					<input class="w3-input" type="text" id="userID" name="userID" placeholder="회원가입한 아이디를 입력하세요" required>
               				</p>
               				<p>
               					<label>이메일</label>
               					<input class="w3-input" type="text" id="userEmail" name="userEmail" placeholder="회원가입한 이메일주소를 입력하세요" required>
               				</p>
               				<p class="w3-center">
               					<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
               					<button type="button" onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인으로</button>
               				</p>
               			</div>
               		</div>
               	</div>
               </body>
               </html>

           </body>

</section>












<%@ include file="/WEB-INF/views/include/footer.jspf" %>
