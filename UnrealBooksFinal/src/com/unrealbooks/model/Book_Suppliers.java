
public class Book_Suppliers {
    private String name;
    private int company_id;
    private String address;
    private String phone_number;
    private String contactname;
    private String email;
    private String businessphone;
    private String cellphone;
    public String getAddress(){return address;    }
    public void setAddress(String add){address=add;}
    public String getPhone_Number() {return phone_number;}
    public void setPhone_Number(String num){phone_number=num;}
    public String getContactname(){return contactname;}
    public void setContactname(String n){contactname=n;}
    public String getEmail(){return email;}
    public void setEmail(String e){email=e;}
    public String getBusinessphone(){return businessphone;}
    public void setBusinessphone(String b){businessphone=b;}
    public String getCellphone(){return cellphone;}
    public void setCellphone(String c){cellphone=c;}

    public String getName(){
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
    
public Book_Suppliers(String n, int a, String add, String phonenum, String cn, String em, String bp, String cp)
{
    name=n;
    company_id=a;
    address=add;
    phone_number=phonenum;
    contactname=cn;
    email=em;
    businessphone=bp;
    cellphone=cp;
    
}
}
