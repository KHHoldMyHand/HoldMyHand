<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


<section class="py-5" id="features">

           <head>
               <meta charset="UTF-8">
               <title>로그인화면</title>
               <link href="../resources/css/login.css" rel="stylesheet" type="text/css">
           </head>
           <body>
           <div class="login">
           <div>
                   <h1><img src="../resources/images/1243928.png" width="150"></h1>

                   <h2>Hold My Hand</h2>
                   <form action="<%=request.getContextPath()%>/user/loginPost" method="post">
                       <div class="login-area">
                           <input type="text" name="userID" id="userID" autocomplete="off" required>
                           <label for="userID">사업자등록번호(ID)</label>
                       </div>
                       <div class="login-area">
                           <input type="password" name="userPwd" id="userPW" autocomplete="off" required>
                           <label for="userPW">비밀번호입력(PW)</label>

                       </div>
                       <div class="auto-login">
                       <label>
                           <input type="checkbox" name="useCookie">자동로그인
                       </label>
                       </div>
                       <div class = "button-area">
                           <button id="btn" type="submit">LOGIN</button>
                       </div>
                   </form>
                   <div style="display:flex; justify-content: center; column-gap: 20px;">
                   <div class = "join-area">
                       <a href="<%=request.getContextPath()%>/user/join">회원가입</a>
                   </div>
                     <div class = "id-area">
                       <a href="<%=request.getContextPath()%>/user/findUserId" method="post">아이디 찾기</a>
                     </div>
                      <div class = "pwd-area">
                        <a href="<%=request.getContextPath()%>/user/findUserPwd" method="post">비밀번호 찾기</a>
                      </div>
                   </div>
           </div>
           </div>
           </body>
           <script type="text/javascript">
                   let id = document.querySelector('#userID')
                   let pw = document.querySelector('#userPW')
                   let btn = document.querySelector('#btn')

                   btn.addEventListener('click', () => {
                       if(id.value == "") {
                           label = id.nextElementSibling
                           label.classList.add('warning')
                           setTimeout(() => {
                               label.classList.remove('warning')
                           }, 1500)
                       } else if(pw.value == "") {
                           label = pw.nextElementSibling
                           label.classList.add('warning')
                           setTimeout(() => {
                               label.classList.remove('warning')
                           }, 1500)
                       }
                   })
           </script>

</section>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>


