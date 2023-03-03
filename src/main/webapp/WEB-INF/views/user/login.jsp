<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<section class="py-5" id="features" style="display: flex; justify-content: center;">
               <title>로그인화면</title>
               <link href="../resources/css/login.css" rel="stylesheet" type="text/css">


           <div class="col-8 login">
           <div>
                   <h1><img src="../resources/images/1243928.png" width="150"></h1>

                   <h2>Hold My Hand</h2>
                   <form action="/user/loginPost" method="post">
                       <div class="login-area">
                           <input class="" type="text" name="userID" id="userID" autocomplete="off" required="">
                           <label for="userID">사업자등록번호(ID)</label>
                       </div>
                       <div class="login-area">
                           <input type="password" name="userPwd" id="userPW" autocomplete="off" required="">
                           <label for="userPW">비밀번호입력(PW)</label>
                       </div>
                       <div class="auto-login p-3 px-7" style="text-align:center;">
                       <label>
                           <input type="checkbox" name="미구현"> 아이디 저장
                           <input type="checkbox" name="useCookie"> 자동 로그인
                       </label>
                       </div>
                       <div class="button-area">
                           <button id="btn" type="submit">LOGIN</button>
                       </div>
                   </form>
                   <div style="display:flex; justify-content: center; column-gap: 20px;">
                   <div class="join-area">
                        <a href="/user/join">회원가입</a>
                   </div>
                   <div class="join-area">
                        <a href="/user/findUserId" method="post">아이디 찾기</a>
                   </div>
                   <div class="join-area">
                        <a href="/user/findUserPwd">비밀번호 찾기</a>
                   </div>
                   </div>
                   </div>
           </div>


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


