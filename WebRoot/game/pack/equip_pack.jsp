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
<title>装备库</title>
<script src="<%=basePath %>game/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath %>game/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>game/bootstrap/css/bootstrap.min.css">
</head>

<body>
	<div class="container-fluid">
		<div>
			<ul class="nav nav-pills login-table">
				<li class="active"><a href="#M_Gun" role="tabs" data-toggle="pill">主炮</a></li>
				<li><a href="#A_Gun" role="tabs" data-toggle="pill">副炮</a></li>
                <li><a href="#S_Gun" role="tabs" data-toggle="pill">S-E</a></li>
                <li><a href="#Engine" role="tabs" data-toggle="pill">引擎</a></li>
                <li><a href="#Core" role="tabs" data-toggle="pill">C核心</a></li>
                <li><a href="#Armor" role="tabs" data-toggle="pill">装甲</a></li>
			</ul>
		</div>
        <div class="container tab-content">
        	<div id="M_Gun" class="active row tab-pane">
        		<ul>
            		<c:forEach items="${requestScope.M_Guns}" var="mguns">
            			<li style="color:${mguns.weapon_name.rarity.rarity_color }">${mguns.weapon_name.name }</li>
            		</c:forEach>
            	</ul>
            </div>
            <div id="A_Gun" class="row tab-pane">
            	<ul>
            		<c:forEach items="${requestScope.A_Guns}" var="aguns">
            			<li style="color:${aguns.weapon_name.rarity.rarity_color }">${aguns.weapon_name.name }</li>
            		</c:forEach>
            	</ul>
            </div>
            <div id="S_Gun" class="row tab-pane">
            	<ul>
            		<c:forEach items="${requestScope.S_Guns}" var="sguns">
            			<li style="color:${sguns.weapon_name.rarity.rarity_color }"i>${sguns.weapon_name.name }</li>
            		</c:forEach>
            	</ul>
            </div>
            <div id="Engine" class="row tab-pane">
            	 <ul>
            		<c:forEach items="${requestScope.Engines}" var="ens">
            			<li style="color:${ens.engine_name.rarity.rarity_color }">${ens.engine_name.name }</li>
            		</c:forEach>
            	</ul>
            </div>
            <div id="Core" class="row tab-pane">
            	<ul>
            		<c:forEach items="${requestScope.Cores}" var="cores">
            			<li style="color:${cores.core_name.rarity.rarity_color }">${cores.core_name.name }</li>
            		</c:forEach>
            	</ul>
            </div>
            <div id="Armor" class="row tab-pane">
            	<ul>
            		<c:forEach items="${requestScope.Armors}" var="armors">
            			<li style="color:${armors.armor_name.rarity.rarity_color }">${armors.armor_name.name }</li>
            		</c:forEach>
            	</ul>
            </div>
        </div>
	</div>
</body>
</html>
