package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Core_DataModel;

public class Core_PackModel {
	private int id;
	private Core_DataModel core_name;
	private float c_reload_time;	//装填时间
	private float c_hit;	//命中率
	private float c_miss;	//闪避
	private float c_crt;	//普通暴击率
	private float c_x_crt;	//超暴击率
	private float c_load;	//加成的引擎载重量
	private int weight;	//重量
	private int p_id;	//属于哪个玩家 
	private int equipped_with;	//是否正在使用着
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Core_DataModel getCore_name() {
		return core_name;
	}
	public void setCore_name(Core_DataModel core_name) {
		this.core_name = core_name;
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
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
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
