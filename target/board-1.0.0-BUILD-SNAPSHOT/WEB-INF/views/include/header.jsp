<%--
  Created by IntelliJ IDEA.
  User: jujonghun
  Date: 2023/02/20
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>두번째프로젝트</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
          rel="stylesheet"
  />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="resources/css/styles.css" rel="stylesheet" />
  <!-- 조건문으로 세션이 유지되어있으면 마이페이지 / 로그아웃으로 변경 -->
  <div class="head_li">
    <li><a href="<%=request.getContextPath()%>/login">로그인</a></li>
    <li><a href="<%=request.getContextPath()%>/join">회원가입</a></li>
  </div>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-warning">
    <div class="container px-5">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/">신용을자바</a>
      <button
              class="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent"
              aria-expanded="false"
              aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath() %>/creditresult">신용조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/credit">신용평가</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../dummy/contact.html">리스크 솔루션</a>
          </li>

          <li class="nav-item dropdown">
            <a
                    class="nav-link dropdown-toggle"
                    id="navbarDropdownBlog"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
            >고객센터</a
            >
            <ul
                    class="dropdown-menu dropdown-menu-end"
                    aria-labelledby="navbarDropdownBlog"
            >
              <li>
                <a class="dropdown-item" href="../dummy/blog-home.html">공지사항</a>
              </li>
              <li>
                <a class="dropdown-item" href="<%=request.getContextPath()%>/qna">Q&A</a>
              </li>
              <li>
                <a class="dropdown-item" href="<%=request.getContextPath()%>/faq"
                >자주묻는 질문</a
                >
              </li>
            </ul>
          </li>
          <!-- <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              id="navbarDropdownPortfolio"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              >Portfolio</a
            >
            <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdownPortfolio"
            >
              <li>
                <a class="dropdown-item" href="portfolio-overview.html"
                  >Portfolio Overview</a
                >
              </li>
              <li>
                <a class="dropdown-item" href="portfolio-item.html"
                  >Portfolio Item</a
                >
              </li>
            </ul>
          </li> -->
        </ul>
      </div>
    </div>
  </nav>
