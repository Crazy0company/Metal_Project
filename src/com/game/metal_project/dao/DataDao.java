package com.game.metal_project.dao;

import com.game.metal_project.model.data.Armor_DataModel;
import com.game.metal_project.model.data.Chassis_Skill_DataModel;
import com.game.metal_project.model.data.Core_DataModel;
import com.game.metal_project.model.data.Engine_DataModel;
import com.game.metal_project.model.data.Material_DataModel;
import com.game.metal_project.model.data.RarityModel;
import com.game.metal_project.model.data.Shell_DataModel;
import com.game.metal_project.model.data.Tank_DataModel;
import com.game.metal_project.model.data.Weapon_DataModel;

public interface DataDao {
	
	//根据装甲的中文名称获取装甲的信息 
	public Armor_DataModel getArmorDataFromCH(Armor_DataModel adm);
	
	//根据特性中文名称获取战车底盘特性 
	public Chassis_Skill_DataModel getChassisSkill(Chassis_Skill_DataModel csd);
	
	//根据C核心的中文名称获取C核心的信息 
	public Core_DataModel getCoreDataFromCH(Core_DataModel cdm);
	
	//根据引擎的中文名称获取引擎的信息 
	public Engine_DataModel getEngineDataFromCH(Engine_DataModel cdm);
	
	//根据稀有度的ID获取稀有度的信息 
	public RarityModel getRarityFromID(RarityModel rarity);
	
	//根据炮弹名称获取炮弹信息
	public Shell_DataModel getShellDataFromCH(Shell_DataModel sdm);
	
	//根据战车id查询战车信息
	public Tank_DataModel getTankDataFromid(int id);
	
	//根据武器的名称获取武器的信息 
	public Weapon_DataModel getWeaponDataFromCH(Weapon_DataModel wdm);
	
	//根据材料的名称获取材料的信息 
	public Material_DataModel getMaterialDataFromCH(Material_DataModel mdm);
}
