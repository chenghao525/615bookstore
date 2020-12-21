package com.unrealbooks.model;


public class Shipping_Info {
	public enum Status{
	SHIPPED, DELIVERED, PROCESSING
}
	private String tracking_number;
	private int transaction_number;
	private Status status;
	private int agency_id;

	public Shipping_Info(String t, int a, Status b, int i)
	{
		tracking_number=t;
		transaction_number=a;
		status=b;
		agency_id=i;
	}
	
	public String getTracking_number() {
		return tracking_number;
	}
	public void setTracking_number(String tracking_number) {
		this.tracking_number = tracking_number;
	}
	public int getTransaction_number() {
		return transaction_number;
	}
	public void setTransaction_number(int transaction_number) {
		this.transaction_number = transaction_number;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public int getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(int agency_id) {
		this.agency_id = agency_id;
	}
}		
