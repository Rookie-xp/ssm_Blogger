<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>版块内容</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
    <style>
        .card-width {
            width: 600px;
        }
        .clear-height {
            min-height: auto;
        }
        .center {
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<!-- Uses a header that scrolls with the text, rather than staying
  locked at the top -->
<div class="mdl-layout mdl-js-layout">
    <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--grey-50">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <a class="mdl-layout-title mdl-navigation__link mdl-color-text--pink-400" href="/exam/main">Blogger</a>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
                <c:choose>
                    <c:when test="${username != null}">
                        <a class="mdl-navigation__link mdl-color-text--pink-400" href="/exam/user/listUserInfo?username=${username}">${username}</a>
                        <c:if test="${username == 'admin'}">
                            <a class="mdl-navigation__link mdl-color-text--black" href="/exam/admin/manageCenter">登入管理后台</a>
                        </c:if>
                        <a class="mdl-navigation__link mdl-color-text--black" href="/exam/addPost?userName=${username}&boardId=${boardId}">
                            发布新主题
                        </a>
                        <a class="mdl-navigation__link mdl-color-text--black" href="/exam/user/loginOut">注销</a>
                    </c:when>
                    <c:when test="${username == null}">
                        <a class="mdl-navigation__link mdl-color-text--pink-400" href="/exam/userLogin">登录 </a>
                        <a class="mdl-navigation__link mdl-color-text--pink-400" href="/exam/userRegister">注册</a>
                    </c:when>
                </c:choose>
            </nav>
        </div>
    </header>
    <main class="mdl-layout__content">
        <div class="page-content">
            <c:forEach items="${board.posts}" var="post" varStatus="status">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--3-col"></div>
                    <div class="mdl-cell mdl-cell--6-col">
                        <div class="card-width clear-height center mdl-card mdl-shadow--2dp">
                            <div class="mdl-card__title">
                                <h4 class="mdl-color-text--pink-400">
                                    <a href="/exam/post/postContent-${post.postId}">${post.postTitle}</a>
                                </h4>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <div class="mdl-grid">
                                    <div class="mdl-cell--2-col" align="left">
                                            ${post.postUserName}
                                    </div>
                                    <div class="mdl-cell--4-offset"></div>
                                    <div class="mdl-cell--4-offset"></div>
                                    <div class="mdl-cell--2-col" align="right">
                                            ${post.postReplyCount}
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${username != null && username == 'admin'}">
                                    <div class="mdl-card__actions mdl-card--border">
                                        <a class="mdl-button mdl-js-button mdl-color-text--pink-400"
                                           href="/exam/admin/deletePost?postId=${post.postId}&postBoardId=${post.postBoardId}">删除</a>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <div class="mdl-cell mdl-cell--3-col"></div>
                </div>
            </c:forEach>
        </div>
    </main>
</div>
</body>
</html>