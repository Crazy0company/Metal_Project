package com.game.metal_project.bean;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.game.metal_project.dao.PackDao;
import com.game.metal_project.dao.DataDao;
import com.game.metal_project.model.data.Armor_DataModel;
import com.game.metal_project.model.data.Chassis_Skill_DataModel;
import com.game.metal_project.model.data.Core_DataModel;
import com.game.metal_project.model.data.Engine_DataModel;
import com.game.metal_project.model.data.Weapon_DataModel;
import com.game.metal_project.model.pack.Armor_PackModel;
import com.game.metal_project.model.pack.Core_PackModel;
import com.game.metal_project.model.pack.Engine_PackModel;
import com.game.metal_project.model.pack.Material_PackModel;
import com.game.metal_project.model.pack.Shell_PackModel;
import com.game.metal_project.model.pack.Tank_PackModel;
import com.game.metal_project.model.pack.Weapon_PackModel;

@Service
public class PackBean {
	@Resource
	public PackDao packDao;
	@Resource
	public DataDao dataDao;
	
	//根据战车id查询战车
	public Tank_PackModel tankMessage(int id){
		return packDao.tankMessage(id);
	}
		
	//根据背包内的装甲id查询该玩家背包内的装甲
	public Armor_PackModel getArmorPackFromID(int id){
		return packDao.getArmorPackFromID(id);
	}
	
	//根据装备库内的C核心id查询对应的C核心
	public Core_PackModel getCorePackFromID(int id){
		return packDao.getCorePackFromID(id);
	}
	
	//根据装备库内的引擎id查询该玩家装备库内的引擎
	public Engine_PackModel getEnginePackFromID(int id){
		return packDao.getEnginePackFromID(id);
	}
	
	//根据材料名称和玩家id查询该玩家材料库内的材料
	public Material_PackModel getMaterialPackFromCH(Material_PackModel Material_PM){
		return packDao.getMaterialPackFromCH(Material_PM);
	}
	
	//根据炮弹名称和玩家id查询该玩家炮弹库内的炮弹
	public Shell_PackModel getShellPackFromCH(Shell_PackModel Shell_PM){
		return packDao.getShellPackFromCH(Shell_PM);
	}
	
	//根据装备库内的武器id查询该玩家装备库内的武器
	public Weapon_PackModel getWeaponPackFromID(int id){
		return packDao.getWeaponPackFromID(id);
	}
	
	//根据车库战车id和玩家id查询该玩家车库内的战车
	public Tank_PackModel getTankPackFromID(Tank_PackModel Tank_PM){
		return packDao.getTankPackFromID(Tank_PM);
	}
	
	//传入玩家的id查询玩家未装备的引擎
	public List<Engine_PackModel> getEngineFromP(int p_id){
		return packDao.getEngineFromP(p_id);
	}
	
	//根据玩家id查询未装备的主炮
	public List<Weapon_PackModel> getWeaponFromP(int p_id){
		return packDao.getWeaponFromP(p_id);
	}
	
	//根据玩家id查询未装备的C核心
	public List<Core_PackModel> getCoreFromP(int p_id){
		return packDao.getCoreFromP(p_id);
	}
	
	//根据玩家id查询未装备的装甲
	public List<Armor_PackModel> getArmorFromP(int p_id){
		return packDao.getArmorFromP(p_id);
	}
	
	//获取玩家车库内的所有战车，并进行属性更新处理
	public List<Tank_PackModel> getTankPackFromP_ID(int p_id){
		List<Tank_PackModel> tps=packDao.getTankPackFromP_ID(p_id);
		for(int i=0;i<tps.size();i++){
					//更新C核心加成的信息
					Core_PackModel cpm1=tps.get(i).getCore_1();
					Core_PackModel cpm2=tps.get(i).getCore_2();
					
					Engine_PackModel epm_1=tps.get(i).getEngine_1();
					Engine_PackModel epm_2=tps.get(i).getEngine_2();
					
					if(epm_1.getId()>2) epm_1=updateEngineData(cpm1, cpm2, epm_1);
					if(epm_2.getId()>2) epm_2=updateEngineData(cpm1, cpm2, epm_2);
					
					Weapon_PackModel wpm1=tps.get(i).getHole_1();
					Weapon_PackModel wpm2=tps.get(i).getHole_2();
					Weapon_PackModel wpm3=tps.get(i).getHole_3();
					Weapon_PackModel wpm4=tps.get(i).getHole_4();
					Weapon_PackModel wpm5=tps.get(i).getHole_5();
					Weapon_PackModel wpm6=tps.get(i).getHole_6();
					
					if(wpm1.getId()>4) wpm1=updataWeaponData(cpm1, cpm2, null, wpm1);
					if(wpm2.getId()>4) wpm2=updataWeaponData(cpm1, cpm2, null, wpm2);
					if(wpm3.getId()>4) wpm3=updataWeaponData(cpm1, cpm2, null, wpm3);
					if(wpm4.getId()>4) wpm4=updataWeaponData(cpm1, cpm2, null, wpm4);
					if(wpm5.getId()>4) wpm5=updataWeaponData(cpm1, cpm2, null, wpm5);
					if(wpm6.getId()>4) wpm6=updataWeaponData(cpm1, cpm2, null, wpm6);
					
					int sum_weight=weightSum(tps.get(i));
					int sum_load=tps.get(i).getEngine_1().getE_load()+tps.get(i).getEngine_2().getE_load();
					tps.get(i).setTank_load(sum_weight);
					tps.get(i).setTank_max_load(sum_load);
		}
		return tps;
	}
	
