package com.game.metal_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.game.metal_project.model.pack.Armor_PackModel;
import com.game.metal_project.model.pack.Core_PackModel;
import com.game.metal_project.model.pack.Engine_PackModel;
import com.game.metal_project.model.pack.Material_PackModel;
import com.game.metal_project.model.pack.Shell_PackModel;
import com.game.metal_project.model.pack.Tank_PackModel;
import com.game.metal_project.model.pack.Weapon_PackModel;

public interface PackDao {
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	//根据战车id查询战车
	public Tank_PackModel tankMessage(int id);
	
	//根据背包内的装甲id查询该玩家背包内的装甲
	public Armor_PackModel getArmorPackFromID(int id);
	
	//根据装备库内的C核心id查询对应的C核心
	public Core_PackModel getCorePackFromID(int id);
	
	//根据装备库内的引擎id查询该玩家装备库内的引擎
	public Engine_PackModel getEnginePackFromID(int id);
	
	//根据材料名称和玩家id查询该玩家材料库内的材料
	public Material_PackModel getMaterialPackFromCH(Material_PackModel Material_PM);
	
	//根据炮弹名称和玩家id查询该玩家炮弹库内的炮弹
	public Shell_PackModel getShellPackFromCH(Shell_PackModel Shell_PM);
	
	//根据装备库内的武器id查询该玩家装备库内的武器
	public Weapon_PackModel getWeaponPackFromID(int id);
	
	//根据车库战车id和玩家id查询该玩家车库内的战车
	public Tank_PackModel getTankPackFromID(Tank_PackModel Tank_PM);
	
	//获取玩家车库内的所有战车
	public List<Tank_PackModel> getTankPackFromP_ID(int p_id);
	
	//根据玩家id查询未装备的武器
	public List<Weapon_PackModel> getWeaponFromP(int p_id);
	
	//传入玩家的id查询玩家未装备的引擎
	public List<Engine_PackModel> getEngineFromP(int p_id);
	
	//根据玩家id查询未装备的C核心
	public List<Core_PackModel> getCoreFromP(int p_id);
	
	//根据玩家id查询未装备的装甲
	public List<Armor_PackModel> getArmorFromP(int p_id);
	
	/**
	 * 插入
	 * @param Tank_PM
	 * @return
	 */
	//获取到新战车时，将战车放入车库
	public int tankInPack(Tank_PackModel Tank_PM);
	
	//获得装甲时，将装甲放入装备库
	public int armorInPack(Armor_PackModel armor_PM);
	
	//获得C核心时，将C核心放入装备库
	public int coreInPack(Core_PackModel core_PM);
	
	//获得引擎时，将引擎心放入装备库
	public int engineInPack(Engine_PackModel engine_PM);
	
	//获得武器时，将武器放入装备库
	public int weaponInPack(Weapon_PackModel weapon_PM);
	
	//获得材料时，将材料放入材料库
	public int materialInPack(Material_PackModel material_PM);
	
	//获得炮弹时，将材料放入炮弹库
	public int shellInPack(Shell_PackModel shell_PM);
	
	/**
	 * 更新
	 */
	
	/**
	 * 改变装备的使用情况，改变Equipped_with这一栏的数据，1为使用着，0为未使用
	 * @param equip_status	传入需要改变成的状态
	 * @param equip_id	传入一个装备id
	 * @param type	传入装备的类型，armor,core,engine,weapon
	 * @return
	 */
	public int updateEquipped_with(@Param("equip_status")int equip_status,@Param("equip_id")int equip_id,@Param("type")String type);
	
	//将战车上某一栏的装备变为其他装备,传入三个值：type需要变更的装备栏，tank_id:战车id，equip:需要变更成的装备的id
	public int updateEquip(@Param("type")String type,@Param("tank_id")int tank_id,@Param("equip")int equip);
}
