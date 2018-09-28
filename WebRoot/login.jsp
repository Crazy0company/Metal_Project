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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="<%=basePath%>game/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>game/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bluebird@3/js/browser/bluebird.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/whatwg-fetch@2.0.3/fetch.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>game/bootstrap/css/bootstrap.min.css">
</head>
<script type="text/javascript">
  	$(document).ready(function(){
  	var random1=Math.floor(Math.random()*10+1);///1到5的随机数
	var random2=Math.floor(Math.random()*10+1);///1到5的随机数
  	switch(random1){
  	case 1:
  	document.getElementById('xiaoZi').innerHTML = "欢迎登录";
  	break;
  	case 2:
  	document.getElementById('xiaoZi').innerHTML = "欢迎回到这个金属与科技的世界";
  	break;
  	case 3:document.getElementById('xiaoZi').innerHTML = "今天打算狩猎哪些怪物呢？";
  	break;
  	case 4:document.getElementById('xiaoZi').innerHTML = "来研究一些黑科技吧";
  	break;
  	case 5:document.getElementById('xiaoZi').innerHTML = "嘿，你好朋友";
  	break;
  	case 6:
  	document.getElementById('xiaoZi').innerHTML = "有朋自远方来，不亦说乎";
  	break;
  	case 7:
  	document.getElementById('xiaoZi').innerHTML = "要继续冒险吗？";
  	break;
  	case 8:document.getElementById('xiaoZi').innerHTML = "一二三四五六七八九一二三四五六七八九";
  	break;
  	case 9:document.getElementById('xiaoZi').innerHTML = "一二三四五六七八九一二三四五六七八九";
  	break;
  	case 10:document.getElementById('xiaoZi').innerHTML = "一二三四五六七八九一二三四五六七八九";
  	break;
  	}
  	
  	switch(random2){
  	case 1:
  	document.getElementById('xiaoZi2').innerHTML = "欢迎注册";
  	break;
  	case 2:
  	document.getElementById('xiaoZi2').innerHTML = "想来一场冒险吗？";
  	break;
  	case 3:document.getElementById('xiaoZi2').innerHTML = "想成为一名赏金猎人？";
  	break;
  	case 4:document.getElementById('xiaoZi2').innerHTML = "想成为一名科学家？";
  	break;
  	case 5:document.getElementById('xiaoZi2').innerHTML = "嘿，你好陌生人";
  	break;
  	case 6:
  	document.getElementById('xiaoZi2').innerHTML = "快来一起冒险哇";
  	break;
  	case 7:
  	document.getElementById('xiaoZi2').innerHTML = "一二三四五六七八九一二三四五六七八九";
  	break;
  	case 8:document.getElementById('xiaoZi2').innerHTML = "欢迎注册8";
  	break;
  	case 9:document.getElementById('xiaoZi2').innerHTML = "欢迎注册9";
  	break;
  	case 10:document.getElementById('xiaoZi2').innerHTML = "欢迎注册10";
  	break;
  	}

$("input[value='登录']").click(function(){
	$.post("<%=basePath%>play/login",
	$("#loginForm").serialize(),
	function(data){
		if(data=='ok'){
			window.location.replace("<%=basePath%>index.jsp");
		}
		else if(data=='error'){
			alert("登录失败：请检查邮箱与密码是否一致!");
		}
	});
});
 $("input[value='注册']").click(function(){
		var status=true;
		var p_email = $("#p_email").val();
		var message="${requestScope.message}";
		reg=/\w+@\w+.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?/;
		if(p_email==""){
            $("#p_email").attr("placeholder","邮箱不能为空");
            status=false;
		}
		else if(!reg.exec(p_email)){
            $("#p_email").val("");
            $("#p_email").attr("placeholder","邮箱格式不正确");
            status=false;
		}
		if(status){
			$("#p_email").blur();
	    	$.get("<%=basePath%>play/regist?p_email="+p_email,
	    	function(data){
	    		if(data=="OK"){
	    			$("#p_email").val("");
            		$("#p_email").attr("placeholder","邮箱验证成功，等待跳转...");
            		setTimeout("location.href='<%=basePath%>game/play/create.jsp';", 3000);  
	    		}
	    		else if(data=="ERROR:repeat"){
	    			$("#p_email").val("");
            		$("#p_email").attr("placeholder","邮箱重复");
	    		}
	    	});
		}

 		});
  	});
