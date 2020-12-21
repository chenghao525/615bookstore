
public class Supplied_by {

	private int company_id;
	private String ISBN;
	public Supplied_by(int a, String b)
	{
		company_id=a;
		ISBN=b;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
}
