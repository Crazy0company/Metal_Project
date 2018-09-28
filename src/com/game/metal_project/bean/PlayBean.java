package com.game.metal_project.bean;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.game.metal_project.dao.PlayDao;
import com.game.metal_project.model.PlayModel;

@Service
public class PlayBean {
	@Resource
	public PlayDao playDao;
	
	//根据邮箱查询用户
	public PlayModel getPlay_Email(String p_email){
		return playDao.getPlay_Email(p_email);
	}
	
	//登录
	public PlayModel login(PlayModel pm){
		return	playDao.login(pm);
	}
	
	//注册
	public int regist(PlayModel pm){
		return playDao.regist(pm);
	}
}
