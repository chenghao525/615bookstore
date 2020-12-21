package com.unrealbooks.model;

import java.util.*;
public class Promotion {
	private String promotion_code;
	private Date exp_date;
	int value;

	public Promotion()
	{
		promotion_code=null;
		exp_date= null;
		this.value = 0;

	}
	
	public Promotion(String a, Date e, int value)
	{
		promotion_code=a;
		exp_date=e;
		this.value = value;
	}
	public String getPromotion_code() {
		return promotion_code;
	}
	public void setPromotion_code(String promotion_code) {
		this.promotion_code = promotion_code;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		this.exp_date = exp_date;
	}
	
	public Promotion createPromotion(String a, Date e, int value)
	{
		return new Promotion(a,e, value);
	}

	public void setValue(int value)
	{
		this.value = value;

	}

	public int getValue()
	{
		return value;
	}
}
