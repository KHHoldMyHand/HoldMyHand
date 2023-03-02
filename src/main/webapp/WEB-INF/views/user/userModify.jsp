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

    </style>

    </head>
    <body>
    <!-- index.jsp 생성 후 모든 페이지에 include할 menubar.jsp 생성 -->
    <div>
        <div id="modiInfoArea">
            <form id="modiForm" action="<%= request.getContextPath() %>/user/userModify"
                  method="post"  onsubmit="return validateForm()">
                <br><br><br>
                <h1>회원정보수정</h1>
                <br/>
                <span class="input_area" style="display: none"><input type="text" maxlength="13" name="userNo" value="${login.userNo}" readonly></span>
                아이디 : ${login.userID}<br><br>
                <p>비밀번호(필수입력)</p>
                <span class="input_area"><input type="password" class='pw pw2' placeholder="비밀번호 입력" maxlength="15" name="userPwd" id="password" required></span>
                <font id="usedPw" style="font-size : x-small; "></font>
                <p></p>

                <h5>비밀번호 확인</h5>
                <span class="input_area"><input type="password" class='pw' placeholder="비밀번호 재입력" maxlength="15" id="confirm_password" required></span>
                <font id="checkPw" style="font-size: x-small; "></font>
                <label id="pwdResult"></label>
                <p></p>
                <h5>이메일</h5>
                <span class="input_area"><input type="email" name="userEmail" value="${login.userEmail}"></span>
                <p></p>

                <h5>기업명</h5>
                <span class="input_area"><input type="text" maxlength="5" value="${login.corpName}" readonly></span>
                <p></p>

                <h5>기업종류</h5>
                <span class="input_area"><input type="text" maxlength="5" value="${login.corpType}" readonly></span>
                <p></p>

                <h5>연락처</h5>
                <span class="input_area"><input type="tel" maxlength="11" name="phoneNo"
                                                placeholder="(-없이)01012345678" value="${login.phoneNo}"></span>
                <p></p>
                <br><br>

                <button type="submit" class="cancelBtn">회원정보수정</button>
                <a href="/index"><button type="button" class="cancelBtn">취소</button></a>
                <a href="/user/userDelete" onclick="return confirm('정말로 회원을 탈퇴하시겠습니까? 작성했던 게시물들도 전부 삭제됩니다.')"><button type="button" class="cancelBtn">회원탈퇴</button></a>
            </form>
            <br><br><br>

        </div>
    </div>

    <!-- 주소 API 스크립트 -->
    <!-- jQuery와 Postcodify를 로딩한다 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

    <script>

        $('.pw2').keyup(function (){
            let upw='<%=(String)((CustomerVO)session.getAttribute("login")).getUserPwd()%>';
            let pass1=$("#password").val();
            if(upw==pass1){
                $("#usedPw").html('기존에 쓰던 패스워드입니다.');
                $("#usedPw").attr('color','red');
            }else{
                $("#usedPw").html('');
            }
        })



        $('.pw').keyup(function (){
            let pass1=$("#password").val();
            let pass2=$("#confirm_password").val();
            if(pass1!="" || pass2!=""){
                if(pass1==pass2){
                    $("#checkPw").html('패스워드가 일치합니다.');
                    $("#checkPw").attr('color','green');
                }else{
                    $("#checkPw").html('패스워드가 불일치합니다.');
                    $("#checkPw").attr('color','red');
                }
            }
        })

        function validateForm(){
            let upw='<%=(String)((CustomerVO)session.getAttribute("login")).getUserPwd()%>';
            let pass1=$("#password").val();
            let pass2=$("#confirm_password").val();
            if(pass1!=pass2){
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }
            else if(upw==pass1){
                alert("기존에 사용하던 비밀번호는 사용할 수 없습니다.")
                return false;
            }
            else{
                alert("회원 정보를 성공적으로 수정했습니다.")
            }
        }
    </script>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


