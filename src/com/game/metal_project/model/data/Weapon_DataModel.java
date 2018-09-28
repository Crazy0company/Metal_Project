package com.game.metal_project.model.data;

public class Weapon_DataModel {
	private int id;
	private String name;
	private String type_ch;
	private String type_en;
	private RarityModel rarity;
	private Shell_DataModel shell_name;		//武器携带的弹药类型
	private int w_range;	//武器射程
	private int w_atk;	//武器攻击
	private int w_atk_num;	//武器攻击次数
	private int w_intercept;	//武器是否能迎击
	private float w_hit;	//武器命中
	private float w_crt;	//武器普通暴击
	private float w_x_crt;	//武器超暴击
	private float w_reload_time;	//武器装填速度 
	private int shell_num;	//武器目前的弹药数量
	private int max_shell_num;	//武器最大携弹量
	private int weight;	//重量
	private int buy;
	private int sell;
	private String message;
	
	public Shell_DataModel getShell_name() {
		return shell_name;
	}
	public void setShell_name(Shell_DataModel shell_name) {
		this.shell_name = shell_name;
	}
	public int getShell_num() {
		return shell_num;
	}
	public void setShell_num(int shell_num) {
		this.shell_num = shell_num;
	}
	public int getMax_shell_num() {
		return max_shell_num;
	}
	public void setMax_shell_num(int max_shell_num) {
		this.max_shell_num = max_shell_num;
	}
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
	public int getW_atk() {
		return w_atk;
	}
	public void setW_atk(int w_atk) {
		this.w_atk = w_atk;
	}
	public int getW_atk_num() {
		return w_atk_num;
	}
	public void setW_atk_num(int w_atk_num) {
		this.w_atk_num = w_atk_num;
	}
	public int getW_intercept() {
		return w_intercept;
	}
	public void setW_intercept(int w_intercept) {
		this.w_intercept = w_intercept;
	}
	public float getW_hit() {
		return w_hit;
	}
	public void setW_hit(float w_hit) {
		this.w_hit = w_hit;
	}
	public float getW_crt() {
		return w_crt;
	}
	public void setW_crt(float w_crt) {
		this.w_crt = w_crt;
	}
	public float getW_x_crt() {
		return w_x_crt;
	}
	public void setW_x_crt(float w_x_crt) {
		this.w_x_crt = w_x_crt;
	}
	public float getW_reload_time() {
		return w_reload_time;
	}
	public void setW_reload_time(float w_reload_time) {
		this.w_reload_time = w_reload_time;
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
	public int getW_range() {
		return w_range;
	}
	public void setW_range(int w_range) {
		this.w_range = w_range;
	}
	
}