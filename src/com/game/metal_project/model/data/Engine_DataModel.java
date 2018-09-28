package com.game.metal_project.model.data;

public class Engine_DataModel {
	private int id;		//id
	private String name;		//名称
	private String type_ch;		//类型中文名
	private String type_en;		//类型英文名
	private RarityModel rarity;		//稀有度
	private int e_load;	//载重
	private int weight;	//重量
	private int buy;	//购入价格
	private int sell;	//卖出价格
	private String message;		//介绍
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public int getE_load() {
		return e_load;
	}
	public void setE_load(int e_load) {
		this.e_load = e_load;
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
