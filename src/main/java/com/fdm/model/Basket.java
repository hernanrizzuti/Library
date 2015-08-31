package com.fdm.model;

import java.math.BigDecimal;
import java.util.Map;

public class Basket {

	private Map<String, BigDecimal> price;
	private Map<String, Integer> quantity;
	private BigDecimal priceTotal;
	private int itemTotal;

	public Basket(Map<String, BigDecimal> price, Map<String, Integer> quantity,
			BigDecimal priceTotal, int itemTotal) {
		this.price = price;
		this.quantity = quantity;
		this.priceTotal = priceTotal;
		this.itemTotal = itemTotal;
	}

	public Map<String, BigDecimal> getPrice() {
		return price;
	}

	public void setPrice(Map<String, BigDecimal> price) {
		this.price = price;
	}

	public Map<String, Integer> getQuantity() {
		return quantity;
	}

	public void setQuantity(Map<String, Integer> quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPriceTotal() {
		return priceTotal;
	}

	public void setPriceTotal(BigDecimal priceTotal) {
		this.priceTotal = priceTotal;
	}

	public int getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(int itemTotal) {
		this.itemTotal = itemTotal;
	}

	@Override
	public String toString() {
		return "Basket [price=" + price + ", quantity=" + quantity
				+ ", priceTotal=" + priceTotal + ", itemTotal=" + itemTotal
				+ "]";
	}
}