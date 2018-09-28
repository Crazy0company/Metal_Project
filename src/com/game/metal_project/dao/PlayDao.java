package com.game.metal_project.dao;

import com.game.metal_project.model.PlayModel;

public interface PlayDao {
	
	//登录
	public PlayModel login(PlayModel pm);
	
	//注册
	public int regist(PlayModel pm);
	
	//根据邮箱查询用户
	public PlayModel getPlay_Email(String p_email);
}
