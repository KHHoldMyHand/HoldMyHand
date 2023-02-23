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

        #modiForm {
            width : 400px;
            margin: auto;
            padding: 10px;
        }

        #modiForm h1 {
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
        <div id="modiInfoArea">
            <form id="modiForm" action="<%= request.getContextPath() %>/mypage/userModify"
                  method="post">
                <h1>회원정보수정</h1>

                <h5>아이디</h5>
                <span class="input_area"><input type="text" maxlength="13"  value="${customerVO.userID}" readonly></span>
                <p></p>
                <h5>비밀번호</h5>
                <span class="input_area"><input type="password" maxlength="15" name="userPwd" required></span>
                <p></p>

<%--                <h5>비밀번호 확인</h5>--%>
<%--                <span class="input_area"><input type="password" maxlength="15" name="userPwd2" required></span>--%>
<%--                <label id="pwdResult"></label>--%>
<%--                <p></p>--%>
                <h5>이메일</h5>
                <span class="input_area"><input type="email" name="userEmail" value="${customerVO.userEmail}"></span>
                <p></p>

                <h5>기업명</h5>
                <span class="input_area"><input type="text" maxlength="5" value="${customerVO.corpName}" readonly></span>
                <p></p>

                <h5>기업종류</h5>
                <span class="input_area"><input type="text" maxlength="5" value="${customerVO.corpType}" readonly></span>
                <p></p>

                <h5>연락처</h5>
                <span class="input_area"><input type="tel" maxlength="11" name="phoneNo"
                                                placeholder="(-없이)01012345678" value="${customerVO.phoneNo}"></span>
                <p></p>


                <button type="submit" class="btnArea">회원정보수정</button>
            </form>
            <div class="btnArea">
                <a href="/index"><button type="submit" class="cancelBtn">취소</button></a>
            </div>
        </div>
    </div>

    <!-- 주소 API 스크립트 -->
    <!-- jQuery와 Postcodify를 로딩한다 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<%--    <script>--%>
<%--        function validate(){--%>
<%--            return true;--%>
<%--        }--%>
<%--    </script>--%>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


