<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/27 0027
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>INDEX</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript"
            src="<%=basePath%>game/js/jquery-3.3.1.min.js"></script><!--live2D不能少了这个文件，否则点按钮对话框会没反应！-->
    <script type="text/javascript"
            src="<%=basePath%>game/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bluebird@3/js/browser/bluebird.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/whatwg-fetch@2.0.3/fetch.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>game/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript">
        $(function () {
        $('#myFrame').css(<!--初始高度-->
            "height",$(window).height());
        <!--当调整窗口大小时-->
        $(window).resize(function() {
            $('#myFrame').css(
                "height",$(window).height());
        });
    })
    </script>
</head>
<style>
    body {
        background: url("<%=basePath%>game/images/bg_0406.jpg") no-repeat;
        background-size: cover;
    }

</style>
<body>
<center><iframe style="border:0;" name="myFrame" scrolling="no" id="myFrame"  width="800"  src="<%=basePath%>game/index.jsp"  noresize="noresize">
</iframe></center>



<footer> <!-- 加载样式 -->
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>live2d/css/waifu.css" />
    <div class="waifu">
        <!-- 提示框 -->
        <div class="waifu-tips"></div>
        <!-- 看板娘画布 -->
        <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
        <!-- 工具栏 -->
        <div class="waifu-tool">
            <span class="fui-chat">一言</span> <span class="fui-eye">换人</span> <span
                class="fui-user">换装</span> <span class="fui-photo">拍照</span> <span
                class="fui-cross">隐藏</span>
        </div>

    </div>

    <script type="text/javascript">
        var message_Path = 'live2d/';
    </script> <script type="text/javascript" src="<%=basePath%>live2d/js/live2d.js"></script>
    <script src="<%=basePath%>live2d/js/waifu-tips.js"></script> <!-- 初始化看板娘，会自动加载指定目录下的 waifu-tips.json -->
    <script type="text/javascript">initModel('<%=basePath%>live2d/');
    </script> </footer>
</body>
</html>