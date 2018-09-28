package com.game.metal_project.test.dao;

import javax.annotation.Resource;

import org.junit.Test;

import com.game.metal_project.dao.DataDao;
import com.game.metal_project.model.data.Weapon_DataModel;
import com.game.metal_project.test.SpringJunitTest;

public class DataDaoTest extends SpringJunitTest{
	@Resource
	public DataDao dataDao;
	
	@Test
	public void test(){
		Weapon_DataModel wdm=new Weapon_DataModel();
		wdm.setName("45mm主炮");
		Weapon_DataModel wdm1=dataDao.getWeaponDataFromCH(wdm);
		System.out.println(wdm1.getShell_name().getName_en());
	}
	
}