	/**
	 * 读取玩家的战车时，C核心，底盘特性等一些因素会影响到战车其他装备的数据，所以需要对这些数据进行更新，以下为更新方法
	 * 除C核心和装甲外的更新方法均传入了两个C核心和一个底盘特性，如果是要计算C核心加成的信息，就只需要传入C核心，而不需要传入底盘特性
	 * 如果只计算底盘特性，则传入一个底盘特性即可
	 * @param Tank_PM
	 * @return
	 */
	
	//C核心
	public Core_PackModel updataCoreData(Core_PackModel cpm){
		return cpm;
	}
	
	//装甲
	public Armor_PackModel updataArmorData(Armor_PackModel apm){
		return apm;
	}
	
	// 更新引擎信息
	public Engine_PackModel updateEngineData(Core_PackModel cpm_1,Core_PackModel cpm_2,Engine_PackModel epm){
		//根据传入的引擎名称从数据库获取到引擎的信息
		Engine_DataModel edm=dataDao.getEngineDataFromCH(epm.getEngine_name());
		int e_load_p=epm.getE_load();		//读取到已装备的引擎的载重量
		
		if(cpm_1!=null){
			int c_load_1=(int) (cpm_1.getC_load()*0.01*edm.getE_load());	//获取C核心的加成值
			e_load_p+=c_load_1;
		}
		if(cpm_2!=null){
			int c_load_2=(int) (cpm_2.getC_load()*0.01*edm.getE_load());	//获取C核心的加成值
			e_load_p+=c_load_2;
		}
		epm.setE_load(e_load_p);
		return epm;		//返回更新后的引擎信息
	}
	
	//更新武器信息
	public Weapon_PackModel updataWeaponData(Core_PackModel cpm1,Core_PackModel cpm2,Chassis_Skill_DataModel csd,Weapon_PackModel wpm){
		//获取武器信息
		Weapon_DataModel wdm=dataDao.getWeaponDataFromCH(wpm.getWeapon_name());	
		float w_crt=wdm.getW_crt();		//获取武器基础暴击
		float w_x_crt=wdm.getW_x_crt();		//获取武器基础超暴击
		float w_hit=wdm.getW_hit();		//获取武器基础命中
		float w_reload=wdm.getW_reload_time();	//获取武器基础装填时间
		
		float w_crt_n=wpm.getW_crt();	//获取该武器当前的暴击
		float w_x_crt_n=wpm.getW_x_crt();	//获取该武器当前的超暴击
		float w_hit_n=wpm.getW_hit();	//获取该武器当前的命中
		float w_reload_n=wpm.getW_reload_time();	//获取该武器当前的装填时间
		//获取1号核心信息
		if(cpm1!=null){
			float c1_crt=cpm1.getC_crt();	
			float c1_x_crt=cpm1.getC_x_crt();
			float c1_reload=(float) (cpm1.getC_reload_time()*0.01*wdm.getW_reload_time());
 			float c1_hit=cpm1.getC_hit();
			w_crt_n+=c1_crt;
			w_x_crt_n+=c1_x_crt;
			w_hit_n+=c1_hit;
			w_reload_n+=c1_reload;
		}
		//获取2号核心信息
		if(cpm2!=null){
			float c2_crt=cpm2.getC_crt();	
			float c2_x_crt=cpm2.getC_x_crt();
			float c2_reload=(float) (cpm2.getC_reload_time()*0.01*wdm.getW_reload_time());
			float c2_hit=cpm2.getC_hit();
			w_crt_n+=c2_crt;
			w_x_crt_n+=c2_x_crt;
			w_hit_n+=c2_hit;
			w_reload_n+=c2_reload;
		}
		
		wpm.setW_crt(w_crt_n);
		wpm.setW_x_crt(w_x_crt_n);
		wpm.setW_hit(w_hit_n);
		wpm.setW_reload_time(w_reload_n);
		
		return wpm;
	}
	/**
	 * 更新数据结束
	 */
	
