<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

    <style>
        body {background-color:beige}
            .qnaMain{margin-bottom:200px}

            .qnaList{
                        line-height: 3em;
                        width: 100%;
                        list-style:none;
                        padding:0;
                        text-align: center;

            }

            .qnaList>li:first-child>ul>li {
                background-color: #ffda70;
                font-weight: bold;
                text-align: center;
                font-size: 11pt;
            }

            .qnaList>li>ul>li {
                float: left;
                font-size: 10pt;
                border-bottom: 1.5px solid silver;
                vertical-align: baseline;
                background-color: #fff;
            }

            .qnaList>li>ul>li:first-child {
                width: 10%;
                        list-style:none;

            }

            .qnaList>li>ul>li:first-child+li {
                width: 50%;
                        list-style:none;

            }

            .qnaList>li>ul>li:first-child+li+li {
                width: 12%;
                        list-style:none;

            }

            .qnaList>li>ul>li:first-child+li+li+li {
                width: 12%;
                        list-style:none;

            }

            .qnaList>li>ul>li:first-child+li+li+li+li {
                width: 15%;
                        list-style:none;

            }

        .buttons {
          display: flex;
          justify-content: right;
          align-items: right;
        }

        .btn { margin: 1rem; height: 30px; }


        .left {
                text-align : left;
        }



        </style>
    <body>
        <section class="qnaMain py-5 h-100">
            <div class="text-center" style="margin-bottom: 20px">
                <h1 class="fw-bolder">평가 페이지입니다.</h1>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>유저번호</th>
                    <th>대표자명</th>
                    <th>기업이름</th>
                    <th>파일여부</th>
                    <th>평가버튼</th>
                </tr>

                <c:forEach items="${list}" var="crbGET">
                    <tr>
                        <td>${crbGET.userNo}</td>
                        <td>${crbGET.establishmentName}</td>
                        <td>${crbGET.companyName}</td>
                        <td>${crbGET.files}</td>
                        <td><a href="<%=request.getContextPath()%>/evaluationPage?userNo=${crbGET.userNo}"><button>평가하기</button></a></td>
                    </tr>
                </c:forEach>
                </table>
            </div>
         </div>
    </section>
    </body>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>