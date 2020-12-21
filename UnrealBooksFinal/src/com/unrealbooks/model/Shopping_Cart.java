package com.unrealbooks.model;

public class Shopping_Cart {
	private int customer_id;
	private double price;
	private int cart_id;

	public Shopping_Cart()
	{
		customer_id=0;
		price=0;
		cart_id=0;
	}
	
	public Shopping_Cart(int a, double b, int c)
	{
		customer_id=a;
		price=b;
		cart_id=c;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	
	public void clear()
	{
		price=0;
	}
	
	
}
