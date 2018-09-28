package com.game.metal_project.model.data;

public class Core_DataModel {
	private int id;
	private String name;
	private String type_ch;
	private String type_en;
	private RarityModel rarity;
	private float c_reload_time;	//装填时间
	private float c_hit;	//命中率
	private float c_miss;	//闪避
	private float c_crt;	//普通暴击率
	private float c_x_crt;	//超暴击率
	private float c_load;	//加成的引擎载重量
	private String c_intercept;	//该C核心是否有迎击功能
	private int weight;	//重量
	private int buy;	
	private int sell;
	private String message;
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
	public float getC_reload_time() {
		return c_reload_time;
	}
	public void setC_reload_time(float c_reload_time) {
		this.c_reload_time = c_reload_time;
	}
	public float getC_hit() {
		return c_hit;
	}
	public void setC_hit(float c_hit) {
		this.c_hit = c_hit;
	}
	public float getC_miss() {
		return c_miss;
	}
	public void setC_miss(float c_miss) {
		this.c_miss = c_miss;
	}
	public float getC_crt() {
		return c_crt;
	}
	public void setC_crt(float c_crt) {
		this.c_crt = c_crt;
	}
	public float getC_x_crt() {
		return c_x_crt;
	}
	public void setC_x_crt(float c_x_crt) {
		this.c_x_crt = c_x_crt;
	}
	public float getC_load() {
		return c_load;
	}
	public void setC_load(float c_load) {
		this.c_load = c_load;
	}
	public String getC_intercept() {
		return c_intercept;
	}
	public void setC_intercept(String c_intercept) {
		this.c_intercept = c_intercept;
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
