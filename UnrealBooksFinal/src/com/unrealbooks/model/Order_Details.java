package com.unrealbooks.model;

public class Order_Details {
	private int transaction_number;
	private String isbn;
	private int qty;

	public Order_Details()
	{
		transaction_number=0;
		isbn = null;
		this.qty = 0;
	}
	
	public Order_Details(int a, String b, int qty)
	{
		transaction_number=a;
		isbn=b;
		this.qty = qty;
	}
	public int getTransaction_number() {
		return transaction_number;
	}
	public void setTransaction_number(int transaction_number) {
		this.transaction_number = transaction_number;
	}
	public String getISBN() {
		return isbn;
	}
	public void setISBN(String isbn) {
		this.isbn = isbn;
	}

	public void setQty(int qty)
	{
		this.qty = qty;
	}

	public int getQty()
	{
		return qty;
	}
	
	
	
}
