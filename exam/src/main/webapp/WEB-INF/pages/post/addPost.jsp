<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加新主题</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
    <style>
        .center {
            margin-left: auto;
            margin-right: auto;
        }
        .card-width {
            min-width: 500px;
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
            <a class="mdl-layout-title mdl-navigation__link mdl-color-text--pink-400"
               href="/index/board/listPosts-<%=request.getParameter("boardId")%>">Blogger</a>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
                <c:choose>
                    <c:when test="${username != null}">
                        <a class="mdl-navigation__link mdl-color-text--pink-400" href="/exam/user/listUserInfo?username=${username}">${username}</a>
                        <a class="mdl-navigation__link mdl-color-text--black" href="/exam/user/loginOut">注销</a>
                    </c:when>
                    <c:when test="${username == null}">
                        <a class="mdl-navigation__link mdl-color-text--pink-400" href="/exam/userLogin">登录</a>
                        <a class="mdl-navigation__link mdl-color-text--pink-400" href="/exam/userRegister">注册</a>
                    </c:when>
                </c:choose>
            </nav>
        </div>
    </header>
    <main class="mdl-layout__content">
        <div class="page-content">
            <!-- Your content goes here -->
            <div class="mdl-grid">
                <div class="mdl-cell--4-col"></div>
                <div class="mdl-cell--4-col">
                    <div class="mdl-card mdl-shadow--2dp center card-width">
                        <div class="mdl-card__title">
                            <h4 class="mdl-color-text--pink-400">添加新主题</h4>
                        </div>
                        <div class="mdl-card__subtitle-text">
                            <form name="form" action="/exam/post/addPost" method="post">
                                <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable center card-width">
                                    <tr>
                                        <td>板块ID:</td>
                                        <td>
                                            <div class="mdl-textfield mdl-js-textfield">
                                                <input class="mdl-textfield__input" name="postBoardId" id="postBoardId"
                                                       readonly value="<%=request.getParameter("boardId")%>"/>
                                                <label class="mdl-textfield__label" for="postBoardId"></label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>用户名:</td>
                                        <td>
                                            <div class="mdl-textfield mdl-js-textfield">
                                                <input class="mdl-textfield__input" name="postUserName" id="postUserName"
                                                       readonly value="<%=request.getParameter("userName")%>"/>
                                                <label class="mdl-textfield__label" for="postUserName"></label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>文章名称:</td>
                                        <td>
                                            <div class="mdl-textfield mdl-js-textfield">
                                                <input class="mdl-textfield__input" type="text" name="postTitle"
                                                       id="postTitle">
                                                <label class="mdl-textfield__label" for="postTitle"></label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>文章内容:</td>
                                        <td>
                                            <div class="mdl-textfield mdl-js-textfield">
                                                <textarea class="mdl-textfield__input" type="text" name="postContent" rows="5" maxrows="5"
                                                          id="postContent"></textarea>
                                                <label class="mdl-textfield__label" for="postContent"></label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input class="mdl-button mdl-js-button mdl-button--raised mdl-color--pink-400 mdl-color-text--white" type="submit"
                                                   value="提交" name="submit" align="center"/>
                                        </td>
                                        <td>
                                            <a href="/exam/board/listPosts-${boardId}" class="mdl-button mdl-js-button mdl-button--raised">返回</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="mdl-cell--4-col"></div>
            </div>
        </div>
    </main>
</div>
</body>
</html>