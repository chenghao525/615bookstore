package com.unrealbooks.model;

public class User
{
	public enum Type
	{
		CUSTOMER, ADMIN, BUSINESS, SHIPPING
	} 
	
	public enum Status
	{
		ACTIVE, WAITING, SUSPENDED
	}

	public enum Subscribed
	{
		YES, NO
	}

	private int userid;
	private Type type;
	private String name;
	private String password;
	private int phoneNumber;
	private String address;
	private Status status;
	private String email;
	private String verificationCode;
	private Subscribed subscribed;

	public User()
	{
		this.userid = -1;
		this.type = null;
		this.name = null;
		this.password = null;
		this.phoneNumber = -1;
		this.address = null;
		this.status = null; 
		this.email = null;
		this.verificationCode = null;
		this.subscribed = null;
	}

	public User(int userid, Type type, String name,
			String password, int phoneNumber,
			String address, Status status, 
			String email, String verificationCode, Subscribed subscribed)
	{
		this.userid = userid;
		this.type = type;
		this.name = name;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.status = status;
		this.email = email;
		this.verificationCode = verificationCode;
		this.subscribed = subscribed;
	}

	public void setUserId(int userid)
	{
		this.userid = userid;
	}

	public int getUserId()
	{
		return userid;
	}

	
	public void setType(Type type)
	{
		this.type = type;
	}

	public Type getType()
	{
		return type;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPhoneNumber(int phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}

	public int getPhoneNumber()
	{
		return phoneNumber;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getAddress()
	{
		return address;
	}

	public void setStatus(Status status)
	{
		this.status = status;
	}

	public Status getStatus()
	{
		return status;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getEmail()
	{
		return email;
	}

	public void setVerificationCode(String verificationCode)
	{
		this.verificationCode = verificationCode;
	}

	public String getVerificationCode()
	{
		return verificationCode;
	}

	public void setSubscribed(Subscribed subscribed)
	{
		this.subscribed = subscribed;
	}

	public Subscribed getSubscribed()
	{
		return subscribed;
	}

}
