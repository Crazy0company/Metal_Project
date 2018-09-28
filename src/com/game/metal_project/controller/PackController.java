package com.game.metal_project.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.metal_project.bean.DataBean;
import com.game.metal_project.bean.PackBean;
import com.game.metal_project.dao.PackDao;
import com.game.metal_project.model.PlayModel;
import com.game.metal_project.model.data.Armor_DataModel;
import com.game.metal_project.model.data.Core_DataModel;
import com.game.metal_project.model.data.Engine_DataModel;
import com.game.metal_project.model.data.Tank_DataModel;
import com.game.metal_project.model.data.Weapon_DataModel;
import com.game.metal_project.model.pack.Armor_PackModel;
import com.game.metal_project.model.pack.Core_PackModel;
import com.game.metal_project.model.pack.Engine_PackModel;
import com.game.metal_project.model.pack.Tank_PackModel;
import com.game.metal_project.model.pack.Weapon_PackModel;

@Controller
@RequestMapping(value="pack")
public class PackController {
	@Resource
	public PackBean packBean;
	@Resource
	public DataBean dataBean;
	
	//根据玩家id查询玩家装备库内未安装到战车上的装备
	@RequestMapping(value="/getEquip")
	public String getEquip(HttpSession se,HttpServletRequest re){
		PlayModel play=(PlayModel) se.getAttribute("play");
		int p_id=play.getP_id();
		List<Weapon_PackModel> wpms=packBean.getWeaponFromP(p_id);	//查询到全部未装备的武器
		//获取到主炮类型的武器
		List<Weapon_PackModel> m_guns=new ArrayList<Weapon_PackModel>();
		List<Weapon_PackModel> a_guns=new ArrayList<Weapon_PackModel>();
		List<Weapon_PackModel> s_guns=new ArrayList<Weapon_PackModel>();
		for(int i=0;i<wpms.size();i++){
			Weapon_PackModel gun=new Weapon_PackModel();
			if(wpms.get(i).getWeapon_name().getType_en().equals("M_Gun")){
				//如果遍历到的武器为主炮，则添加进主炮数组中
				gun=wpms.get(i);
				m_guns.add(gun);
			}
			else if(wpms.get(i).getWeapon_name().getType_en().equals("A_Gun")){
				//如果遍历到的武器为副炮，则添加进副炮数组中
				gun=wpms.get(i);
				a_guns.add(gun);
			}
			else if(wpms.get(i).getWeapon_name().getType_en().equals("S_Gun")){
				//如果遍历到的武器为特殊武器，则添加进特殊武器数组中
				gun=wpms.get(i);
				s_guns.add(gun);
			}
		}
		//获取引擎
		List<Engine_PackModel> epms=packBean.getEngineFromP(p_id);
		//获取C核心
		List<Core_PackModel> cpms=packBean.getCoreFromP(p_id);
		//获取装甲
		List<Armor_PackModel> apms=packBean.getArmorFromP(p_id);
		re.setAttribute("M_Guns", m_guns);
		re.setAttribute("A_Guns", a_guns);
		re.setAttribute("S_Guns", s_guns);
		re.setAttribute("Engines", epms);
		re.setAttribute("Cores", cpms);
		re.setAttribute("Armors", apms);
		return "game/pack/equip_pack.jsp";
	}
	
	//根据id查询战车信息，然后在前台弹窗显示用户需要查询的装备的信息
	@ResponseBody
	@RequestMapping(value="/tankMessage")
	public String tankMessage(HttpServletRequest re,Integer tank_id,String type) throws UnsupportedEncodingException{
		re.setCharacterEncoding("utf-8");
		Tank_PackModel tp=packBean.tankMessage(tank_id);
		String message=null;
		if(type.equals("chassis_name")){
			message=tp.getName()+"\n"+tp.getMessage();
		}
		re.setAttribute("tank", tp);
		return "ok";
	}
	
	//根据玩家的Id获取该玩家车库里拥有的战车
	@RequestMapping(value="/getTankFromP_Id")
	public String getTankFromId(Integer page,HttpSession se,HttpServletRequest re){
		int countPage=0;
		
		PlayModel pm=(PlayModel) se.getAttribute("play");	//获取玩家信息
		List<Tank_PackModel> tpms_d=packBean.getTankPackFromP_ID(pm.getP_id());	//根据玩家的Id获取到玩家车库中的战车
		countPage=tpms_d.size();	//玩家一共几辆战车，前台就显示几辆
		
		//这里判断用户点击上下页切换显示的战车时是否小于0或者大于车库内的最大战车数
		if(page==null||page<=0){
			page=1;
		}
		else if(page>countPage){
			page=countPage;
		}
		
		Tank_PackModel tpm=tpms_d.get(page-1);	//玩家正在查看第几辆战车的信息，然后处理这辆战车的装备数据信息
		
		re.setAttribute("countPage", countPage);
		re.setAttribute("tank", tpm);
		return "game/pack/tank_pack.jsp";
	}
	
