package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Armor_DataModel;

public class Armor_PackModel {
	private int id;
	private Armor_DataModel armor_name;
	private int sp;		//携带的装甲片
	private int a_max_hp;	//装甲最大耐久
	private int a_hp;	//装甲现在的血量
	private int a_he_def;	//装甲对于高爆类型攻击的防御
	private int a_ap_def;	//装甲对于穿甲类型攻击的防御
	private int weight;	//装甲重量
	private int p_id;	//属于哪个玩家 
	private int equipped_with;	//是否正在使用着
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Armor_DataModel getArmor_name() {
		return armor_name;
	}
	public void setArmor_name(Armor_DataModel armor_name) {
		this.armor_name = armor_name;
	}
	public int getSp() {
		return sp;
	}
	public void setSp(int sp) {
		this.sp = sp;
	}
	public int getA_he_def() {
		return a_he_def;
	}
	public void setA_he_def(int a_he_def) {
		this.a_he_def = a_he_def;
	}
	public int getA_ap_def() {
		return a_ap_def;
	}
	public void setA_ap_def(int a_ap_def) {
		this.a_ap_def = a_ap_def;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getA_max_hp() {
		return a_max_hp;
	}
	public void setA_max_hp(int a_max_hp) {
		this.a_max_hp = a_max_hp;
	}
	public int getA_hp() {
		return a_hp;
	}
	public void setA_hp(int a_hp) {
		this.a_hp = a_hp;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getEquipped_with() {
		return equipped_with;
	}
	public void setEquipped_with(int equipped_with) {
		this.equipped_with = equipped_with;
	}
}