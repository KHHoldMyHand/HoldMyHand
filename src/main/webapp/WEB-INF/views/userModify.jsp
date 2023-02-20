<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


<section>
    <style>
        .outer{
            width:60%;
            min-width : 650px;
            background: rgb(250, 250, 250);
            box-shadow: rgba(0, 0, 0, 0) 0px 0px 4px 0px;
            margin:auto;
            margin-top : 70px;
            margin-bottom : 70px;
        }

        #joinForm {
            width : 400px;
            margin: auto;
            padding: 10px;
        }

        #joinForm h1 {
            text-align:center;
        }


        .input_area {
            border: solid 1px #dadada;
            padding : 6px 3px 10px 3px;
            background : white;
        }


        .input_area input:not([type=checkbox]) {
            width : 250px;
            height : 25px;
            border: 0px;
        }

        .btnArea {
            text-align:center;
            padding : 50px;
        }

        button {
            width : 100px;
            height : 35px;
            border : 0px;
            color:white;
            background:#282A35;
            margin : 5px;
        }
        p{
            line-height: 5px;
        }

    </style>

    </head>
    <body>
    <!-- index.jsp 생성 후 모든 페이지에 include할 menubar.jsp 생성 -->

    <div class="outer">
        <div id="joinInfoArea">
            <form id="joinForm" action="<%= request.getContextPath() %>/login"
                  method="post" onsubmit="return validate();">
                <h1>회원정보수정</h1>

                <h5>아이디</h5>
                <span class="input_area"><input type="text" maxlength="13" name="userId" readonly></span>
                <p></p>
                <h5>비밀번호</h5>
                <span class="input_area"><input type="password" maxlength="15" name="userPwd" required></span>
                <p></p>

                <h5>비밀번호 확인</h5>
                <span class="input_area"><input type="password" maxlength="15" name="userPwd2" required></span>
                <label id="pwdResult"></label>
                <p></p>

                <h5>이름</h5>
                <span class="input_area"><input type="text" maxlength="5" name="userName" required></span>
                <p></p>

                <h5>연락처</h5>
                <span class="input_area"><input type="tel" maxlength="11" name="phone"
                                                placeholder="(-없이)01012345678"></span>
                <p></p>

                <h5>이메일</h5>
                <span class="input_area"><input type="email" name="email"></span><button>인증번호 전송</button>
                <p></p>

                <h5>이메일 인증번호</h5>
                <span class="input_area"><input type="email" name="email"></span>
                <p></p>

                <div class="btnArea">
                    <button id="modifyBtn">회원정보수정</button>
                    <button id="delBtn">회원탈퇴</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 주소 API 스크립트 -->
    <!-- jQuery와 Postcodify를 로딩한다 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

    <script>
        function validate(){
            return true;
        }
    </script>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


