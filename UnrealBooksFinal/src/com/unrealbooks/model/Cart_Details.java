package com.unrealbooks.model;

public class Cart_Details {

	private int cart_id;
	private String isbn;
	private int qty;

	public Cart_Details()
	{
		cart_id= 0;
		isbn= null;
		qty = 0;
	}

	public Cart_Details(int i, String isbn, int qty)
	{
		cart_id=i;
		this.isbn=isbn;
		this.qty = qty;
	}

	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getISBN() {
		return isbn;
	}
	public void setISBN(String isbn) {
		this.isbn = isbn;
	}
	
	public int getQty()
	{
		return qty;
	}

	public void setQty(int qty)
	{
		this.qty = qty;
	}
	
}

