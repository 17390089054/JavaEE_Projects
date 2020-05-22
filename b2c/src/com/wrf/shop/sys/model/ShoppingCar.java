package com.wrf.shop.sys.model;

import java.util.List;

/**
 @ClassName ShoppingCar
 * @Description (商品购物车)
 * @Author invincible
 * @Date 2018年3月21日 下午9:06:27
 */
public class ShoppingCar {
	
	List<Goods>shopList;

	public List<Goods> getShopList() {
		return shopList;
	}

	public void setShopList(List<Goods> shopList) {
		this.shopList = shopList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShoppingCar [shopList=");
		builder.append(shopList);
		builder.append("]");
		return builder.toString();
	}

}
