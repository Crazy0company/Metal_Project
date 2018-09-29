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
        body {
            background: url("<%=basePath%>game/images/bg_0406.jpg") no-repeat;
            background-size: cover;
        }
        .headerS{
            position: relative;
            width: 100%;
            height:80%;

        }
        .headerS div{
            opacity: 0.7;
            display: block;
            background: #0f0f0f;
            width: 190px;
            height: 200px;
            margin:1%;
            float: left;
            color:#ffffff;
        }
        .headerS div img{
            width:190px;
            height: 200px;

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
        .active{
            top: 5px;
            border:1px solid blue;
        }
        .KUANG{
            border:2px solid gray;
            opacity: 0.8;
        }
    </style>
    <script>
        $(function () {
            $(".headerS div").click(function () {
                $(".headerS div").removeClass("active");
                $(this).addClass("active");
                var  c=$(this).children().attr("name");

            })


        })
    </script>
</head>

<body>
<div class="container KUANG"><!--大框-->
    <div class="headerS"><!--所有头像的框-->
        <div><img name="game/images/character/W.png" src="<%=basePath %>game/images/character/W.png"></div><!--头像1-->
        <div><img name="game/images/character/X.png" src="<%=basePath %>game/images/character/X.png"></div><!--头像2-->
        <div><img name="game/images/character/ZO.png" src="<%=basePath %>game/images/character/ZO.png"></div><!--头像3-->
        <div><img name="game/images/character/ZX.png" src="<%=basePath %>game/images/character/ZX.png"></div><!--头像4-->
        <div><img name="game/images/character/RX.png" src="<%=basePath %>game/images/character/RX.png"></div><!--头像5-->
        <div><img name="game/images/character/J.png" src="<%=basePath %>game/images/character/J.png"></div><!--头像6-->
        <div><img name="game/images/character/FAIZ.png" src="<%=basePath %>game/images/character/FAIZ.png"></div><!--头像7-->
        <div><img name="game/images/character/DECADE.png" src="<%=basePath %>game/images/character/DECADE.png"></div><!--头像8-->
        <div><img name="game/images/character/DRIVE.png" src="<%=basePath %>game/images/character/DRIVE.png"></div><!--头像9-->
        <div><img name="game/images/character/BLADE.png" src="<%=basePath %>game/images/character/BLADE.png"></div><!--头像10-->
        <div><img name="game/images/character/BLACK.png" src="<%=basePath %>game/images/character/BLACK.png"></div><!--头像11-->
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
