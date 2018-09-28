package com.game.metal_project.model.pack;

import com.game.metal_project.model.data.Shell_DataModel;

public class Shell_PackModel {
	private int id;
	private Shell_DataModel shell_name; //炮弹的中文名
	private int p_id;
	private int num;
	
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
