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
            <div class ="findUserId">
                <form action="<%=request.getContextPath()%>/user/findUserId" method = "post">
                    <div class=find-title>
                        <h3>아이디 찾기</h3>
                    </div>
                    </div>
                        <div>
                            <p>
                                <label>Email</label>
                                <input class="w3-input" type="text" id="userEmail" name="userEmail" required>
                            </p>
                            <p class="w3-center">
                                <button type="submit" id=findBtn class="find-button">아이디찾기</button>
                                <button type="button" onclick="history.go(-1);" class="find-button">취소</button>
                            </p>
                        </div>


                </form>
   </body>

</section>












<%@ include file="/WEB-INF/views/include/footer.jspf" %>
