package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Chassis_Skill_DataModel;
import com.game.metal_project.model.data.RarityModel;

public class Tank_PackModel {
	private int id;
	private RarityModel tank_rarity;	//战车稀有度
	private String name;	//战车名字（可自定义 ）
	private Chassis_Skill_DataModel chassis_skill;	//战车底盘特性
	private int chassis_weight;	//战车底盘重量
	private float tank_load;		//战车目前重量
	private float tank_max_load;		//战车最大载重
	private Armor_PackModel armor;
	private Core_PackModel core_1;
	private Core_PackModel core_2;
	private Engine_PackModel engine_1;
	private Engine_PackModel engine_2;
	private Weapon_PackModel hole_1;
	private Weapon_PackModel hole_2;
	private Weapon_PackModel hole_3;
	private Weapon_PackModel hole_4;
	private Weapon_PackModel hole_5;
	private Weapon_PackModel hole_6;
	private int buy;
	private int sell;
	private String message;
	private String img;
	private int p_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public RarityModel getTank_rarity() {
		return tank_rarity;
	}
	public void setTank_rarity(RarityModel tank_rarity) {
		this.tank_rarity = tank_rarity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Chassis_Skill_DataModel getChassis_skill() {
		return chassis_skill;
	}
	public void setChassis_skill(Chassis_Skill_DataModel chassis_skill) {
		this.chassis_skill = chassis_skill;
	}
	public int getChassis_weight() {
		return chassis_weight;
	}
	public void setChassis_weight(int chassis_weight) {
		this.chassis_weight = chassis_weight;
	}
	public float getTank_load() {
		return tank_load;
	}
	public void setTank_load(float tank_load) {
		this.tank_load = tank_load;
	}
	public float getTank_max_load() {
		return tank_max_load;
	}
	public void setTank_max_load(float tank_max_load) {
		this.tank_max_load = tank_max_load;
	}
	public Armor_PackModel getArmor() {
		return armor;
	}
	public void setArmor(Armor_PackModel armor) {
		this.armor = armor;
	}
	public Core_PackModel getCore_1() {
		return core_1;
	}
	public void setCore_1(Core_PackModel core_1) {
		this.core_1 = core_1;
	}
	public Core_PackModel getCore_2() {
		return core_2;
	}
	public void setCore_2(Core_PackModel core_2) {
		this.core_2 = core_2;
	}
	public Engine_PackModel getEngine_1() {
		return engine_1;
	}
	public void setEngine_1(Engine_PackModel engine_1) {
		this.engine_1 = engine_1;
	}
	public Engine_PackModel getEngine_2() {
		return engine_2;
	}
	public void setEngine_2(Engine_PackModel engine_2) {
		this.engine_2 = engine_2;
	}
	public Weapon_PackModel getHole_1() {
		return hole_1;
	}
	public void setHole_1(Weapon_PackModel hole_1) {
		this.hole_1 = hole_1;
	}
	public Weapon_PackModel getHole_2() {
		return hole_2;
	}
	public void setHole_2(Weapon_PackModel hole_2) {
		this.hole_2 = hole_2;
	}
	public Weapon_PackModel getHole_3() {
		return hole_3;
	}
	public void setHole_3(Weapon_PackModel hole_3) {
		this.hole_3 = hole_3;
	}
	public Weapon_PackModel getHole_4() {
		return hole_4;
	}
	public void setHole_4(Weapon_PackModel hole_4) {
		this.hole_4 = hole_4;
	}
	public Weapon_PackModel getHole_5() {
		return hole_5;
	}
	public void setHole_5(Weapon_PackModel hole_5) {
		this.hole_5 = hole_5;
	}
	public Weapon_PackModel getHole_6() {
		return hole_6;
	}
	public void setHole_6(Weapon_PackModel hole_6) {
		this.hole_6 = hole_6;
	}
	public int getBuy() {
		return buy;
	}
	public void setBuy(int buy) {
		this.buy = buy;
	}
	public int getSell() {
		return sell;
	}
	public void setSell(int sell) {
		this.sell = sell;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}