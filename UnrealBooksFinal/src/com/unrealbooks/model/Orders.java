package com.unrealbooks.model;

import java.util.*;
import java.sql.*;

public class Orders {

	private int transaction_number;
	private java.sql.Date order_date;
	private double finalPrice;
	private int userid;
	private Timestamp time;

	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getTransaction_number() {
		return transaction_number;
	}
	public void setTransaction_number(int transaction_number) {
		this.transaction_number = transaction_number;
	}
	public java.sql.Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(java.sql.Date order_date) {
		this.order_date = order_date;
	}

	public void setUserId(int userid)
	{
		this.userid = userid;
	}

	public int getUserId()
	{
		return userid;
	}

	public void setTime(Timestamp time)
	{
		this.time = time;
	}

	public Timestamp getTime()
	{
		return time;
	}

	public void setFinalPrice(double finalPrice)
	{
		this.finalPrice = finalPrice;
	}

	public double getFinalPrice()
	{
		return finalPrice;
	}

}

