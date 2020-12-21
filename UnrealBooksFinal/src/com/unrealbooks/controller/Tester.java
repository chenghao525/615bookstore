
import com.unrealbooks.model.*;
import com.unrealbooks.controller.*;
import com.unrealbooks.database.*;

public class Tester
{
	public static void main(String[] args)
	{
		/*
		BookstoreController controller = new BookstoreController();
		BookstorePersistImpl persist = new BookstorePersistImpl();
		controller.createUser(0, User.Type.CUSTOMER, "Vic Carter",
					"password", 478, "505 Riverside",
					User.Status.WAITING, "vic@gmail.com");
		*/
		System.out.println(Util.generateRandomString(16));
	}
}
