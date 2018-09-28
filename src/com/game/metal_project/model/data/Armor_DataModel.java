package com.game.metal_project.model.data;

public class Armor_DataModel {
	private Integer id;
	private String name;	//装备名字
	private String type_ch;	//装备类型的中文名
	private String type_en;	//装备类型的英文名
	private RarityModel rarity;	//装备稀有度
	private int a_he_def;	//装甲对于高爆类型攻击的防御
	private int a_ap_def;	//装甲对于穿甲类型攻击的防御
	private int a_max_hp;	//装甲最大的耐久
	private int a_hp;		//装甲血量
	private int a_re_hp;	//装甲每回合回复的耐久
	private int a_re_cost;	//基础修理费用，装甲损耗在10%以内就按照这个费用修理，每损失10%，费用增加25%
	private int weight;	//装甲重量
	private int buy;	//购买价格
	private int sell;	//卖出价格
	private String message;	//信息
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType_ch() {
		return type_ch;
	}
	public void setType_ch(String type_ch) {
		this.type_ch = type_ch;
	}
	public String getType_en() {
		return type_en;
	}
	public void setType_en(String type_en) {
		this.type_en = type_en;
	}
	public RarityModel getRarity() {
		return rarity;
	}
	public void setRarity(RarityModel rarity) {
		this.rarity = rarity;
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
	public int getA_re_hp() {
		return a_re_hp;
	}
	public void setA_re_hp(int a_re_hp) {
		this.a_re_hp = a_re_hp;
	}
	public int getA_re_cost() {
		return a_re_cost;
	}
	public void setA_re_cost(int a_re_cost) {
		this.a_re_cost = a_re_cost;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
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

}