package com.game.metal_project.test.dao;

import javax.annotation.Resource;

import org.junit.Test;

import com.game.metal_project.dao.PlayDao;
import com.game.metal_project.model.PlayModel;
import com.game.metal_project.test.SpringJunitTest;

public class PlayDaoTest extends SpringJunitTest{
	@Resource
	public PlayDao pd;
	
	@Test
	public void test(){
		PlayModel pm=new PlayModel();
		pm.setP_password("123456");
		pm.setP_email("123456@qq.com");
		PlayModel pml=pd.login(pm);
		System.out.println(pml.getP_username());
	}
}
