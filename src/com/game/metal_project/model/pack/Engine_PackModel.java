package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Engine_DataModel;

public class Engine_PackModel {
	private int id;		//id
	private Engine_DataModel engine_name;		//名称
	private int e_load;	//载重量
	private int weight;		//重量
	private int p_id;	//属于哪个玩家 
	private int equipped_with;	//是否正在使用着
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Engine_DataModel getEngine_name() {
		return engine_name;
	}
	public void setEngine_name(Engine_DataModel engine_name) {
		this.engine_name = engine_name;
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
