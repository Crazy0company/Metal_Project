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
            width: 1900px;
            height: 870px;
            background: url("<%=basePath%>game/images/back.jpg") no-repeat;
            background-size: cover;
        }
        .headerS{/*头像的集合div用css*/
            width: 60%;/*一行内能显示的头像越少，width就越少*/

        }
        .headerS div{/*headerS下的div的样式*/
            width: 25%;
            height: 195px;/*必须要加宽和高，不然当你选中一个人物形象时，会因为.active而打乱人物形象排列*/
            margin-top: 5%;
            margin-left: 2%;
            float: left;
        }
        .headerS div img{/*headerS下的div中的img的样式*/
            width:100%;
            height: 100%;
        }
        .xiaLai{
            position: relative;
            left: 60%;
            width:40%;

        }
        .xiaLai  form{/*表单样式*/
            position: absolute;
            right: 39px;
            top:498px;
            width:78%;
            margin:10px;
        }
        .intro{
            position: absolute;
            right: 5%;
            top:248px;
            margin:10px;
            font-size: 30px;
            color: #ffffff;
        }
        .active{/*人物选中时的提示css*/
            top: 5px;
            border:2px solid white;
        }
        .KUANG{/*框*/
            background-color:rgba(0,0,0,0.5);
            height:741px;
            position: relative;
            top: 50px;
        }
        h1{/*创建你的账号*/
            margin-top: 70px;
            opacity: 0.5;
        }
        hr{/*分割线*/
            width: 1.5px;
            left: 56%;
            position:  absolute;
            background-color:black;
            height:700px;
        }
    </style>

    <script>
        $(function () {
            var head_img;
            $(".headerS div").click(function () {
              $(".headerS div").removeClass("active");
              $(this).addClass("active");
              head_img=$(this).children().attr("name");
            });
            $("#submit").click(function(){
              var p_username=$("#p_username").val();
              var p_password=$("#p_password").val();
              var repassword=$("#repassword").val();
              $.get("<%=basePath%>play/Regist?p_head="+head_img+"&p_username="+p_username+"&p_password="+p_password,
              function(data){
              	if(data=="ok"){
              		alert("注册完成！");
              		$("#title").val("创建完成");
              	}
              	else if(data=="error"){
              		$("#title").val("发生了未知的错误，请重试！");
              	}
              });
            });

            /*点击完成按钮事件*/
            $("input[value='完成']").click(function(){
                var status=true;
                var p_username = $("#p_username").val();
                var p_password = $("#p_password").val();
                var repassword = $("#repassword").val();

             /*  var message='${requestScope.message}';*/

                if(p_username==""){
                    $("#p_username").attr("placeholder","昵称不能为空");
                    status=false;
                }
                else if(p_username.length>15){
                    $("#p_username").val("");
                    $("#p_username").attr("placeholder","昵称太长");
                    status=false;
                }
                else if(p_password==""){
                    $("#p_password").attr("placeholder","密码不能为空");
                    status=false;
                }
                else if(p_password.length<6 || p_password.length>18){
                    $("#p_password").val("");
                    $("#p_password").attr("placeholder","密码长度须在6到18位之间");
                    status=false;
                }
                else if(repassword==""){
                    $("#repassword").attr("placeholder","不能为空");
                    status=false;
                }
                else if(repassword!=p_password){
                    $("#repassword").val("");
                    $("#repassword").attr("placeholder","两次输入的密码不一致");
                    status=false;
                }


            });
        });
    </script>
</head>

<body> <center><h1 id="title">创建你的账号</h1></center>
<div class="container KUANG"><!--大框-->

    <div class="headerS"><!--所有头像的框-->
        <div><img name="game/images/character/W.png" src="<%=basePath %>game/images/character/W.png"></div><!--头像1-->
        <div><img name="game/images/character/X.png" src="<%=basePath %>game/images/character/X.png"></div><!--头像2-->
        <div><img name="game/images/character/ZO.png" src="<%=basePath %>game/images/character/ZO.png"></div><!--头像3-->
        <div><img name="game/images/character/ZX.png" src="<%=basePath %>game/images/character/ZX.png"></div><!--头像4-->
        <div><img name="game/images/character/RX.png" src="<%=basePath %>game/images/character/RX.png"></div><!--头像5-->
        <div><img name="game/images/character/BLACK.png" src="<%=basePath %>game/images/character/BLACK.png"></div><!--头像6-->
        <div><img name="game/images/character/FAIZ.png" src="<%=basePath %>game/images/character/FAIZ.png"></div><!--头像7-->
        <div><img name="game/images/character/DECADE.png" src="<%=basePath %>game/images/character/DECADE.png"></div><!--头像8-->
        <div><img name="game/images/character/DRIVE.png" src="<%=basePath %>game/images/character/DRIVE.png"></div><!--头像9-->
            <hr/><!--分割线-->
    </div>
    <div class="intro">选择一个你喜欢的形象，<br>并完成你的基础信息</div>
    <div  class="xiaLai">
    <form role="form" class="col-lg-11 col-md-11 col-sm-11 col-xs-11"
          id="CreateForm">
        <div class="form-group">
             <input name="p_username" id="p_username" type="text" class="form-control input_con"
                placeholder="昵称">
        </div>
        <div class="form-group">
            <input
                name="p_password" id="p_password" type="password" class="form-control input_con"
                placeholder="输入你的密码,6-18位">
        </div>
        <div class="form-group">
            <input id="repassword" name="repassword" type="password"
                   class="form-control input_con" placeholder="确认密码">
        </div>
        <div class="form-group">
            <input type="button" class="form-control" value="完成">
        </div>
    </form>

    </div>
</div>


</body>
</html>