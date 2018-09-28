package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Shell_DataModel;
import com.game.metal_project.model.data.Weapon_DataModel;

public class Weapon_PackModel {
	private int id;
	private Weapon_DataModel weapon_name;
	private int w_atk;	//武器攻击
	private float w_hit;	//武器命中
	private float w_crt;	//武器普通暴击
	private float w_x_crt;	//武器超暴击
	private float w_reload_time;	//武器装填速度 
	private int weight;	//重量
	private Shell_DataModel shell_name;		//武器携带的弹药类型
	private int shell_num;
	private int p_id;	//属于哪个玩家 
	private int equipped_with;	//是否正在使用着
	
	public Weapon_DataModel getWeapon_name() {
		return weapon_name;
	}
	public void setWeapon_name(Weapon_DataModel weapon_name) {
		this.weapon_name = weapon_name;
	}
	public int getW_atk() {
		return w_atk;
	}
	public void setW_atk(int w_atk) {
		this.w_atk = w_atk;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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