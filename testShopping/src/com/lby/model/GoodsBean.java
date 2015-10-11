package com.lby.model;

public class GoodsBean {
	private String goodsId;
	private String goodsName;
	private String goodsInfo;
	private float goodsPrice;
	private int goodsNum;
	private String Publisher;
	private String photo;
	private String type;
	private int clickNum;
	
	public int getClickNum() {
		return clickNum;
	}
	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsInfo() {
		return goodsInfo;
	}
	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
