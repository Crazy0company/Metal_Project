package com.game.metal_project.test.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.game.metal_project.dao.PackDao;
import com.game.metal_project.model.data.Armor_DataModel;
import com.game.metal_project.model.data.Chassis_Skill_DataModel;
import com.game.metal_project.model.data.Core_DataModel;
import com.game.metal_project.model.data.Engine_DataModel;
import com.game.metal_project.model.data.Material_DataModel;
import com.game.metal_project.model.data.RarityModel;
import com.game.metal_project.model.data.Shell_DataModel;
import com.game.metal_project.model.data.Tank_DataModel;
import com.game.metal_project.model.data.Weapon_DataModel;
import com.game.metal_project.model.pack.Armor_PackModel;
import com.game.metal_project.model.pack.Core_PackModel;
import com.game.metal_project.model.pack.Engine_PackModel;
import com.game.metal_project.model.pack.Material_PackModel;
import com.game.metal_project.model.pack.Shell_PackModel;
import com.game.metal_project.model.pack.Tank_PackModel;
import com.game.metal_project.model.pack.Weapon_PackModel;
import com.game.metal_project.test.SpringJunitTest;

public class PackDaoTest extends SpringJunitTest{
	@Resource
	public PackDao packDao;
	
	Weapon_DataModel weapon_dm=new Weapon_DataModel();
	Armor_DataModel armor_dm=new Armor_DataModel();
	Shell_DataModel shell_dm=new Shell_DataModel();
	Core_DataModel core_dm=new Core_DataModel();
	Engine_DataModel engine_dm=new Engine_DataModel();
	Tank_DataModel tank_dm=new Tank_DataModel();
	Material_DataModel material_dm=new Material_DataModel();
	RarityModel rarity=new RarityModel();
	Chassis_Skill_DataModel csdm=new Chassis_Skill_DataModel(); 
	
	Weapon_PackModel weapon_pm_1=new Weapon_PackModel();
	Weapon_PackModel weapon_pm_2=new Weapon_PackModel();
	Armor_PackModel armor_pm=new Armor_PackModel();
	Tank_PackModel tank_pm=new Tank_PackModel();
	Core_PackModel core_pm_1=new Core_PackModel();
	Core_PackModel core_pm_2=new Core_PackModel();
	Shell_PackModel shell_pm=new Shell_PackModel();
	Engine_PackModel engine_pm_1=new Engine_PackModel();
	Engine_PackModel engine_pm_2=new Engine_PackModel();
	Material_PackModel material_pm=new Material_PackModel();
	
	public void test(){

	}
	

	public void test1(){
		
	}
	
	@Test
	public void test2(){

	}

	public void test3(){
	}
}
