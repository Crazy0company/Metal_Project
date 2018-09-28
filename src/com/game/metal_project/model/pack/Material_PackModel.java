package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Material_DataModel;

public class Material_PackModel {
	private int id;
	private Material_DataModel material_name;	//材料名称	
	private int p_id;	//属于哪个玩家 
	private int num;	//材料数量
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Material_DataModel getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(Material_DataModel material_name) {
		this.material_name = material_name;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}