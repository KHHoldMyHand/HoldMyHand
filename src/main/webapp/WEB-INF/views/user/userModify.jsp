<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<%--    <style>
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
            border-radius: 8px;
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

    </style>--%>

<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <title>회원정보수정</title>
            <link href="../resources/css/join.css" rel="stylesheet" type="text/css">
            <body>

            <div class="outer">
                <div id="joinInfoArea">
                <form id="joinForm" action="<%= request.getContextPath() %>/user/userModify"
                      method="post" onsubmit="return validateForm()">
                    <h1 class="tit30B">회원정보수정</h1>
                    <!-- userNo -->
                    <input type="text" maxlength="13" value="${login.userNo}" style="display: none">

                    <div class="gold_line" style="padding-top: 10px;">
                        <h4 class="tit17">* 아이디</h4>
                        <span class="in_area"><input class="insert_input"  name="userNo" value="${login.userID}" readonly>

                        </span>
                    </div>

                    <div class="gold_line">
                        <h4 class="tit17">* 비밀번호(필수입력)</h4>
                        <span class="in_area"><input class="insert_input" type="password" class='pw pw2' placeholder="비밀번호 입력" maxlength="15"
                                                        name="userPwd" id="password" required></span>
                        <font id="usedPw" style="font-size : x-small; "></font>
                    </div>

                    <div class="gold_line">
                        <h4 class="tit17">* 비밀번호 확인</h4>
                        <span class="in_area"><input class="insert_input" type="password" class='pw' placeholder="비밀번호 재입력" maxlength="15"
                                                        id="confirm_password" required></span>
                        <font id="checkPw" style="font-size: x-small; "></font>
                        <label id="pwdResult"></label>
                    </div>

                    <div class="gold_line">
                        <h4 class="tit17">* 이메일</h4>
                        <span class="in_area"><input class="insert_input" type="email" name="userEmail" value="${login.userEmail}"></span>
                        <p></p>
                    </div>

                    <div class="gold_line">
                        <h4 class="tit17">* 기업명</h4>
                        <span class="in_area"><input class="insert_input" type="text" maxlength="5" value="${login.corpName}" readonly></span>
                    </div>

                    <div class="gold_line">
                        <h4 class="tit17">* 기업종류</h4>
                        <span class="in_area"><input class="insert_input" type="text" maxlength="5" value="${login.corpType}" readonly></span>
                    </div>

                    <div class="gold_line">
                        <h4 class="tit17">* 연락처</h4>
                        <span class="in_area"><input class="insert_input" type="tel" maxlength="11" name="phoneNo"
                                                    placeholder="(-없이)01012345678" value="${login.phoneNo}"></span>
                    </div>


                    <div class="gold_line" style="text-align: center; padding-top: 25px; margin-bottom: 0px">
                    <button type="submit" style="padding: 0;">수정</button>
                    </div>

                    <div style="text-align: center; padding-top: 30px; margin-bottom: 20px">
                        <button type="button" href="/index" style="padding: 0; ">취소</button>
                        <button type="button" style="padding: 0;" href="/user/userDelete" onclick="return confirm('정말로 회원을 탈퇴하시겠습니까? 작성했던 게시물들도 전부 삭제됩니다.')">회원탈퇴</button>
                    </a>
                    </div>
                </form>
                </div>
            </div>
            </body>
        </div>
    </div>
</section>

<!-- 주소 API 스크립트 -->
<!-- jQuery와 Postcodify를 로딩한다 -->

<style>
    * {
        font-family: 'Pretendard', sans-serif;
        font-size: 16px;
        font-weight: 600;
        color: #111;
    }

    .gold_btn {
        width: 100px;
        height: 40px;
        color: #333;
        background: gold;
        margin: 10px;
        border-radius: 10px;
        display: inline-block;
        text-align: center;
        line-height: 40px;
    }

    .outer {
        padding: 20px !important;
    }

    .tit30B {
        font-size: 30px;
        font-weight: 700;
        margin-bottom: 25px;
    }

    .tit17 {
        font-size: 17px;
        font-weight: 600;
        margin-top: 20px;
        margin-left: 10px;
    }

    .gold_line {
        border-top: 5px solid gold;
        margin: 0 50px;
        margin-bottom: 25px;
    }

    .hometax_link img {
        max-width: 100%;
        width: 114px;
        height: 57px;
    }

    .insert_input {
        background: #fff;
        border-radius: 10px;
        outline: none;
        border: 2px solid #ddd;
        padding: 7px 10px;
        font-size: 15px;
        font-weight: 500;
        color: #444;
    }

    .in_area {
        display: inline-block;
    }

    .insert_input::placeholder {
        color: #888;
    }

    #joinForm {
        width: 500px !important;
    }

    .hidden {
        position: absolute;
        top: 0;
        left: 0;
        z-index: -1;
        visibility: hidden;
        opacity: 0;
    }
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script>

    $('.pw2').keyup(function () {
        let upw = '<%=(String)((CustomerVO)session.getAttribute("login")).getUserPwd()%>';
        let pass1 = $("#password").val();
        if (upw == pass1) {
            $("#usedPw").html('기존에 쓰던 패스워드입니다.');
            $("#usedPw").attr('color', 'red');
        } else {
            $("#usedPw").html('');
        }
    })

    $('.pw').keyup(function () {
        let pass1 = $("#password").val();
        let pass2 = $("#confirm_password").val();
        if (pass1 != "" || pass2 != "") {
            if (pass1 == pass2) {
                $("#checkPw").html('패스워드가 일치합니다.');
                $("#checkPw").attr('color', 'green');
            } else {
                $("#checkPw").html('패스워드가 불일치합니다.');
                $("#checkPw").attr('color', 'red');
            }
        }
    })

    function validateForm() {
        let upw = '<%=(String)((CustomerVO)session.getAttribute("login")).getUserPwd()%>';
        let pass1 = $("#password").val();
        let pass2 = $("#confirm_password").val();
        if (pass1 != pass2) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        } else if (upw == pass1) {
            alert("기존에 사용하던 비밀번호는 사용할 수 없습니다.")
            return false;
        } else {
            alert("회원 정보를 성공적으로 수정했습니다.")
        }
    }
</script>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


