package com.unrealbooks.model;


public class Supplier {
    private String name;
    private int company_id;
    private String contactname;
    private String address;
    private String email;
    private String businessphone;
    private String cellphone;
    private String phone_number;

    public String getContactname(){return contactname;}
    public String getAddress(){return address;}
    public String getEmail(){return email;}
    public String getBusinessphone(){return businessphone;}
    public String getCellphone(){return cellphone;}
    public String getPhone_Number(){return phone_number;}

    public void setContactname(String c){contactname=c;}
    public void setAddress(String s){address=s;}
    public void setEmail(String e){email=e;}
    public void setBusinessphone(String b){businessphone=b;}
    public void setCellphone(String c){cellphone=c;}
    public void setPhone_Number(String p){phone_number=p;}
    

    
    public Supplier(String n, int i, String add, String pn, String cn, String em, String cp, String bp)
    {
	name=n;
	company_id=i;
	address=add;
	phone_number=pn;
	contactname=cn;
	email=em;
	cellphone=cp;
	businessphone=bp;
    }
    public String getName() {
	return name;
    }
    public void setName(String name) {
	this.name = name;
	}
    public int getCompany_id() {
	return company_id;
    }
    public void setCompany_id(int company_id) {
	this.company_id = company_id;
    }
    
	
}
