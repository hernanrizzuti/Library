package com.fdm.model;

public class Order {
	Payment payment;
	Address deliveryAddress;
	Basket basket;
	OrderStatus status;
	String orderplaced;
	
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public Address getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(Address deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public Basket getBasket() {
		return basket;
	}
	public void setBasket(Basket basket) {
		this.basket = basket;
	}
	public OrderStatus getStatus() {
		return status;
	}
	public void setStatus(OrderStatus status) {
		this.status = status;
	}
	public String getOrderplaced() {
		return orderplaced;
	}
	public void setOrderplaced(String orderplaced) {
		this.orderplaced = orderplaced;
	}
}