</script>

<style>

.Top50px{
top:50px;

}
.hint{
	color:white;
	position:absolute;
	left:32px;
	top:42px;
	font-size:19px;
	font-weight:bold;
	opacity:0.5;
	}
.RL{
	color:white;
	position:absolute;
	right:43px;
	top:43px;
	font-size:13px;
	font-weight:bold;
	opacity:0.5;
	text-decoration:underline;
}
	.xiaoZi{
	color:white;
	position:absolute;
	left:45px;
	top:74px;
	font-size:10px;
	font-weight:bold;
	opacity:0.5;
	}
i {
	color: #FFF;
}

input {
	border-radius: 5px;
}

#loginplan {
	height: 550px;
	background-image: url("<%=basePath%>game/images/div.jpg");
	background-size: 100% 100%;
	position: absolute;
	top: 30%;
	left: 30%;
	box-shadow: #000000 5px 5px 10px, #000000 -5px 0px 10px;
	padding-top: 30px;
}

body {
	background-image: url("<%=basePath%>game/images/back.jpg");
	background-size: cover;
}
</style>
<body>
	<div class="col-lg-3 col-md-4 col-sm-5 col-xs-6" id="loginplan">
		<!--登录底板开始-->
		<p>
		<div class="tab-content">
			<div id="login" class="tab-pane active login-form">
				<!--登录开始-->
				<ul class="nav nav-pill login-table">
				<span class="hint">LOGIN</span>
				<hr style="width:50%;position:absolute;left:29px;top:52px;opacity:0.5;"/>
				<p id ="xiaoZi"class="xiaoZi"></p>
					<a href="#regist" role="tabs" data-toggle="pill"
						style="text-decoration:none; float:right; margin-right:50px;">
						<div class="RL">&gt;&nbsp;&gt;&nbsp;注册</div>
					</a>
				</ul>
				<p>
				<form role="form" class="col-lg-11 col-md-11 col-sm-11 col-xs-11 Top50px"
					id="loginForm">
					<div class="form-group">
						<label for="p_username" class="lable-title-login">邮箱</label> <input
							name="p_email" type="text" class="form-control input_con"
							placeholder="输入你的电子邮箱" required>
					</div>
					<div class="form-group">
						<label for="name" class="lable-title-login">密码</label> <input
							name="p_password" type="password" class="form-control input_con"
							placeholder="输入你的密码" required>
					</div>
					<div class="form-group">
						<label for="name" class="lable-title"></label> <input
							type="button" class="form-control" value="登录">
					</div>
				</form>
			</div>
			<!-- 登录结束 -->

			<div id="regist" class="tab-pane regist-form">
				<!--注册开始-->
				<ul class="nav nav-pill login-table">
				<span class="hint">REGISTER</span>
				<hr style="width:50%;position:absolute;left:29px;top:52px;opacity:0.5;"/>
				<p id ="xiaoZi2" class="xiaoZi"></p>
					<a href="#login" role="tabs" data-toggle="pill"
						style="text-decoration:none; float:right; margin-right:50px;"><div class="RL">&lt;&nbsp;&lt;&nbsp;登录</div>
					</a>
				</ul>
				<p>
				<form role="form" class="col-lg-11 col-md-11 col-sm-11 col-xs-11 Top50px"
					id="registForm">
					<div class="form-group">
						<label for="name" class="lable-title-regist">电子邮箱</label>
						<input id="p_email" name="p_email" type="text" class="form-control input_con" placeholder="请输入你的电子邮箱">
					</div>
					<div class="form-group">
						<label for="name" class="lable-title-regist"></label> <input
							type="button" class="form-control" value="注册" name="regist">
					</div>
				</form>
			</div>
</body>
</html>
