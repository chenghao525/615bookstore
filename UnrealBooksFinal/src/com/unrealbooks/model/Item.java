package com.unrealbooks.model;

public class Item {
	private String ID;
	private String category;
	private String Company;
	private String Name;
	private String cover;
	private int inventory_amt;
	private int threshold;
	private double price;

	public Item()
	{
		ID = null;
		category = null;
		Company = null;
		Name = null;
		cover = null;
		inventory_amt = 0;
		threshold = 0;
		price = 0;

	}

	public Item(String I, String c, String a, String t, String C, int A, int T, double P)
	{
		ID=I;
		category=c;
		Company=a;
		Name=t;
		cover=C;
		inventory_amt=A;
		threshold=T;
		price=P;
	}

	public void UpdateQuantity(int i)
	{
		inventory_amt=i;
	}


	public String getID() {
		return ID;
	}
	public void setID(String iSBN) {
		ID = iSBN;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCompany() {
		return Company;
	}
	public void setCompany(String authors) {
		this.Company = authors;
	}
	public String getName() {
		return Name;
	}
	public void setName(String title) {
		this.Name = title;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public int getInventory_amt() {
		return inventory_amt;
	}
	public void setInventory_amt(int inventory_amt) {
		this.inventory_amt = inventory_amt;
	}
	public int getThreshold() {
		return threshold;
	}
	public void setThreshold(int threshold) {
		this.threshold = threshold;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public boolean equals(Object o)
	{
		Item b = (Item) o;
		if(ID.equals(b.getID()))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

