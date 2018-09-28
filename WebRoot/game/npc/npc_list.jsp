<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'npc_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>game/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>game/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>game/bootstrap/css/bootstrap.min.css">
  </head>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("a[name='队长']").click(function(){
  			alert("你好，我是你们的队长");
  			alert("我负责发放你们新人的装备，同时你们如果有什么问题也可以来问我，我会尽量解答");
  			if(confirm("如果你需要基础装备，请点击确定！")){
  				$.get("<%=basePath%>pack/tankInPack?id=7",
  				function(data){
  					if(data=='ok'){
  						alert("获得了老旧的战车，战车已送往车库");
  					}
  					else if(data=='max_garage:error'){
  						alert("你的车库已经满了，容纳不下更多的战车了");
  					}
  				});
  			}else{
  				return false;
  			}
  		});
  	});
  </script>
 	<style>
 		ul{list-style: none;}
 	</style>
  <body>
  <div class="container">
      <br>
    <ul id="${sessionScope.play.p_id }" name="npcs">
    	<li>队长 <a style="cursor:pointer; color: blue;" name="队长">对话</a></li>
    </ul>
    </div>
  </body>
</html>
