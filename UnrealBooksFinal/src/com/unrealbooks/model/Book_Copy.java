
public class Book_Copy {
	private String ISBN;
	private int serial_num;
	
	public Book_Copy(String I, int s)
	{
		ISBN =I;
		serial_num=s;
	}
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(int serial_num) {
		this.serial_num = serial_num;
	}

}
