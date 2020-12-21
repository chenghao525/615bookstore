package com.unrealbooks.model;

import java.util.*;


public class Payment {

	public enum Type {
	CREDIT, DEBIT
	}
	
	private int customer_id;
	private String card_num;
	private int cvv;
	private String billing_address;
	private String expiration_date;
	private Type type;

	public Payment()
	{
		customer_id=0;
		card_num=null;
		billing_address=null;
		type=null;
		expiration_date=null;
		type = null;
		this.cvv = 0;
	}
	
	public Payment(int a, String b, String c, Type d, String e, int cvv)
	{
		customer_id=a;
		card_num=b;
		billing_address=c;
		type=d;
		expiration_date=e;
		type = Type.CREDIT;
		this.cvv = cvv;
	}
	
	public String getExpiration_Date() {
		return expiration_date;
	}
	public void setExpiration_Date(String a){
		expiration_date=a;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getBilling_address() {
		return billing_address;
	}
	public void setBilling_address(String billing_address) {
		this.billing_address = billing_address;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}

	public void setCVV(int cvv)
	{
		this.cvv = cvv;
	}
	
	public int getCVV()
	{
		return cvv;
	}
}

