package com.game.metal_project.model.data;

public class Material_DataModel {
	private int id;
	private String name;
	private String type_ch;
	private String type_en;
	private RarityModel rarity;
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