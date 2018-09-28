<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/9/27
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"
            src="<%=basePath %>game/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath %>game/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath %>game/bootstrap/css/bootstrap.min.css">

    <style>
        .headerS{
            position: relative;
            width: 100%;
            height:80%;

        }
        .headerS div{
            border:1px solid red;
            display: block;
            background: #0f0f0f;
            width: 23%;
            height: 35%;
            margin:1%;
            float: left;
            color:#ffffff;
        }
        .xiaLai{
            position: relative;
            width:100%;
            left: 50px;
        }
        .xiaLai div{
            left: 15px;
            width:20%;
            float: left;
            margin:10px;
            }

    </style>
</head>
<body>
<div class="container"><!--大框-->
<div class="headerS"><!--所有头像的框-->
    <div>头像</div><!--头像1-->
    <div>头像</div><!--头像2-->
    <div>头像</div><!--头像3-->
    <div>头像</div><!--头像4-->
    <div>头像</div><!--头像5-->
    <div>头像</div><!--头像6-->
    <div>头像</div><!--头像7-->
    <div>头像</div><!--头像8-->
</div>
    <div  class="xiaLai">
        <div >
            <input id="p_username" name="p_username" type="text"
                class="form-control input_con" placeholder="昵称">
        </div>
        <div>
            <input id="p_password" name="p_password" type="password"
                class="form-control input_con" placeholder="密码,6-18位" required>
            </div>
        <div>
            <input id="repassword" name="repassword" type="password"
                class="form-control input_con" required placeholder="确认密码">
        </div>
        <div>
            <button  id="submit" name="submit" class="form-control">完成</button>
        </div>
    </div>
</div>
</body>
</html>