	//将获得的战车放入装备库
	@ResponseBody
	@RequestMapping(value="/tankInPack")
	public String tankInPack(HttpSession se,int id){
		String status="ok";
		PlayModel play=(PlayModel) se.getAttribute("play");		//获取到登录的玩家
		List<Tank_PackModel> tps=packBean.getTankPackFromP_ID(play.getP_id());
		
		//先判断玩家的车库是否已满，没有满继续执行，满了返回车库已满的信息
		if(tps.size()>=play.getP_max_garage()){
			status="max_garage:error";
		}
		 
		if(status=="ok"){
		Tank_PackModel tank_PM=new Tank_PackModel();
		Tank_DataModel tank_DM=dataBean.getTankDataFromid(id);	//根据传入的战车id从战车数据库中获取到该战车的信息
		
		//设置战车基础信息
		tank_PM.setName(tank_DM.getName());		//设置名称	
		tank_PM.setChassis_skill(tank_DM.getChassis_skill());	//设置底盘特性
		tank_PM.setChassis_weight(tank_DM.getChassis_weight());		//设置底盘重量
		tank_PM.setTank_rarity(tank_DM.getTank_rarity());	//设置战车稀有度
		tank_PM.setTank_load(tank_DM.getLoad());	//设置战车载重
		tank_PM.setTank_max_load(tank_DM.getMax_load());	//设置战车最大载重
		tank_PM.setBuy(tank_DM.getBuy());	//设置战车购入价格
		tank_PM.setSell(tank_DM.getSell());	//设置战车卖出价格
		tank_PM.setMessage(tank_DM.getMessage());	//设置战车介绍信息
		tank_PM.setImg(tank_DM.getImg());	//设置战车图片
		tank_PM.setP_id(play.getP_id());	//设置战车属于的玩家 
		//设置战车基础信息完毕
		
		//装甲开始
		Armor_DataModel armor_DM=tank_DM.getArmor();
		Armor_PackModel armor_PM=new Armor_PackModel();
		//如果原战车的该位置已经存在装备，则把这件装备存到装备库中，并返回一个Id
		if(!armor_DM.getName().equals("close")&&!armor_DM.getName().equals("open")){
			armor_PM.setArmor_name(armor_DM);
			armor_PM.setA_max_hp(armor_DM.getA_max_hp());
			armor_PM.setA_hp(armor_DM.getA_hp());
			armor_PM.setA_he_def(armor_DM.getA_he_def());
			armor_PM.setA_ap_def(armor_DM.getA_ap_def());
			armor_PM.setWeight(armor_DM.getWeight());
			armor_PM.setEquipped_with(1);
			armor_PM.setP_id(play.getP_id());
			int i=packBean.armorInPack(armor_PM);
			if(i==0){
				status="armor:error";
			}
		}
		else if(armor_DM.getName().equals("open")){
			armor_PM.setId(1);
		}
		tank_PM.setArmor(armor_PM);
		//装甲结束
		
		//C核心开始
		//获取到战车的一号C核心,二号C核心信息
		Core_DataModel core_1=tank_DM.getCore_1();
		Core_DataModel core_2=tank_DM.getCore_2();

		Core_PackModel core_2_p=new Core_PackModel();
		Core_PackModel core_1_p=new Core_PackModel();
		
		//判断该战车的两个C核心上是否都有装备
		if(!core_1.getName().equals("close")&&!core_1.getName().equals("open")){
			//如果原战车该位置上有装备，则把装备放到装备库，并设置为正在使用状态
			core_1_p.setCore_name(core_1);
			core_1_p.setC_crt(core_1.getC_crt());
			core_1_p.setC_hit(core_1.getC_hit());
			core_1_p.setC_load(core_1.getC_load());
			core_1_p.setC_miss(core_1.getC_miss());
			core_1_p.setC_x_crt(core_1.getC_x_crt());
			core_1_p.setC_reload_time(core_1.getC_reload_time());
			core_1_p.setWeight(core_1.getWeight());
			core_1_p.setP_id(play.getP_id());
			core_1_p.setEquipped_with(1);
			int i=packBean.coreInPack(core_1_p);
			if(i==0){
				status="core:error";
			}
		}
		else if(core_1.getName().equals("close")){
			//如果战车的一号C核心是关闭的，则不放入新C核心，设置战车的C核心为一个预设值，0代表关闭
			core_1_p.setId(1);
		}
		else if(core_1.getName().equals("open")){
			//如果战车的一号C核心是打开的，则不放入新C核心，设置战车的C核心为一个预设值，1代表打开
			core_1_p.setId(2);
		}
		
		if(!core_2.getName().equals("close")&&!core_2.getName().equals("open")){
			//如果原战车该位置上有装备，则把装备放到装备库，并设置为正在使用状态
			core_2_p.setCore_name(core_2);
			core_2_p.setP_id(play.getP_id());
			core_2_p.setEquipped_with(1);
			int i=packBean.coreInPack(core_2_p);
			if(i==0){
				status="core:error";
			}
		}		
		else if(core_2.getName().equals("close")){
			//如果战车的二号C核心是关闭的，则不放入新C核心，设置战车的C核心为一个预设值，0代表关闭
			core_2_p.setId(1);
		}
		else if(core_2.getName().equals("open")){
			//如果战车的二号C核心是打开的，则不放入新C核心，设置战车的C核心为一个预设值，0代表打开
			core_2_p.setId(2);
		}
		tank_PM.setCore_1(core_1_p);	//将已存在装备库中的装备添加到即将放入车库的战车上
		tank_PM.setCore_2(core_2_p);	//将已存在装备库中的装备添加到即将放入车库的战车上
		//C核心添加完成
		
		//引擎相关开始
		Engine_DataModel engine_1=tank_DM.getEngine_1();
		Engine_DataModel engine_2=tank_DM.getEngine_2();
		Engine_PackModel engine_1_p=new Engine_PackModel();
		Engine_PackModel engine_2_p=new Engine_PackModel();
		//判断该战车的两个引擎上是否都有装备
		if(!engine_1.getName().equals("close")&&!engine_1.getName().equals("open")){
			engine_1_p.setE_load(engine_1.getE_load());
			engine_1_p.setWeight(engine_1.getWeight());
			engine_1_p.setEngine_name(engine_1);
			engine_1_p.setEquipped_with(1);
			engine_1_p.setP_id(play.getP_id());
			int i=packBean.engineInPack(engine_1_p);
			if(i==0){
				status="engine1:error";
			}
		}
		else if(engine_1.getName().equals("close")){
			engine_1_p.setId(1);
		}
		else if(engine_1.getName().equals("open")){
			engine_1_p.setId(2);
		}
		//二号引擎
		if(!engine_2.getName().equals("close")&&!engine_2.getName().equals("open")){
			engine_2_p.setE_load(engine_2.getE_load());
			engine_2_p.setEngine_name(engine_2);
			engine_2_p.setEquipped_with(1);
			engine_2_p.setP_id(play.getP_id());
			int i=packBean.engineInPack(engine_2_p);
			if(i==0){
				status="engine2:error";
			}
		}
		else if(engine_2.getName().equals("close")){
			engine_2_p.setId(1);
		}
		else if(engine_1.getName().equals("open")){
			engine_2_p.setId(2);
		}
		tank_PM.setEngine_1(engine_1_p);
		tank_PM.setEngine_2(engine_2_p);
		//引擎相关结束
		
		//武器相关
		Weapon_DataModel hole_1=tank_DM.getHole_1();
		Weapon_DataModel hole_2=tank_DM.getHole_2();
		Weapon_DataModel hole_3=tank_DM.getHole_3();
		Weapon_DataModel hole_4=tank_DM.getHole_4();
		Weapon_DataModel hole_5=tank_DM.getHole_5();
		Weapon_DataModel hole_6=tank_DM.getHole_6();
		
		Weapon_PackModel hole_1_p=new Weapon_PackModel();
		Weapon_PackModel hole_2_p=new Weapon_PackModel();
		Weapon_PackModel hole_3_p=new Weapon_PackModel();
		Weapon_PackModel hole_4_p=new Weapon_PackModel();
		Weapon_PackModel hole_5_p=new Weapon_PackModel();
		Weapon_PackModel hole_6_p=new Weapon_PackModel();
		//一号穴
		if(!hole_1.getName().equals("close")
				&&!hole_1.getName().equals("主炮穴")
				&&!hole_1.getName().equals("副炮穴")
				&&!hole_1.getName().equals("特殊武器穴")){
			hole_1_p.setWeapon_name(hole_1);
			hole_1_p.setW_atk(hole_1.getW_atk());
			hole_1_p.setW_crt(hole_1.getW_crt());
			hole_1_p.setW_x_crt(hole_1.getW_x_crt());
			hole_1_p.setW_hit(hole_1.getW_hit());
			hole_1_p.setW_reload_time(hole_1.getW_reload_time());
			hole_1_p.setWeight(hole_1.getWeight());
			hole_1_p.setShell_name(hole_1.getShell_name());
			hole_1_p.setShell_num(hole_1.getShell_num());
			hole_1_p.setP_id(play.getP_id());
			hole_1_p.setEquipped_with(1);
			int i=packBean.weaponInPack(hole_1_p);
			if(i==0){
				status="weaopn1:error";
			}
		}
		else if(hole_1.getName().equals("close")){
			hole_1_p.setId(1);
		}
		else if(hole_1.getName().equals("主炮穴")){
			hole_1_p.setId(2);
		}
		else if(hole_1.getName().equals("副炮穴")){
			hole_1_p.setId(3);
		}
		else if(hole_1.getName().equals("特殊武器穴")){
			hole_1_p.setId(4);
		}
		//二号穴
		if(!hole_2.getName().equals("close")				
				&&!hole_2.getName().equals("主炮穴")
				&&!hole_2.getName().equals("副炮穴")
				&&!hole_2.getName().equals("特殊武器穴")){
			hole_2_p.setWeapon_name(hole_2);
			hole_2_p.setW_atk(hole_2.getW_atk());
			hole_2_p.setW_crt(hole_2.getW_crt());
			hole_2_p.setW_x_crt(hole_2.getW_x_crt());
			hole_2_p.setW_hit(hole_2.getW_hit());
			hole_2_p.setW_reload_time(hole_2.getW_reload_time());
			hole_2_p.setWeight(hole_2.getWeight());
			hole_2_p.setShell_name(hole_2.getShell_name());
			hole_2_p.setShell_num(hole_2.getShell_num());
			hole_2_p.setP_id(play.getP_id());
			hole_2_p.setEquipped_with(1);
			int i=packBean.weaponInPack(hole_2_p);
			if(i==0){
				status="weaopn2:error";
			}
		}
		else if(hole_2.getName().equals("close")){
			hole_2_p.setId(1);
		}
		else if(hole_2.getName().equals("主炮穴")){
			hole_2_p.setId(2);
		}
		else if(hole_2.getName().equals("副炮穴")){
			hole_2_p.setId(3);
		}
		else if(hole_2.getName().equals("特殊武器穴")){
			hole_2_p.setId(4);
		}
		//三号穴
		if(!hole_3.getName().equals("close")
				&&!hole_3.getName().equals("主炮穴")
				&&!hole_3.getName().equals("副炮穴")
				&&!hole_3.getName().equals("特殊武器穴")){
			hole_3_p.setWeapon_name(hole_3);
			hole_3_p.setW_atk(hole_3.getW_atk());
			hole_3_p.setW_crt(hole_3.getW_crt());
			hole_3_p.setW_x_crt(hole_3.getW_x_crt());
			hole_3_p.setW_hit(hole_3.getW_hit());
			hole_3_p.setW_reload_time(hole_3.getW_reload_time());
			hole_3_p.setWeight(hole_3.getWeight());
			hole_3_p.setShell_name(hole_3.getShell_name());
			hole_3_p.setShell_num(hole_3.getShell_num());
			hole_3_p.setP_id(play.getP_id());
			hole_3_p.setEquipped_with(1);
			int i=packBean.weaponInPack(hole_3_p);
			if(i==0){
				status="weaopn3:error";
			}
		}
		else if(hole_3.getName().equals("close")){
			hole_3_p.setId(1);
		}
		else if(hole_3.getName().equals("主炮穴")){
			hole_3_p.setId(2);
		}
		else if(hole_3.getName().equals("副炮穴")){
			hole_3_p.setId(3);
		}
		else if(hole_3.getName().equals("特殊武器穴")){
			hole_3_p.setId(4);
		}
		//四号穴
		if(!hole_4.getName().equals("close")
				&&!hole_4.getName().equals("主炮穴")
				&&!hole_4.getName().equals("副炮穴")
				&&!hole_4.getName().equals("特殊武器穴")){
			hole_4_p.setWeapon_name(hole_4);
			hole_4_p.setW_atk(hole_4.getW_atk());
			hole_4_p.setW_crt(hole_4.getW_crt());
			hole_4_p.setW_x_crt(hole_4.getW_x_crt());
			hole_4_p.setW_hit(hole_4.getW_hit());
			hole_4_p.setW_reload_time(hole_4.getW_reload_time());
			hole_4_p.setWeight(hole_4.getWeight());
			hole_4_p.setShell_name(hole_4.getShell_name());
			hole_4_p.setShell_num(hole_4.getShell_num());
			hole_4_p.setP_id(play.getP_id());
			hole_4_p.setEquipped_with(1);
			int i=packBean.weaponInPack(hole_4_p);
			if(i==0){
				status="weaopn4:error";
			}
		}
		else if(hole_4.getName().equals("close")){
			hole_4_p.setId(1);
		}
		else if(hole_4.getName().equals("主炮穴")){
			hole_4_p.setId(2);
		}
		else if(hole_4.getName().equals("副炮穴")){
			hole_4_p.setId(3);
		}
		else if(hole_4.getName().equals("特殊武器穴")){
			hole_4_p.setId(4);
		}
		//五号穴
		if(!hole_5.getName().equals("close")
				&&!hole_5.getName().equals("主炮穴")
				&&!hole_5.getName().equals("副炮穴")
				&&!hole_5.getName().equals("特殊武器穴")){
			hole_5_p.setWeapon_name(hole_5);
			hole_5_p.setW_atk(hole_5.getW_atk());
			hole_5_p.setW_crt(hole_5.getW_crt());
			hole_5_p.setW_x_crt(hole_5.getW_x_crt());
			hole_5_p.setW_hit(hole_5.getW_hit());
			hole_5_p.setW_reload_time(hole_5.getW_reload_time());
			hole_5_p.setWeight(hole_5.getWeight());
			hole_5_p.setShell_name(hole_5.getShell_name());
			hole_5_p.setShell_num(hole_5.getShell_num());
			hole_5_p.setP_id(play.getP_id());
			hole_5_p.setEquipped_with(1);
			int i=packBean.weaponInPack(hole_5_p);
			if(i==0){
				status="weaopn5:error";
			}
		}
		else if(hole_5.getName().equals("close")){
			hole_5_p.setId(1);
		}
		else if(hole_5.getName().equals("主炮穴")){
			hole_5_p.setId(2);
		}
		else if(hole_5.getName().equals("副炮穴")){
			hole_5_p.setId(3);
		}
		else if(hole_5.getName().equals("特殊武器穴")){
			hole_5_p.setId(4);
		}
		//六号穴
		if(!hole_6.getName().equals("close")
				&&!hole_6.getName().equals("主炮穴")
				&&!hole_6.getName().equals("副炮穴")
				&&!hole_6.getName().equals("特殊武器穴")){
			hole_6_p.setWeapon_name(hole_6);
			hole_6_p.setW_atk(hole_6.getW_atk());
			hole_6_p.setW_crt(hole_6.getW_crt());
			hole_6_p.setW_x_crt(hole_6.getW_x_crt());
			hole_6_p.setW_hit(hole_6.getW_hit());
			hole_6_p.setW_reload_time(hole_6.getW_reload_time());
			hole_6_p.setWeight(hole_6.getWeight());
			hole_6_p.setShell_name(hole_6.getShell_name());
			hole_6_p.setShell_num(hole_6.getShell_num());
			hole_6_p.setP_id(play.getP_id());
			hole_6_p.setEquipped_with(1);
			int i=packBean.weaponInPack(hole_6_p);
			if(i==0){
				status="weaopn6:error";
			}
		}
		else if(hole_6.getName().equals("close")){
			hole_6_p.setId(1);
		}
		else if(hole_6.getName().equals("主炮穴")){
			hole_6_p.setId(2);
		}
		else if(hole_6.getName().equals("副炮穴")){
			hole_1_p.setId(3);
		}
		else if(hole_6.getName().equals("特殊武器穴")){
			hole_1_p.setId(4);
		}
		tank_PM.setHole_1(hole_1_p);
		tank_PM.setHole_2(hole_2_p);
		tank_PM.setHole_3(hole_3_p);
		tank_PM.setHole_4(hole_4_p);
		tank_PM.setHole_5(hole_5_p);
		tank_PM.setHole_6(hole_6_p);
		//武器相关结束
		//将战车放入车库
		packBean.tankInPack(tank_PM);
		}
		return status;
	}
	
	//卸载装备放到装备库中
	@RequestMapping(value="/UnloanEquip")
	public int UnloadEquip(String type,int equip_id,int tank_id){
		int status=packBean.UnloadEquip(type, equip_id, tank_id);
		return status;
	}
}
