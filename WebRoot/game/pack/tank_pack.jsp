<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>game/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>game/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>game/bootstrap/css/bootstrap.min.css">
  </head>
  <style>
  	li{
  		list-style: none;
  	}
  	a:hover{
  		font-weight: bolder;
  		text-decoration: none;
  		cursor: pointer;
  	}
  </style>
  <script type="text/javascript">
  	$(document).ready(function(){
  		var tank_id=$("td[id='tank_id']").attr("title");
  		$("a[id='chassis_skill']").click(function(){
  		//底盘特性
  			var chassis_name=">>"+'${requestScope.tank.chassis_skill.skill_name_ch}'+"\n>>底盘特性";	//获取底盘名称
  			//获取一号特性信息
  			var skill_1='';
  			var skill_1_m='';
  			if('${requestScope.tank.chassis_skill.type_1}'!='null'){
  		  		skill_1="\n<"+'${requestScope.tank.chassis_skill.skill_1}'+">:";
  		  		skill_1_m='${requestScope.tank.chassis_skill.skill_1_m}';
  		  	}
  		  	//获取二号特性信息
  		  	var skill_2='';
  		  	var skill_2_m='';
  		  	if('${requestScope.tank.chassis_skill.type_2}'!='null'){
  		  		var skill_2="\n<"+'${requestScope.tank.chassis_skill.skill_2}'+">:";
  		  		var skill_2_m='${requestScope.tank.chassis_skill.skill_2_m}';
  		  	}
  		  	//获取三号特性的信息
  		  	var skill_3='';
  		  	var skill_3_m='';
  		  	if('${requestScope.tank.chassis_skill.type_3}'!='null'){
  		  		var skill_3="\n<"+'${requestScope.tank.chassis_skill.skill_3}'+">:";
  		  		var skill_3_m='${requestScope.tank.chassis_skill.skill_3_m}';
  		  	}
			alert(chassis_name+skill_1+skill_1_m+skill_2+skill_2_m+skill_3+skill_3_m);
  		});
  		//底盘特性结束
  		
  		$("a[id='core_1']").click(function(){
  			var c_name_1='${requestScope.tank.core_1.core_name.name}';
  			var c_rarity_1='${requestScope.tank.core_1.core_name.rarity.rarity_ch}';
  			var c_reload_time_1='${requestScope.tank.core_1.c_reload_time}';
  			var c_hit_1='${requestScope.tank.core_1.c_hit}';
  			var c_miss_1='${requestScope.tank.core_1.c_miss}';
  			var c_crt_1='${requestScope.tank.core_1.c_crt}';
  			var c_x_crt_1='${requestScope.tank.core_1.c_x_crt}';
  			var c_load_1='${requestScope.tank.core_1.c_load}';
  			var c_intercept_1='${requestScope.tank.core_1.core_name.c_intercept}';
  			var c_weight_1='${requestScope.tank.core_1.weight}';
  			var c_message_1='${requestScope.tank.core_1.core_name.message}';
  			
  			var message="\n>>>C核心："+c_name_1;
  			if(c_name_1=="open"){
  				message="这里可以装备一个C核心";
  				alert(message);
  			}
  			else if(c_name_1=="close"){
  				message="这里的C核心装备栏是关闭的，请咨询<C核心专家>";
  				alert(message);
  			}
  			else{
	  			c_rarity_1="\n<<科技等级："+c_rarity_1+">>";
	  			c_reload_time_1="\n>>武器装填时间："+c_reload_time_1+"%";
	  			c_hit_1="\n>>武器命中："+c_hit_1+"%";
	  			c_miss_1="\n>>闪避率："+c_miss_1+"%";
	  			c_crt_1="\n>>武器暴击率："+c_crt_1+"%";
	  			c_x_crt_1="\n>>武器超暴击率："+c_x_crt_1+"%";
	  			c_load_1="\n>>引擎载重："+c_load_1+"%";
	  			c_intercept_1="\n>>迎击性能："+c_intercept_1;
	  			c_weight_1="\n>>重量："+c_weight_1+"dt";
	  			
	  			message=message+c_rarity_1+c_reload_time_1+c_hit_1+c_miss_1+c_crt_1+c_x_crt_1+c_load_1+c_intercept_1+c_weight_1;
	  			
	  			alert(message);
  			}
  		});
  		$("a[id='core_2']").click(function(){
  			var c_name_2='${requestScope.tank.core_2.core_name.name}';
  			var c_rarity_2='${requestScope.tank.core_2.core_name.rarity.rarity_ch}';
  			var c_reload_time_2='${requestScope.tank.core_2.c_reload_time}';
  			var c_hit_2='${requestScope.tank.core_2.c_hit}';
  			var c_miss_2='${requestScope.tank.core_2.c_miss}';
  			var c_crt_2='${requestScope.tank.core_2.c_crt}';
  			var c_x_crt_2='${requestScope.tank.core_2.c_x_crt}';
  			var c_load_2='${requestScope.tank.core_2.c_load}';
  			var c_intercept_2='${requestScope.tank.core_2.core_name.c_intercept}';
  			var c_weight_2='${requestScope.tank.core_2.weight}';
  			var c_message_2='${requestScope.tank.core_2.core_name.message}';
  			
  			var message="\n>>>C核心："+c_name_2;
  			if(c_name_2=="open"){
  				message="这里可以装备一个C核心";
  				alert(message);
  			}
  			else if(c_name_2=="close"){
  				message="这里的C核心装备栏是关闭的，请咨询<C核心专家>";
  				alert(message);
  			}
  			else{
	  			c_rarity_2="\n<<科技等级："+c_rarity_2+">>";
	  			c_reload_time_2="\n>>武器装填时间："+c_reload_time_2+"%";
	  			c_hit_2="\n>>武器命中："+c_hit_2+"%";
	  			c_miss_2="\n>>闪避率："+c_miss_2+"%";
	  			c_crt_2="\n>>武器暴击率："+c_crt_2+"%";
	  			c_x_crt_2="\n>>武器超暴击率："+c_x_crt_2+"%";
	  			c_load_2="\n>>引擎载重："+c_load_2+"%";
	  			c_intercept_2="\n>>迎击性能："+c_intercept_2;
	  			c_weight_2="\n>>重量："+c_weight_2+"dt";
	  			
	  			message=message+c_rarity_2+c_reload_time_2+c_hit_2+c_miss_2+c_crt_2+c_x_crt_2+c_load_2+c_intercept_2+c_weight_2;
	  			
	  			alert(message);
  			}
  		});
  		$("a[id='engine_1']").click(function(){
  			var e_name_1='${requestScope.tank.engine_1.engine_name.name}';
  			var e_rarity_1='${requestScope.tank.engine_1.engine_name.rarity.rarity_ch}';
  			var e_load_1='${requestScope.tank.engine_1.e_load}';
  			var e_weight_1='${requestScope.tank.engine_1.weight}';
  			var e_message_1='${requestScope.tank.engine_1.engine_name.message}';
  			
  			var message="\n>>>引擎："+e_name_1;
  			if(e_name_1=="open"){
  				message="这里可以装备一个引擎";
  				alert(message);
  			}
  			else if(e_name_1=="close"){
  				message="这里的引擎装备栏是关闭的，请咨询<引擎改造专家>";
  				alert(message);
  			}
  			else{
	  			e_rarity_1="\n<<科技等级："+e_rarity_1+">>";
	  			e_load_1="\n>>引擎基础载重："+e_load_1+"dt";
	  			e_weight_1="\n>>重量："+e_weight_1+"dt";	
	  			message=message+e_rarity_1+e_load_1+e_weight_1;
	  			alert(message);
  			}
  		});
  		$("a[id='engine_2']").click(function(){
  			var e_name_2='${requestScope.tank.engine_2.engine_name.name}';
  			var e_rarity_2='${requestScope.tank.engine_2.engine_name.rarity.rarity_ch}';
  			var e_load_2='${requestScope.tank.engine_2.e_load}';
  			var e_weight_2='${requestScope.tank.engine_2.weight}';
  			var e_message_2='${requestScope.tank.engine_2.engine_name.message}';
  			
  			var message="\n>>>引擎："+e_name_2;
  			if(e_name_2=="open"){
  				message="这里可以装备一个引擎";
  				alert(message);
  			}
  			else if(e_name_2=="close"){
  				message="这里的引擎装备栏是关闭的，请咨询<引擎改造专家>";
  				alert(message);
  			}
  			else{
	  			e_rarity_2="\n<<科技等级："+e_rarity_2+">>";
	  			e_load_2="\n>>引擎载重："+e_load_2+"dt";
	  			e_weight_2="\n>>重量："+e_weight_2+"dt";	
	  			message=message+e_rarity_2+e_load_2+e_weight_2;
	  			alert(message);
  			}
  		});  		
  		$("a[id='armor1']").click(function(){
  			var a_name='${requestScope.tank.armor.armor_name.name}';
  			var a_rarity='${requestScope.tank.armor.armor_name.rarity.rarity_ch}';
  			var a_max_hp='${requestScope.tank.armor.a_hp}';
  			var a_hp='${requestScope.tank.armor.a_hp}';
  			var a_he_def='${requestScope.tank.armor.a_he_def}';
  			var a_ap_def='${requestScope.tank.armor.a_ap_def}';
  			var a_re_hp='${requestScope.tank.armor.armor_name.a_re_hp}';
  			var a_weight='${requestScope.tank.armor.weight}';
  			var a_message='${requestScope.tank.armor.armor_name.message}';
  			
  			var message="\n>>>装甲："+a_name;
  			if(a_name=="open"){
  				message="这里可以装备一个装甲";
  				alert(message);
  			}
  			else{
	  			a_rarity="\n<<科技等级："+a_rarity+">>";
	  			a_hp="\n>>耐久值："+a_hp+"/"+a_max_hp;
	  			a_he_def="\n>>高爆防御："+a_he_def;
	  			a_ap_def="\n>>穿甲防御："+a_ap_def;
	  			a_weight="\n>>重量："+a_weight+"dt";
	  			a_message="\n"+a_message;
	  			message=message+a_rarity+a_hp+a_he_def+a_ap_def+a_weight+a_message;
	  			alert(message);
  			}
  		});
  		$("a[id='hole_1']").click(function(){
  			var message="";
  			var w_name='${requestScope.tank.hole_1.weapon_name.name}';
  			
  			var w_rarity="\n<<科技等级：${requestScope.tank.hole_1.weapon_name.rarity.rarity_ch}>>";
  			var w_type_ch="\n>>${requestScope.tank.hole_1.weapon_name.type_ch}";
  			var w_atk="\n>>火力：${requestScope.tank.hole_1.w_atk}x${requestScope.tank.hole_1.weapon_name.w_atk_num}";
  			var w_intercept="${requestScope.tank.hole_1.weapon_name.w_intercept}";
  			if(w_intercept>0){
  				w_intercept="\n>>迎击对应";
  			}
  			else{
  				w_intercept="";
  			}
  			var w_reload_time="\n>>装填时间：${requestScope.tank.hole_1.w_reload_time}";
  			var w_hit="\n>>命中率：${requestScope.tank.hole_1.w_hit}%";
  			var w_crt="\n>>暴击率：${requestScope.tank.hole_1.w_crt}%";
  			var w_x_crt="\n>>超暴击率：${requestScope.tank.hole_1.w_x_crt}%";
			var w_shell="\n>>弹仓：${requestScope.tank.hole_1.shell_name.name_ch}"+"(${requestScope.tank.hole_1.shell_num}/"+"${requestScope.tank.hole_1.weapon_name.max_shell_num})";
			
  			var w_weight="\n>>重量：${requestScope.tank.hole_1.weight}dt";
  			var w_message="\n>>${requestScope.tank.hole_1.weapon_name.message}";
			
  			var message="\n>>>"+w_name;
  			
  			if(w_name=="主炮穴"){
  				message="这里可以装备一门主炮";
  				alert(message);
  			}
  			else if(w_name=="副炮穴"){
  				message="这里可以装备一门副炮";
  				alert(message);
  			}
  			else if(w_name=="特殊武器穴"){
  				message="这里可以装备一门S-E";
  				alert(message);
  			}
  			else if(w_name=="close"){
  				message="这里的穴位是关闭的，请咨询<底盘改造专家 >";
  				alert(message);
  			}
  			else{
	  			message=message+w_rarity+w_type_ch+w_atk+w_reload_time+
	  			w_hit+w_crt+w_x_crt+w_shell+w_intercept+w_weight+w_message;
	  			alert(message);
  			}
  		});
  		$("a[id='hole_2']").click(function(){
  			var message="";
  			var w_name='${requestScope.tank.hole_2.weapon_name.name}';
  			
  			var w_rarity="\n<<科技等级：${requestScope.tank.hole_2.weapon_name.rarity.rarity_ch}>>";
  			var w_type_ch="\n>>${requestScope.tank.hole_2.weapon_name.type_ch}";
  			var w_atk="\n>>火力：${requestScope.tank.hole_2.w_atk}x${requestScope.tank.hole_2.weapon_name.w_atk_num}";
  			var w_intercept="${requestScope.tank.hole_2.weapon_name.w_intercept}";
  			if(w_intercept>0){
  				w_intercept="\n>>迎击对应";
  			}
  			else{
  				w_intercept="";
  			}
  			var w_reload_time="\n>>装填时间：${requestScope.tank.hole_2.w_reload_time}";
  			var w_hit="\n>>命中率：${requestScope.tank.hole_2.w_hit}%";
  			var w_crt="\n>>暴击率：${requestScope.tank.hole_2.w_crt}%";
  			var w_x_crt="\n>>超暴击率：${requestScope.tank.hole_2.w_x_crt}%";
			var w_shell="\n>>弹仓：${requestScope.tank.hole_2.shell_name.name_ch}"+"(${requestScope.tank.hole_2.shell_num}/"+"${requestScope.tank.hole_2.weapon_name.max_shell_num})";
			
  			var w_weight="\n>>重量：${requestScope.tank.hole_2.weight}dt";
  			var w_message="\n>>${requestScope.tank.hole_2.weapon_name.message}";
			
  			var message="\n>>>"+w_name;
  			
  			if(w_name=="主炮穴"){
  				message="这里可以装备一门主炮";
  				alert(message);
  			}
  			else if(w_name=="副炮穴"){
  				message="这里可以装备一门副炮";
  				alert(message);
  			}
  			else if(w_name=="特殊武器穴"){
  				message="这里可以装备一门S-E";
  				alert(message);
  			}
  			else if(w_name=="close"){
  				message="这里的穴位是关闭的，请咨询<底盘改造专家 >";
  				alert(message);
  			}
  			else{
	  			message=message+w_rarity+w_type_ch+w_atk+w_reload_time+
	  			w_hit+w_crt+w_x_crt+w_shell+w_intercept+w_weight+w_message;
	  			alert(message);
  			}
  		});
  		$("a[id='hole_3']").click(function(){
  			var message="";
  			var w_name='${requestScope.tank.hole_3.weapon_name.name}';
  			
  			var w_rarity="\n<<科技等级：${requestScope.tank.hole_3.weapon_name.rarity.rarity_ch}>>";
  			var w_type_ch="\n>>${requestScope.tank.hole_3.weapon_name.type_ch}";
  			var w_atk="\n>>火力：${requestScope.tank.hole_3.w_atk}x${requestScope.tank.hole_3.weapon_name.w_atk_num}";
  			var w_intercept="${requestScope.tank.hole_3.weapon_name.w_intercept}";
  			if(w_intercept>0){
  				w_intercept="\n>>迎击对应";
  			}
  			else{
  				w_intercept="";
  			}
  			var w_reload_time="\n>>装填时间：${requestScope.tank.hole_3.w_reload_time}";
  			var w_hit="\n>>命中率：${requestScope.tank.hole_3.w_hit}%";
  			var w_crt="\n>>暴击率：${requestScope.tank.hole_3.w_crt}%";
  			var w_x_crt="\n>>超暴击率：${requestScope.tank.hole_3.w_x_crt}%";
			var w_shell="\n>>弹仓：${requestScope.tank.hole_3.shell_name.name_ch}"+"(${requestScope.tank.hole_3.shell_num}/"+"${requestScope.tank.hole_3.weapon_name.max_shell_num})";
			
  			var w_weight="\n>>重量：${requestScope.tank.hole_3.weight}dt";
  			var w_message="\n>>${requestScope.tank.hole_3.weapon_name.message}";
			
  			var message="\n>>>"+w_name;
  			
  			if(w_name=="主炮穴"){
  				message="这里可以装备一门主炮";
  				alert(message);
  			}
  			else if(w_name=="副炮穴"){
  				message="这里可以装备一门副炮";
  				alert(message);
  			}
  			else if(w_name=="特殊武器穴"){
  				message="这里可以装备一门S-E";
  				alert(message);
  			}
  			else if(w_name=="close"){
  				message="这里的穴位是关闭的，请咨询<底盘改造专家 >";
  				alert(message);
  			}
  			else{
	  			message=message+w_rarity+w_type_ch+w_atk+w_reload_time+
	  			w_hit+w_crt+w_x_crt+w_shell+w_intercept+w_weight+w_message;
	  			alert(message);
  			}
  		});
  		$("a[id='hole_4']").click(function(){
  			var message="";
  			var w_name='${requestScope.tank.hole_4.weapon_name.name}';
  			
  			var w_rarity="\n<<科技等级：${requestScope.tank.hole_4.weapon_name.rarity.rarity_ch}>>";
  			var w_type_ch="\n>>${requestScope.tank.hole_4.weapon_name.type_ch}";
  			var w_atk="\n>>火力：${requestScope.tank.hole_4.w_atk}x${requestScope.tank.hole_4.weapon_name.w_atk_num}";
  			var w_intercept="${requestScope.tank.hole_4.weapon_name.w_intercept}";
  			if(w_intercept>0){
  				w_intercept="\n>>迎击对应";
  			}
  			else{
  				w_intercept="";
  			}
  			var w_reload_time="\n>>装填时间：${requestScope.tank.hole_4.w_reload_time}";
  			var w_hit="\n>>命中率：${requestScope.tank.hole_4.w_hit}%";
  			var w_crt="\n>>暴击率：${requestScope.tank.hole_4.w_crt}%";
  			var w_x_crt="\n>>超暴击率：${requestScope.tank.hole_4.w_x_crt}%";
			var w_shell="\n>>弹仓：${requestScope.tank.hole_4.shell_name.name_ch}"+"(${requestScope.tank.hole_4.shell_num}/"+"${requestScope.tank.hole_4.weapon_name.max_shell_num})";
			
  			var w_weight="\n>>重量：${requestScope.tank.hole_4.weight}dt";
  			var w_message="\n>>${requestScope.tank.hole_4.weapon_name.message}";
			
  			var message="\n>>>"+w_name;
  			
  			if(w_name=="主炮穴"){
  				message="这里可以装备一门主炮";
  				alert(message);
  			}
  			else if(w_name=="副炮穴"){
  				message="这里可以装备一门副炮";
  				alert(message);
  			}
  			else if(w_name=="特殊武器穴"){
  				message="这里可以装备一门S-E";
  				alert(message);
  			}
  			else if(w_name=="close"){
  				message="这里的穴位是关闭的，请咨询<底盘改造专家 >";
  				alert(message);
  			}
  			else{
	  			message=message+w_rarity+w_type_ch+w_atk+w_reload_time+
	  			w_hit+w_crt+w_x_crt+w_shell+w_intercept+w_weight+w_message;
	  			alert(message);
  			}
  		});
  		$("a[id='hole_5']").click(function(){
  			var message="";
  			var w_name='${requestScope.tank.hole_5.weapon_name.name}';
  			
  			var w_rarity="\n<<科技等级：${requestScope.tank.hole_5.weapon_name.rarity.rarity_ch}>>";
  			var w_type_ch="\n>>${requestScope.tank.hole_5.weapon_name.type_ch}";
  			var w_atk="\n>>火力：${requestScope.tank.hole_5.w_atk}x${requestScope.tank.hole_5.weapon_name.w_atk_num}";
  			var w_intercept="${requestScope.tank.hole_5.weapon_name.w_intercept}";
  			if(w_intercept>0){
  				w_intercept="\n>>迎击对应";
  			}
  			else{
  				w_intercept="";
  			}
  			var w_reload_time="\n>>装填时间：${requestScope.tank.hole_5.w_reload_time}";
  			var w_hit="\n>>命中率：${requestScope.tank.hole_5.w_hit}%";
  			var w_crt="\n>>暴击率：${requestScope.tank.hole_5.w_crt}%";
  			var w_x_crt="\n>>超暴击率：${requestScope.tank.hole_5.w_x_crt}%";
			var w_shell="\n>>弹仓：${requestScope.tank.hole_5.shell_name.name_ch}"+"(${requestScope.tank.hole_5.shell_num}/"+"${requestScope.tank.hole_5.weapon_name.max_shell_num})";
			
  			var w_weight="\n>>重量：${requestScope.tank.hole_5.weight}dt";
  			var w_message="\n>>${requestScope.tank.hole_5.weapon_name.message}";
			
  			var message="\n>>>"+w_name;
  			
  			if(w_name=="主炮穴"){
  				message="这里可以装备一门主炮";
  				alert(message);
  			}
  			else if(w_name=="副炮穴"){
  				message="这里可以装备一门副炮";
  				alert(message);
  			}
  			else if(w_name=="特殊武器穴"){
  				message="这里可以装备一门S-E";
  				alert(message);
  			}
  			else if(w_name=="close"){
  				message="这里的穴位是关闭的，请咨询<底盘改造专家 >";
  				alert(message);
  			}
  			else{
	  			message=message+w_rarity+w_type_ch+w_atk+w_reload_time+
	  			w_hit+w_crt+w_x_crt+w_shell+w_intercept+w_weight+w_message;
	  			alert(message);
  			}
  		});
  		$("a[id='hole_6']").click(function(){
  			var message="";
  			var w_name='${requestScope.tank.hole_6.weapon_name.name}';
  			
  			var w_rarity="\n<<科技等级：${requestScope.tank.hole_6.weapon_name.rarity.rarity_ch}>>";
  			var w_type_ch="\n>>${requestScope.tank.hole_6.weapon_name.type_ch}";
  			var w_atk="\n>>火力：${requestScope.tank.hole_6.w_atk}x${requestScope.tank.hole_6.weapon_name.w_atk_num}";
  			var w_intercept="${requestScope.tank.hole_6.weapon_name.w_intercept}";
  			if(w_intercept>0){
  				w_intercept="\n>>迎击对应";
  			}
  			else{
  				w_intercept="";
  			}
  			var w_reload_time="\n>>装填时间：${requestScope.tank.hole_6.w_reload_time}";
  			var w_hit="\n>>命中率：${requestScope.tank.hole_6.w_hit}%";
  			var w_crt="\n>>暴击率：${requestScope.tank.hole_6.w_crt}%";
  			var w_x_crt="\n>>超暴击率：${requestScope.tank.hole_6.w_x_crt}%";
			var w_shell="\n>>弹仓：${requestScope.tank.hole_6.shell_name.name_ch}"+"(${requestScope.tank.hole_6.shell_num}/"+"${requestScope.tank.hole_6.weapon_name.max_shell_num})";
			
  			var w_weight="\n>>重量：${requestScope.tank.hole_6.weight}dt";
  			var w_message="\n>>${requestScope.tank.hole_6.weapon_name.message}";
			
  			var message="\n>>>"+w_name;
  			
  			if(w_name=="主炮穴"){
  				message="这里可以装备一门主炮";
  				alert(message);
  			}
  			else if(w_name=="副炮穴"){
  				message="这里可以装备一门副炮";
  				alert(message);
  			}
  			else if(w_name=="特殊武器穴"){
  				message="这里可以装备一门S-E";
  				alert(message);
  			}
  			else if(w_name=="close"){
  				message="这里的穴位是关闭的，请咨询<底盘改造专家 >";
  				alert(message);
  			}
  			else{
	  			message=message+w_rarity+w_type_ch+w_atk+w_reload_time+
	  			w_hit+w_crt+w_x_crt+w_shell+w_intercept+w_weight+w_message;
	  			alert(message);
  			}
  		});
  		
  		//按下卸载按钮事件
  		$("a[id='unload']").click(function(){
  			var tank_id="${requestScope.tank.id }";
  			var type=$(this).attr("name");
  			var equip_id;
  			if(type=='armor'){
  				equip_id="${requestScope.tank.armor.id}";
  			}
  			else if(type=='core_1'){
  				equip_id="${requestScope.tank.core_1.id}";
  			}
  			else if(type=='core_2'){
  				equip_id="${requestScope.tank.core_2.id}";
  			}
  			else if(type=='engine_1'){
  				equip_id="${requestScope.tank.engine_1.id}";
  			}
  			else if(type=='engine_2'){
  				equip_id="${requestScope.tank.engine_2.id}";
  			}
  			else if(type=='hole_1'){
  				equip_id="${requestScope.tank.hole_1.id}";
  			}
  			else if(type=='hole_2'){
  				equip_id="${requestScope.tank.hole_2.id}";
  			}
  			else if(type=='hole_3'){
  				equip_id="${requestScope.tank.hole_3.id}";
  			}
  			else if(type=='hole_4'){
  				equip_id="${requestScope.tank.hole_4.id}";
  			}
  			else if(type=='hole_5'){
  				equip_id="${requestScope.tank.hole_5.id}";
  			}
  			else if(type=='hole_6'){
  				equip_id="${requestScope.tank.hole_6.id}";
  			}
  			$.get("<%=basePath%>pack/UnloanEquip?type="+type+"&equip_id="+equip_id+"&tank_id="+tank_id);
  		});
  	});
  </script>
  <body>
    <div class="container">
        <br>
       	<table id="tank_message">
        	<tr>
        		<td>载重：${requestScope.tank.tank_load}&nbsp;dt&nbsp;/&nbsp;${requestScope.tank.tank_max_load}&nbsp;dt&nbsp;&nbsp;</td>
        		<td>SP：${requestScope.tank.armor.sp}</td>
        	</tr>
        	<tr>
        		<td style="color:${requestScope.tank.tank_rarity.rarity_color}" id="tank_id" title="${requestScope.tank.id }">${requestScope.tank.name }</td>
        		<td><a style="color:${requestScope.tank.tank_rarity.rarity_color}" id="chassis_skill">(${requestScope.tank.chassis_skill.skill_name_ch })</a></td>
        	</tr>
        	<tr>
        		<td style="color:${requestScope.tank.tank_rarity.rarity_color}"><--${requestScope.tank.tank_rarity.rarity_ch }--></td>
        	</tr>
        	<tr>
        		<td style="color:${requestScope.tank.tank_rarity.rarity_color}">底盘重量：${requestScope.tank.chassis_weight}&nbsp;dt</td>
        	</tr>
        	<tr>
        		<td>C核心一：<a style="color:${requestScope.tank.core_1.core_name.rarity.rarity_color}" id="core_1">${requestScope.tank.core_1.core_name.name}</a></td>
        		<c:if test="${requestScope.tank.core_1.core_name.id>2}">
        			<td><a id="unload" name="core_1">卸载</a></td>
        		</c:if>
        		<c:if test="${requestScope.tank.core_1.core_name.id==2}">
        			<td><a id="core1" >装备</a></td>
        		</c:if>
        	</tr>
        	<tr>
        		<td>C核心二：<a style="color:${requestScope.tank.core_2.core_name.rarity.rarity_color}" id="core_2">${requestScope.tank.core_2.core_name.name}</a></td>
        		<c:if test="${requestScope.tank.core_2.core_name.id>2}">
        			<td><a id="unload" name="core_2">卸载</a></td>
        		</c:if>
        		<c:if test="${requestScope.tank.core_2.core_name.id==2}">
        			<td><a name="core2">装备</a></td>
        		</c:if>
        	</tr>
        	<tr>
        		<td>引擎一：<a style="color:${requestScope.tank.engine_1.engine_name.rarity.rarity_color}" id="engine_1">${requestScope.tank.engine_1.engine_name.name}</a></td>
        		<c:if test="${requestScope.tank.engine_1.e_load>0}">
        			<td>
        			载重量：${requestScope.tank.engine_1.e_load}&nbsp;dt
        			<a id="unload" name="engine_1">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.engine_1.id==2}">
        			<td>
        			<a id="equip" name="engine_1">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
        		<td>引擎二：<a style="color:${requestScope.tank.engine_2.engine_name.rarity.rarity_color}" id="engine_2">${requestScope.tank.engine_2.engine_name.name}</a></td>
        		<c:if test="${requestScope.tank.engine_2.e_load>0}">
        			<td>
        				载重量：${requestScope.tank.engine_2.e_load}&nbsp;dt
        				<a id="unload" name="engine_2">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.engine_2.id==2}">
        			<td>
        				<a id="equip" name="engine_2">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
        		<td>装甲：<a style="color:${requestScope.tank.armor.armor_name.rarity.rarity_color}" id="armor">${requestScope.tank.armor.armor_name.name}</a></td>
        		<c:if test="${requestScope.tank.armor.id>2}">
	        		<td>
	        			耐久值：${requestScope.tank.armor.a_hp}(${requestScope.tank.armor.a_hp/requestScope.tank.armor.armor_name.a_hp*100}%)
	        			<a id="unload" name="armor">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.armor.id==2}">
	        		<td>
	        			<a id="unload" name="armor">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
        		<td>一号穴位：<a style="color:${requestScope.tank.hole_1.weapon_name.rarity.rarity_color}" id="hole_1">${requestScope.tank.hole_1.weapon_name.name}</a></td>
        		<c:if test="${requestScope.tank.hole_1.w_atk>0}">
        			<td>
        				火力：${requestScope.tank.hole_1.w_atk}x${requestScope.tank.hole_1.weapon_name.w_atk_num}
        				<a id="unload" name="hole_1">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.hole_1.id<5 and requestScope.tank.hole_1.id>1}">
        			<td>
        				<a id="unload" name="hole_1">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
				<td>二号穴位：<a style="color:${requestScope.tank.hole_2.weapon_name.rarity.rarity_color}" id="hole_2">${requestScope.tank.hole_2.weapon_name.name}</a></td>
        		<c:if test="${requestScope.tank.hole_2.w_atk>0}">
        			<td>
        				火力：${requestScope.tank.hole_2.w_atk}x${requestScope.tank.hole_2.weapon_name.w_atk_num}
        				<a id="unload" name="hole_2">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.hole_2.id<5 and requestScope.tank.hole_2.id>1}">
        			<td>
        				<a id="unload" name="hole_2">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
				<td>三号穴位：<a style="color:${requestScope.tank.hole_3.weapon_name.rarity.rarity_color}" id="hole_3">${requestScope.tank.hole_3.weapon_name.name}</a></td>
        		<c:if test="${requestScope.tank.hole_3.w_atk>0}">
        			<td>
        			火力：${requestScope.tank.hole_3.w_atk}x${requestScope.tank.hole_3.weapon_name.w_atk_num}
        			<a id="unload" name="hole_3">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.hole_3.id<5 and requestScope.tank.hole_3.id>1}">
        			<td>
        				<a id="unload" name="hole_3">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
				<td>四号穴位：<a style="color:${requestScope.tank.hole_4.weapon_name.rarity.rarity_color}" id="hole_4">${requestScope.tank.hole_4.weapon_name.name}</a></td>
        		<c:if test="${requestScope.tank.hole_4.w_atk>0}">
        			<td>
        			火力：${requestScope.tank.hole_4.w_atk}x${requestScope.tank.hole_4.weapon_name.w_atk_num}
        			<a id="unload" name="hole_4">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.hole_4.id<5 and requestScope.tank.hole_4.id>1}">
        			<td>
        				<a id="unload" name="hole_4">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
				<td>五号穴位：<a style="color:${requestScope.tank.hole_5.weapon_name.rarity.rarity_color}" id="hole_5">${requestScope.tank.hole_5.weapon_name.name}</a></td>
        		<c:if test="${requestScope.tank.hole_5.w_atk>0}">
        			<td>
        			火力：${requestScope.tank.hole_5.w_atk}x${requestScope.tank.hole_5.weapon_name.w_atk_num}
        			<a id="unload" name="hole_5">卸载</a>
        			</td>
        		</c:if>
        		<c:if test="${requestScope.tank.hole_5.id<5 and requestScope.tank.hole_5.id>1}">
        			<td>
        				<a id="unload" name="hole_5">装备</a>
        			</td>
        		</c:if>
        	</tr>
        	<tr>
				<td>六号穴位：<a style="color:${requestScope.tank.hole_6.weapon_name.rarity.rarity_color}" id="hole_6">${requestScope.tank.hole_6.weapon_name.name}</a></td>
        		<c:if test="${requestScope.tank.hole_6.w_atk>0}">
	        		<td>火力：${requestScope.tank.hole_6.w_atk}x${requestScope.tank.hole_6.weapon_name.w_atk_num} 
	        			<a id="unload" name="hole_6">卸载</a>
	        		</td>
        		</c:if>
        		<c:if test="${requestScope.tank.hole_6.id<5 and requestScope.tank.hole_6.id>1}">
        			<td>
        				<a id="unload" name="hole_6">装备</a>
        			</td>
        		</c:if>
        	</tr>
        </table>
        <div>
        	<img src="${requestScope. tank.img}" width="500" height="200">
        </div>
        <ul class="pagination">
        <li><a href="<%=basePath%>pack/getTankFromP_Id?page=${requestScope.countPage-1 }" title="上一辆战车">&laquo;</a></li>
        <c:forEach var="page" begin="1"  step="1" end="${requestScope.countPage }">
    		<li><a href="<%=basePath%>pack/getTankFromP_Id?page=${page}">${page}</a></li>
        </c:forEach>
        <li><a href="<%=basePath%>pack/getTankFromP_Id?page=${requestScope.countPage+1 }" title="下一辆战车">&raquo;</a></li>
        </ul>
    </div>
  </body>
</html>