	/**
	 * 计算战车上装载的全部装备及炮弹的重量
	 * @param tpm
	 * @return
	 */
	public int weightSum(Tank_PackModel tpm){
		Core_PackModel cpm1=tpm.getCore_1();
		Core_PackModel cpm2=tpm.getCore_2();
		
		Engine_PackModel epm_1=tpm.getEngine_1();
		Engine_PackModel epm_2=tpm.getEngine_2();
		
		Weapon_PackModel wpm1=tpm.getHole_1();
		Weapon_PackModel wpm2=tpm.getHole_2();
		Weapon_PackModel wpm3=tpm.getHole_3();
		Weapon_PackModel wpm4=tpm.getHole_4();
		Weapon_PackModel wpm5=tpm.getHole_5();
		Weapon_PackModel wpm6=tpm.getHole_6();
		
		//计算战车总装备的重量
		int equip_weight=tpm.getChassis_weight()+
				tpm.getArmor().getWeight()+
				cpm1.getWeight()+cpm2.getWeight()+
				epm_1.getWeight()+epm_2.getWeight()+
				wpm1.getWeight()+wpm2.getWeight()+wpm3.getWeight()+
				wpm4.getWeight()+wpm5.getWeight()+wpm6.getWeight();
		int shell_weight=wpm1.getShell_name().getWeight()*wpm1.getShell_num()+
				wpm2.getShell_name().getWeight()*wpm2.getShell_num()+
				wpm3.getShell_name().getWeight()*wpm3.getShell_num()+
				wpm4.getShell_name().getWeight()*wpm4.getShell_num()+
				wpm5.getShell_name().getWeight()*wpm5.getShell_num()+
				wpm6.getShell_name().getWeight()*wpm6.getShell_num();
		int sp_weight=tpm.getArmor().getSp();
		
		int sum_weight=equip_weight+shell_weight+sp_weight;
		
		return sum_weight;
	}
	
	//获取到新战车时，将战车放入车库
	public int tankInPack(Tank_PackModel Tank_PM){
		return packDao.tankInPack(Tank_PM);
	}
	
	//获得装甲时，将装甲放入装备库
	public int armorInPack(Armor_PackModel armor_PM){
		return packDao.armorInPack(armor_PM);
	}
	
	//获得C核心时，将C核心放入装备库
	public int coreInPack(Core_PackModel core_PM){
		return packDao.coreInPack(core_PM);
	}
	

	//获得引擎时，将引擎心放入装备库
	public int engineInPack(Engine_PackModel engine_PM){
		return packDao.engineInPack(engine_PM);
	}
	
	//获得武器时，将武器放入装备库
	public int weaponInPack(Weapon_PackModel weapon_PM){
		return packDao.weaponInPack(weapon_PM);
	}
	
	//获得材料时，将材料放入材料库
	public int materialInPack(Material_PackModel material_PM){
		return packDao.materialInPack(material_PM);
	}
	
	//获得炮弹时，将炮弹放入炮弹库
	public int shellInPack(Shell_PackModel shell_PM){
		return packDao.shellInPack(shell_PM);
	}
	
	/**
	 * 更新数据
	 */
	//卸载装备
	public int UnloadEquip(String type,int equip_id,int tank_id){
		int status=0;
		status=packDao.updateEquipped_with(0,equip_id, type);		//更新战车装备的装备情况，将其变为未装备状态，将equipped_with变为0
		
		//将战车上该栏未变为未装备状态，如果该栏位为武器栏位，则比较特殊，需要判断是哪种类型的武器栏位
		if(type.equals("hole_1")||type.equals("hole_2")||
				type.equals("hole_3")||type.equals("hole_4")||
				type.equals("hole_5")||type.equals("hole_6")){
			Weapon_PackModel wpm=packDao.getWeaponPackFromID(equip_id);	//获取到武器信息
			if(wpm.getWeapon_name().getType_en().equals("M_Gun")){
				status=packDao.updateEquip(type, tank_id, 2);	//如果该位置为主炮，则还原为主炮穴
			}
			else if(wpm.getWeapon_name().getType_en().equals("A_Gun")){
				status=packDao.updateEquip(type, tank_id, 3);	//如果该位置为副炮炮，则还原为副炮穴
			}
			else if(wpm.getWeapon_name().getType_en().equals("S_Gun")){
				status=packDao.updateEquip(type, tank_id, 4);	//如果该位置为特殊武器，则还原为特殊武器穴
			}
		}
		else{
			status=packDao.updateEquip(type, tank_id, 2);
		}
		
		return status;
	}
}
