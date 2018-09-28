<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>game/css/index.css">
</head>
<body>
<div style="margin:auto; width:100%; height:100%; overflow:hidden; position:absolute; background-color:#000;">
<div style="width:800px; height:100%; background:#FFF; margin:auto;">
<iframe style="border:0;" name="myFrame" scrolling="no" width="574" height="685">
</iframe>
<div id="menu" style="width:800px; height:105px;background:url(<%=basePath%>game/images/UI/bg.png) no-repeat; overflow:hidden; position:absolute;
bottom:0;">
<form id="menu" style="margin-top:60px; margin-left:88px;">
<ul>
<li><a href="<%=basePath%>pack/getTankFromP_Id" target="myFrame" class="btn"><img src="<%=basePath%>game/images/UI/Garage_bt.png" style="width:95px; height:40px;" alt="车库"></a></li>
<li><a href="<%=basePath %>pack/getEquip" target="myFrame" class="btn"><img src="<%=basePath%>game/images/UI/equip_bt.png" style="width:95px; height:40px;" alt="装备库"></a></li>
<li><a href="4.html" target="myFrame" class="btn"><img src="<%=basePath%>game/images/UI/pack_bt.png" style="width:95px; height:40px;" alt="仓库"></a></li>
<li><a href="6.html" target="myFrame" class="btn"><img src="<%=basePath%>game/images/UI/scientific_bt.png" style="width:95px; height:40px;" alt="科研所"></a></li>
<li><a href="<%=basePath%>game/npc/npc_list.jsp" target="myFrame" class="btn"><img src="<%=basePath%>game/images/UI/core_bt.png" style="width:95px; height:40px;" alt="中心"></a></li>
<li><a href="<%=basePath%>pack/getTankFromP_Id" target="myFrame" class="btn"><img src="<%=basePath%>game/images/UI/data_bt.png" style="width:95px; height:40px;" alt="资料库"></a></li>
</ul>
</form>
</div>
</div>
</div>
</body>
</html>
	