<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<link rel="../resources/css/exam.css">
<section class="qnaMain py-5">
    <article class="contain">
        <div class="text-center">
            <h1 class="text-center">QNA</h1>
            <p class="fw-bolder">게시글 작성</p>
        </div>
        <form action="<%=request.getContextPath()%>/qnaWrite" method="post">
            <input type="text" name="userNo" value="${login.userNo}" style="display:none">
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="write_wrp">
                        <ul>
                            <li class="row">
                                <span class="tit17B col-2">작성자</span>
                                <span class="write_input col-10"><input class="boardContent tit15B" type="text" name="writer" value="${login.corpManager}" readonly></span>
                            </li>
                            <li class="row">
                                <span class="tit17B col-2">제목</span>
                                <span class="write_input col-10"><input class="boardContent tit15B" type="text" name="title" placeholder="제목을 입력하세요."></span>
                            </li>
                            <li class="row">
                                <span class="tit17B col-2">문의 내용</span>
                                <span class="write_txtArea col-10"><textarea class="tit15B" placeholder="내용 입력을 입력하세요." name="content"></textarea></span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="bt_wrap">
                    <button class="submit_btn" type="submit">등록</button>
                    <button class="cancel_btn" onclick="location.href='qna'" type="reset" id="no">취소</button>
                </div>
            </div>
        </form>
    </article>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>
