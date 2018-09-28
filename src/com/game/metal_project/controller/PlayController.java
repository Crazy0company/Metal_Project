package com.game.metal_project.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.metal_project.bean.PlayBean;
import com.game.metal_project.dao.PlayDao;
import com.game.metal_project.model.PlayModel;

@Controller
@RequestMapping(value="play")
public class PlayController {
	@Resource
	public PlayBean playBean;
	
	@ResponseBody
	@RequestMapping(value="/login")
	public String login(HttpSession se,PlayModel pm){
		PlayModel play=playBean.login(pm);
		if(play!=null){
			se.setAttribute("play", play);
			return "ok";
		}
		else{
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/regist")
	public String regist(HttpSession se,HttpServletRequest re,String p_email){
		String message=null;
		PlayModel pm=playBean.getPlay_Email(p_email);
		if(pm!=null){
			message="ERROR:repeat";
		}
		else if(pm==null){
			pm=new PlayModel();
			pm.setP_gold(0);
			pm.setP_exp(0);
			pm.setP_max_garage(3);
			pm.setP_max_exp(0);
			pm.setP_email(p_email);
			se.setAttribute("play", pm);
			message="OK";
		}
		re.setAttribute("message", message);
		return message;
	}
}
