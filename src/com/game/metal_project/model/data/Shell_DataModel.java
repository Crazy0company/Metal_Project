package com.game.metal_project.model.data;

public class Shell_DataModel {
	private int id;
	private String w_type;	//对应的武器种类
	private String name_ch; //炮弹的中文名
	private String name_en;	//炮弹的中文名
	private RarityModel rarity;
	private float shell_he;	//炮弹杀伤
	private float shell_ap;		//炮弹穿透力
	private int weight;	//每发炮弹的重量
	private int buy;
	private int sell;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getW_type() {
		return w_type;
	}
	public void setW_type(String w_type) {
		this.w_type = w_type;
	}
	public String getName_ch() {
		return name_ch;
	}
	public void setName_ch(String name_ch) {
		this.name_ch = name_ch;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public RarityModel getRarity() {
		return rarity;
	}
	public void setRarity(RarityModel rarity) {
		this.rarity = rarity;
	}
	public float getShell_he() {
		return shell_he;
	}
	public void setShell_he(float shell_he) {
		this.shell_he = shell_he;
	}
	public float getShell_ap() {
		return shell_ap;
	}
	public void setShell_ap(float shell_ap) {
		this.shell_ap = shell_ap;
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
	
}
