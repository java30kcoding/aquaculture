<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String userImg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<!--导航栏开始-->
<div class="container-fluid">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header"
                 style="margin-top: 8px; margin-right: 30px">
                <a href="<%=basePath%>admin.action"><img
                        style="height: 80px; width: 80px;position: absolute;top: -1px" title="点击跳转"
                        src="images/LOGO1.png"></a>
            </div>

            <div class="collapse navbar-collapse"
                 id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" style="padding: 10px">
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <c:if test="${USER_LOGIN.type eq 1}">
                        <li class="dropdown"><a
                                href="<%=basePath%>poolAreaList.action"
                                class="dropdown-toggle">水库管理</a></li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="padding: 6px">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                            data-toggle="dropdown"><img style="height: 20px; width: 20px"
                                                                        src="images/logo-user.png"><strong
                            class="caret"></strong></a>
                        <ul class="dropdown-menu">
                            <li><a href="https://www.baidu.com" target="_Blank"><img
                                    class="icon" src="images/help.png"><span
                                    class="icon-text">帮助</span></a></li>
                            <li class="divider"></li>
                            <li><a href="<%=basePath%>logout.action"><img
                                    class="icon" src="images/out.png"><span
                                    class="icon-text">退出系统</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>