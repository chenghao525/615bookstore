package com.unrealbooks.database;

import java.sql.*;
import java.util.*;
import com.unrealbooks.model.*;
import com.unrealbooks.controller.*;
import java.io.*;
import java.security.*;
import javax.servlet.*;
import javax.xml.bind.DatatypeConverter;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import javax.mail.*;
import javax.mail.internet.*;

public class BookstorePersistImpl
{
	private Connection con = DatabaseAccess.getConnection();
	private PreparedStatement ps;
	private String createUser = "insert into user values(" +
				"?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private String retrieveUser = "select * from user where email = ?";
	private String activateUser = "update user set status='active' where userid = ?";
	private String resetPassword = "update user set password=? where email=? ";
	private String searchItem = "select * from Item where Name like ?";
	private String searchCompany = "select * from Item where Company like ?";
	private String searchCategory = "select * from Item where category like ?";
	private String searchID = "select * from Item where ID like ?";
	private String createCart = "insert into shopping_cart values(?, ?, ?)";
	private String retrieveShoppingCart = "select * from shopping_cart where customer_id = ?";
	private String addToCart = "insert into cart_details values(?, ?, ?)";
	private String checkCart = "select * from cart_details where cart_id = ? and ID = ?";
	private String updateCart = "update cart_details set qty = ? where cart_id = ? and ID = ?";
	private String checkCartQty = "select * from cart_details where cart_id = ?";
	private String retrieveItemPrice = "select * from Item where ID = ?";
	private String updatePrice = "update shopping_cart set price = ? where cart_id = ?";
	private String displayCart = "select * from cart_details, Item " +
					"where cart_details.cart_id = ? " +
					"and cart_details.isbn = Item.ID";
	private String updateCartItem = "update cart_details set qty = ? where cart_id = ? and isbn = ?";
	private String deleteCartItem = "delete from cart_details where cart_id = ? and isbn = ?";
	private String createPayment = "insert into payment values(?, ?, ?, ?, ?, ?)";
	private String retrievePayment = "select * from payment where customer_id = ?";
	private String createOrder = "insert into orders values(?, ? , ?, ?, ?)";
	private String initialRetrieveOrder = "select * from orders where userid = ? and time = ?";
	private String retrieveCartItems = "select * from cart_details where cart_id = ?";
	private String createOrderDetailsItem = "insert into order_details values(?, ? ,?)";
	private String clearCart = "delete from cart_details where cart_id = ?";
	private String retrieveOrders = "select * from orders where userid = ?";
	private String retrieveOrderDetails = "select * from order_details where transaction_number = ?";


	private String updateUsername="update user set name=? where userid=?";
    private String updateUserpassword="update user set password=? where userid=?";
    private String updateUserphonenum="update user set phone_number=? where userid=?";
    private String updateUseraddress="update user set address=? where userid=?";
    private String updateUserstatus="update user set status=? where userid=?";
    private String updateUseremail="update user set email=? where userid=?";
    private String updateUsertype="update user set type=? where userid=?";
    private String deleteUser="delete from user where userid=?";

    private String updateItemcategory="update Item set category=? where ID=?";
    private String updateItemcompany="update Item set Company=? where ID=?";
    private String updateItemname="update Item set Name=? where ID=?";
    private String updateIteminventory="update Item set inventory_amt=? where ID=?";
    private String updateItemthreshold="update Item set threshold=? where ID=?";
    private String updateItemprice="update Item set price=? where ID=?";
    private String updateItemcover="update Item set cover=? where ID=?";
    private String retrieveItem="select * from Item where ID=?";
    private String retrieveInventory="select inventory_amt from Item where ID=?";
    private String deleteItem="delete from Item where ID=?";

    private String updatePromotiondate="update promotion set exp_date=? where promotion_code=?";
    private String createPromotion="insert into promotion values(?,?,?)";
    private String retrievePromotion="select * from promotion where promotion_code=?";
    private String deletePromotion="delete from promotion where promotion_code=?";
    private String createItem ="insert into Item values(?,?,?,?,?,?,?,?)";
    private String restock="update Item set inventory_amt=? where ID=?";

	private String retrieveAll = "select * from Item";
	private String updateUser = "update user set name= ?, address= ?, password = ?, subscribed = ? where email= ?";
	private String retrieveRevenue = "select sum(final_price) as revenue from orders";
	private String retrieveBsales = "select order_details.*, Item.price, Item.Company from unrealbooks.Item,  unrealbooks.order_details where order_details.isbn = Item.ID";


	private String createShipment="insert into shipping_agency values(?,?,?,?,?,?,?,?)";
    private String updateShipment="update shipping_agency set name=?,address=?,contactname=?,phone_number=?,businessphone=?,cellphone=?, email=? where company_id=?";
    private String deleteShipment="delete from shipping_agency where company_id=?";
    private String createSupplier="insert into supplier values(?,?,?,?,?,?,?,?)";
    private String updateSupplier="update supplier set name=?,address=?,contactname=?,phone_number=?,businessphone=?,cellphone=?, email=? where company_id=?";
    private String deleteSupplier="delete from supplier where company_id=?";
    private String updateShippingstatus="update shipping_info set status=? where trans_num=?";
    private String updateShippingtracking="update shipping_info set tracking_number=? where trans_num=?";
    private String updateShippingagencyid="update shipping_info set agency_id=? where trans_num=?";
    private String updatePayment="update payment set card_num=?, billing_address=?,type=?, expiration_date=?, cvv=? where customer_id=?";
    private String deletePayment="delete from payment where customer_id=?";
    private String retrieveOrder="select * from orders where transaction_number=?";
    private String retrieveUserbyid = "select * from user where userid = ?";
    private String deleteCart="delete from shopping_cart where customer_id=?";
    private String EmailUserbyid="select * from user where subscribed=\"yes\"";
    private String updatePromotionvalue="update promotion set value=? where promotion_code=?";

	public boolean createUser(User user)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(createUser);
			ps.setInt(1, user.getUserId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setInt(4, user.getPhoneNumber());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getStatus().toString());
			ps.setString(7, user.getEmail());
			ps.setString(8, user.getType().toString());
			ps.setString(9, user.getVerificationCode());
			ps.setString(10, user.getSubscribed().toString());

			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0) //User Created
		{
			try //Create Shopping Cart
			{
				retrieveUser(user);
				ps = con.prepareStatement(createCart);
				ps.setInt(1, user.getUserId());
				ps.setInt(2, 0);
				ps.setInt(3, 0);
				DatabaseAccess.update(ps);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return true;
		}
		else
		{
			return false;
		}
	}

	public boolean retrieveUser(User user)
	{
		int rows;
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(retrieveUser);
			ps.setString(1, user.getEmail());
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				user.setUserId(rs.getInt("userid"));
				user.setType(User.Type.valueOf(rs.getString("type").toUpperCase()));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setPhoneNumber(rs.getInt("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setStatus(User.Status.valueOf(rs.getString("status").toUpperCase()));
				user.setEmail(rs.getString("email"));
				user.setVerificationCode(rs.getString("verification_code"));
				user.setSubscribed(User.Subscribed.valueOf(rs.getString("subscribed").toUpperCase()));
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}



	public boolean activateUser(User user)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(activateUser);
			ps.setInt(1, user.getUserId());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public boolean resetPassword(User user)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(resetPassword);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getEmail());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public ArrayList search(String input)
	{
		ArrayList list = new ArrayList<Item>();
		Item book  = null;
		ResultSet rs;

		try{
		//Search Item
		ps = con.prepareStatement(searchItem);
		ps.setString(1, "%" + input + "%");
		rs = DatabaseAccess.retrieve(ps);

		while(rs.next())
		{
			book = new Item();
			book.setID(rs.getString("ID"));
			book.setCategory(rs.getString("category"));
			book.setCompany(rs.getString("Company"));
			book.setName(rs.getString("Name"));
			book.setCover(rs.getString("cover"));
			book.setInventory_amt(rs.getInt("inventory_amt"));
			book.setThreshold(rs.getInt("threshold"));
			book.setPrice(rs.getInt("price"));

			list.add(book);
		}
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	try{
		//Search Company
		ps = con.prepareStatement(searchCompany);
		ps.setString(1, "%" + input + "%");
		rs = DatabaseAccess.retrieve(ps);

		while(rs.next())
		{
			book = new Item();
			book.setID(rs.getString("ID"));
			book.setCategory(rs.getString("category"));
			book.setCompany(rs.getString("Company"));
			book.setName(rs.getString("Name"));
			book.setCover(rs.getString("cover"));
			book.setInventory_amt(rs.getInt("inventory_amt"));
			book.setThreshold(rs.getInt("threshold"));
			book.setPrice(rs.getInt("price"));

			if(!list.contains(book))
			{
				list.add(book);
			}
		}
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	try
		{
			//Search Category
			ps = con.prepareStatement(searchCategory);
			ps.setString(1, "%" + input + "%");
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				book = new Item();
				book.setID(rs.getString("ID"));
				book.setCategory(rs.getString("category"));
				book.setCompany(rs.getString("Company"));
				book.setName(rs.getString("Name"));
				book.setCover(rs.getString("cover"));
				book.setInventory_amt(rs.getInt("inventory_amt"));
				book.setThreshold(rs.getInt("threshold"));
				book.setPrice(rs.getInt("price"));

				if(!list.contains(book))
				{
					list.add(book);
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		
		if(list.isEmpty())
		{
			return null;
		}
		else
		{
			return list;
		}
	}
	public Shopping_Cart retrieveShoppingCart(User user)
	{
		ResultSet rs;
		Shopping_Cart cart = new Shopping_Cart();
		try
		{
			ps = con.prepareStatement(retrieveShoppingCart);
			ps.setInt(1, user.getUserId());
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				cart.setCustomer_id(rs.getInt("customer_id"));
				cart.setPrice(rs.getInt("price"));
				cart.setCart_id(rs.getInt("cart_id"));
				return cart;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public int checkCart(Shopping_Cart cart, String isbn)
	{
		ResultSet rs;
		int qty = 0;

		try
		{
			ps = con.prepareStatement(checkCart);
			ps.setInt(1, cart.getCart_id());
			ps.setString(2, isbn);
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				qty = rs.getInt("qty");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return qty;
	}

	public boolean addToCart(User user, String isbn)
	{
		Shopping_Cart cart = retrieveShoppingCart(user);
		int rows = 0;
		int qty = 0;
		if(cart != null)
		{
			try
			{
				qty = checkCart(cart, isbn);
				if(qty == 0)
				{
					ps = con.prepareStatement(addToCart);
					ps.setInt(1, cart.getCart_id());
					ps.setString(2, isbn);
					ps.setInt(3, 1);
					rows = DatabaseAccess.update(ps);
				}
				else
				{
					qty++;
					ps = con.prepareStatement(updateCart);
					ps.setInt(1, qty);
					ps.setInt(2, cart.getCart_id());
					ps.setString(3, isbn);
					rows = DatabaseAccess.update(ps);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

		if(rows > 0)
		{
			updateCartPrice(cart);
			return true;
		}
		else
		{
			return false;
		}
	}

	public void updateCartPrice(Shopping_Cart cart)
	{
		int price = 0;
		int qty = 0;
		ResultSet rs;
		int length = 0;
		try
		{
			ps = con.prepareStatement(checkCartQty);
			ps.setInt(1, cart.getCart_id());
			rs = DatabaseAccess.retrieve(ps);
			while(rs.next())
			{
				length++;
				qty = rs.getInt("qty");
				price += qty * retrieveItemPrice(rs.getString("isbn"));
			}

			ps = con.prepareStatement(updatePrice);
			ps.setInt(1, price);
			ps.setInt(2, cart.getCart_id());
			DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public int retrieveItemPrice(String isbn)
	{
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(retrieveItemPrice);
			ps.setString(1, isbn);
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				return rs.getInt("price");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}

	public HashMap displayCart(Shopping_Cart cart)
	{
		HashMap map = new HashMap();
		ArrayList<Item> bookList = new ArrayList<Item>();
		ArrayList<Integer> qtyList = new ArrayList<Integer>();
		Integer qty;
		Item book;
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(displayCart);
			ps.setInt(1, cart.getCart_id());
			rs = DatabaseAccess.retrieve(ps);
			while(rs.next())
			{
				book = new Item();
				book.setID(rs.getString("ID"));
				book.setCategory(rs.getString("category"));
				book.setCompany(rs.getString("Company"));
				book.setName(rs.getString("Name"));
				book.setCover(rs.getString("cover"));
				book.setInventory_amt(rs.getInt("inventory_amt"));
				book.setThreshold(rs.getInt("threshold"));
				book.setPrice(rs.getInt("price"));
				bookList.add(book);

				qty = new Integer(rs.getInt("qty"));
				qtyList.add(qty);
			}

			map.put("bookList", bookList);
			map.put("qtyList", qtyList);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return map;
	}

	public boolean updateCartItem(Shopping_Cart cart, String isbn, int qty)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(updateCartItem);
			ps.setInt(1, qty);
			ps.setInt(2, cart.getCart_id());
			ps.setString(3, isbn);
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			updateCartPrice(cart);
			return true;
		}
		else
		{
			return false;
		}
	}

	public boolean deleteCartItem(Shopping_Cart cart, String isbn)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(deleteCartItem);
			ps.setInt(1, cart.getCart_id());
			ps.setString(2, isbn);
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			updateCartPrice(cart);
			return true;
		}
		else
		{
			return false;
		}
	}

	public boolean createPayment(Payment payment)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(createPayment);
			ps.setInt(1, payment.getCustomer_id());
			ps.setString(2, payment.getCard_num());
			ps.setString(3, payment.getBilling_address());
			ps.setString(4, payment.getType().toString());
			ps.setInt(5, payment.getCVV());
			ps.setString(6, payment.getExpiration_Date());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public Payment retrievePayment(User user)
	{
		ResultSet rs;
		Payment payment = null;
		try
		{
			ps = con.prepareStatement(retrievePayment);
			ps.setInt(1, user.getUserId());
			rs = DatabaseAccess.retrieve(ps);
			while(rs.next())
			{
				payment = new Payment();
				payment.setCustomer_id(rs.getInt("customer_id"));
				payment.setCard_num(rs.getString("card_num"));
				payment.setCVV(rs.getInt("cvv"));
				payment.setBilling_address(rs.getString("billing_address"));
				payment.setExpiration_Date(rs.getString("expiration_date"));
				payment.setType(Payment.Type.valueOf(rs.getString("type").toUpperCase()));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return payment;
	}

	public Orders createOrder(Orders order)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(createOrder);
			ps.setInt(1, 0);
			ps.setDate(2, order.getOrder_date());
			ps.setInt(3, order.getFinalPrice());
			ps.setInt(4, order.getUserId());
			ps.setTimestamp(5, order.getTime());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(rows > 0)
		{
			retrieveInitialOrder(order);
			return order;
		}
		else
		{
			return null;
		}
	}

	public void retrieveInitialOrder(Orders order)
	{
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(initialRetrieveOrder);
			ps.setInt(1, order.getUserId());
			ps.setTimestamp(2, order.getTime());
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				order.setTransaction_number(rs.getInt("transaction_number"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

	public void createOrderDetails(Orders order, Shopping_Cart cart)
	{
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(retrieveCartItems);
			ps.setInt(1, cart.getCart_id());
			rs = DatabaseAccess.retrieve(ps);

			Order_Details detail;
			while(rs.next())
			{
				detail = new Order_Details();
				detail.setTransaction_number(order.getTransaction_number());
				detail.setISBN(rs.getString("isbn"));
				detail.setQty(rs.getInt("qty"));
				createOrderDetailsItem(detail);
			}
			clearCart(cart);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void createOrderDetailsItem(Order_Details detail)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(createOrderDetailsItem);
			ps.setInt(1, detail.getTransaction_number());
			ps.setString(2, detail.getISBN());
			ps.setInt(3, detail.getQty());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void clearCart(Shopping_Cart cart)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(clearCart);
			ps.setInt(1, cart.getCart_id());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void updateItemInventory(Item book)
	{
		int rows;
		try
		{
			ps = con.prepareStatement(updateIteminventory);
			ps.setInt(1, book.getInventory_amt());
			ps.setString(2, book.getID());
			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public HashMap retrieveOrders(User user)
	{
		HashMap map = new HashMap();
		ArrayList<Orders> ordersList = new ArrayList<Orders>();
		ArrayList<ArrayList<Item>> bookList = new ArrayList<ArrayList<Item>>();
		ArrayList<Integer> qtyList = new ArrayList<Integer>();
		Orders order;
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(retrieveOrders);
			ps.setInt(1, user.getUserId());
			rs = DatabaseAccess.retrieve(ps);
			Item book;
			Order_Details detail;

			while(rs.next())
			{
				order = new Orders();
				order.setTransaction_number(rs.getInt("transaction_number"));
				order.setOrder_date(rs.getDate("order_date"));
				order.setFinalPrice(rs.getInt("final_price"));
				order.setUserId(rs.getInt("userid"));
				order.setTime(rs.getTimestamp("time"));
				ordersList.add(order);

				ArrayList<Order_Details> list = retrieveOrderDetails(order);
				ArrayList<Item> minorBookList = new ArrayList<Item>();
				for(int i = 0; i < list.size(); i++)
				{
					book = new Item();
					detail = (Order_Details)list.get(i);
					book.setID(detail.getISBN());
					retrieveItem(book);
					minorBookList.add(book);
					qtyList.add(detail.getQty());
				}
				bookList.add(minorBookList);
				//detailsList.add();
			}
			map.put("ordersList", ordersList);
			map.put("bookList", bookList);
			map.put("qtyList", qtyList);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(ordersList.size() > 0)
		{
			return map;
		}
		else
		{
			return null;
		}
	}

	public ArrayList<Order_Details> retrieveOrderDetails(Orders order)
	{
		ResultSet rs;
		Order_Details detail = null;
		ArrayList<Order_Details> list = new ArrayList<Order_Details>();
		try
		{
			ps = con.prepareStatement(retrieveOrderDetails);
			ps.setInt(1, order.getTransaction_number());
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				detail = new Order_Details();
				detail.setTransaction_number(rs.getInt("transaction_number"));
				detail.setISBN(rs.getString("isbn"));
				detail.setQty(rs.getInt("qty"));
				list.add(detail);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	/*
	public boolean updateUser(User user)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(updateUser);
			ps.setString(1, user.getName());
			ps.setString(2, user.getAddress());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getEmail());

			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	*/

	public boolean createPromotion(Promotion promo)
    {
        int rows = 0;
        try
	    {
		ps = con.prepareStatement(createPromotion);
		ps.setString(1, promo.getPromotion_code());
		ps.setDate(2, new java.sql.Date(promo.getExp_date().getTime()));
		ps.setInt(3, promo.getValue());
		rows = DatabaseAccess.update(ps);
	    }
        catch(Exception e)
	    {
		e.printStackTrace();
	    }

        if(rows > 0)
	    {
		return true;
	    }
        else
	    {
		return false;
	    }

    }
    public boolean updatePromotion(Promotion promo)
    {
        int rows=0;
        try{
            ps=con.prepareStatement(updatePromotiondate);
            ps.setDate(1, new java.sql.Date(promo.getExp_date().getTime()));
            ps.setString(2, promo.getPromotion_code());
	    ps.execute();
	    ps=con.prepareStatement(updatePromotionvalue);
            ps.setInt(1, promo.getValue());
	    ps.setString(2, promo.getPromotion_code());
	    rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
        }
        catch(Exception e)
	    {
		e.printStackTrace();
	    }
        return true;
    }

    public boolean deletePromotion(String Promocode)
    {
        try{
            ps=con.prepareStatement(deletePromotion);
            ps.setString(1,Promocode);
            ps.execute();
        }
        catch(Exception e)
	    {
		e.printStackTrace();
	    }
        return true;

    }

    public boolean updateUserM(User user)
    {
        int row=0;
        try{
            ps=con.prepareStatement(updateUserstatus);
	    ps.setString(1, user.getStatus().toString());
            ps.setInt(2, user.getUserId());
            ps.execute();
	    ps=con.prepareStatement(updateUsertype);
	    ps.setString(1, user.getType().toString());
	    ps.setInt(2, user.getUserId());
	    ps.execute();
            ps=con.prepareStatement(updateUsername);
            ps.setString(1, user.getName());
            ps.setInt(2, user.getUserId());
            row=DatabaseAccess.update(ps);
            if(row<0)return false;
            ps=con.prepareStatement(updateUserpassword);
            ps.setString(1, user.getPassword());
            ps.setInt(2, user.getUserId());
            row=DatabaseAccess.update(ps);
            if(row<0)return false;
            ps=con.prepareStatement(updateUserphonenum);
            ps.setInt(1, user.getPhoneNumber());
            ps.setInt(2, user.getUserId());
            row=DatabaseAccess.update(ps);
            if(row<0)return false;
            ps=con.prepareStatement(updateUseraddress);
            ps.setString(1, user.getAddress());
            ps.setInt(2, user.getUserId());
            row=DatabaseAccess.update(ps);
            if(row<0)return false;
            ps=con.prepareStatement(updateUseremail);
            ps.setString(1, user.getEmail());
            ps.setInt(2, user.getUserId());
            row=DatabaseAccess.update(ps);
            if(row<0)return false;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }

    public boolean createBook(Item book)
    {
        int rows=0;
        try{
            ps=con.prepareStatement(createItem);
            ps.setString(1, book.getID());
            ps.setString(2, book.getCategory());
            ps.setString(3, book.getCompany());
            ps.setString(4, book.getName());
            ps.setString(5, book.getCover());
            ps.setInt(9, book.getInventory_amt());
            ps.setInt(10, book.getThreshold());
            ps.setDouble(11, book.getPrice());
            rows=DatabaseAccess.update(ps);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        if(rows>0) return true;
        else return false;
    }
    public boolean updateItem(Item book)
    {

        int rows=0;
        try{
            ps=con.prepareStatement(updateItemname);
            ps.setString(1,book.getID());
            ps.setString(2,book.getName());
            rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
            ps=con.prepareStatement(updateItemcover);
	    			ps.setString(1,book.getID());
            ps.setString(2,book.getCover());
	    			rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
            ps=con.prepareStatement(updateItemcategory);
            ps.setString(1,book.getID());
            ps.setString(2,book.getCategory());
            rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
            ps=con.prepareStatement(updateItemprice);
            ps.setString(1,book.getID());
	    			ps.setDouble(2,book.getPrice());
            rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
            ps=con.prepareStatement(updateItemthreshold);
            ps.setString(1,book.getID());
            ps.setInt(2,book.getThreshold());
	    			rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
            ps=con.prepareStatement(updateItemcompany);
            ps.setString(1,book.getID());
            ps.setString(2,book.getCompany());
            rows=DatabaseAccess.update(ps);
            if(rows<0)return false;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }


    public boolean retrieveItem(Item book)
    {
        int rows;
        ResultSet rs;
        try
        {
            ps = con.prepareStatement(retrieveItem);
            ps.setString(1, book.getID());
            rs = DatabaseAccess.retrieve(ps);

            while(rs.next())
            {
							book.setID(rs.getString("ID"));
							book.setCategory(rs.getString("category"));
							book.setCompany(rs.getString("Company"));
							book.setName(rs.getString("Name"));
							book.setCover(rs.getString("cover"));
							book.setInventory_amt(rs.getInt("inventory_amt"));
							book.setThreshold(rs.getInt("threshold"));
							book.setPrice(rs.getInt("price"));
              return true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }




    public boolean retrievePromotion(Promotion promo)
    {
        int rows;
        ResultSet rs;
        try
        {
            ps = con.prepareStatement(retrievePromotion);
            ps.setString(1, promo.getPromotion_code());
            rs = DatabaseAccess.retrieve(ps);

            while(rs.next())
            {
                promo.setExp_date(rs.getDate("exp_date"));
		promo.setValue(rs.getInt("value"));
		return true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUser(int id)
    {
        try{
	    ps=con.prepareStatement(deleteCart);
	    ps.setInt(1,id);
            ps.execute();
            ps=con.prepareStatement(deleteUser);
            ps.setInt(1,id);
            ps.execute();
        }
        catch(Exception e)
	    {
		e.printStackTrace();
	    }
        return true;

    }

    public boolean deleteItem(String isbn)
    {
	try{
	    ps=con.prepareStatement(deleteItem);
	    ps.setString(1,isbn);
	    ps.execute();
	}
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;

    }

   public boolean restock(String ISBN, int amount)
    {
	//	int rows=0;;
        ResultSet rs;

	try
	    {
		ps=con.prepareStatement(retrieveInventory);
		ps.setString(1,ISBN);
		rs=DatabaseAccess.retrieve(ps);
		rs.next();
		int a=rs.getInt("inventory_amt");
		ps=con.prepareStatement(restock);
		a+=amount;
		ps.setInt(1,a);
		ps.setString(2,ISBN);
		ps.execute();
	    }
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }

	public boolean updateUser(User user)
	{
		int rows = 0;
		try
		{
			ps = con.prepareStatement(updateUser);
			ps.setString(1, user.getName());
			ps.setString(2, user.getAddress());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getSubscribed().toString());
			ps.setString(5, user.getEmail());


			rows = DatabaseAccess.update(ps);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(rows > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public int retrieveRevenue()
	{
		ResultSet rs;
		try
		{
			ps = con.prepareStatement(retrieveRevenue);
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				return rs.getInt("revenue");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList inventoryNotice()
	{
		ArrayList list = new ArrayList<Item>();
		Item book  = null;
		ResultSet rs;

		try
		{
			ps = con.prepareStatement(retrieveAll);
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
				if(rs.getInt("threshold")<rs.getInt("inventory_amt"))
					continue;
				book = new Item();
				book.setID(rs.getString("ID"));
				book.setCategory(rs.getString("category"));
				book.setCompany(rs.getString("Company"));
				book.setName(rs.getString("Name"));
				book.setCover(rs.getString("cover"));
				book.setInventory_amt(rs.getInt("inventory_amt"));
				book.setThreshold(rs.getInt("threshold"));
				book.setPrice(rs.getInt("price"));
				list.add(book);
			}



		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(list.isEmpty())
		{
			return null;
		}
		else
		{
			return list;
		}
	}

	public int bookSales(String input)
	{
		int sales = 0;
		ResultSet rs;

		try
		{
			ps = con.prepareStatement(retrieveBsales);
			//ps.setString(1, "%" + input + "%");
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
					if(input.equals(rs.getString("isbn"))) {
					sales+=rs.getInt("qty")*rs.getInt("price");
					}
			}



		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return sales;
	}

	public int pubSales(String input)
	{
		int sales = 0;
		ResultSet rs;

		try
		{
			ps = con.prepareStatement(retrieveBsales);
			//ps.setString(1, "%" + input + "%");
			rs = DatabaseAccess.retrieve(ps);

			while(rs.next())
			{
					if(input.equals(rs.getString("Company"))) {
					sales+=rs.getInt("qty")*rs.getInt("price");
					}
			}



		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return sales;
	}

	public boolean deletePaymentM(int id)
    {
	 try
	     {
		 ps=con.prepareStatement(deletePayment);
		 ps.setInt(1, id);
		 ps.execute();
	     }
	 catch(Exception e)
	     {
		 e.printStackTrace();
	     }
	 return true;
    }

    public boolean updatePaymentM(Payment p)
    {
	try
	    {
		ps=con.prepareStatement(updatePayment);
		ps.setString(1, p.getCard_num());
		ps.setString(2, p.getBilling_address());
		ps.setString(3, p.getType().toString());
		ps.setString(4, p.getExpiration_Date());
		ps.setInt(5, p.getCVV());
		ps.setInt(6, p.getCustomer_id());
		ps.execute();
	    }
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }



    public boolean createPaymentM(Payment p)
    {
	try
	    {
		ps=con.prepareStatement(createPayment);
		ps.setInt(1, p.getCustomer_id());
		ps.setString(2, p.getCard_num());
		ps.setString(3, p.getBilling_address());
		ps.setString(4, p.getType().toString());
		ps.setInt(5, p.getCVV());
		ps.setString(6, p.getExpiration_Date());
		ps.execute();
	    }
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }


    public boolean updateShipping(Shipping_Info s)
    {
	try{
	    ps=con.prepareStatement(updateShippingstatus);
	    System.out.println("print status: "+s.getStatus().toString());
	    ps.setString(1, s.getStatus().toString());
	    System.out.println("print trans_num: "+s.getTransaction_number());
	    ps.setInt(2, s.getTransaction_number());
	    ps.execute();
	    if(s.getStatus().toString().equals("SHIPPED"))
		{
		    ps=con.prepareStatement(updateShippingtracking);
		    ps.setString(1, s.getTracking_number());
		    ps.setInt(2, s.getTransaction_number());
		    ps.execute();
		    ps=con.prepareStatement(updateShippingagencyid);
                    ps.setInt(1, s.getAgency_id());
                    ps.setInt(2, s.getTransaction_number());
                    ps.execute();

		}
	}
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }


    public boolean createShipment(Shipping_Agency sa)
    {
	try
	    {
		ps=con.prepareStatement(createShipment);
		ps.setString(1, sa.getName());
		ps.setInt(2, sa.getCompany_id());
		ps.setString(3, sa.getAddress());
		ps.setString(4, sa.getContactname());
		ps.setString(5, sa.getPhone_Number());
		ps.setString(6, sa.getBusinessphone());
		ps.setString(7, sa.getCellphone());
		ps.setString(8, sa.getEmail());
		ps.execute();
	    }
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }

    public boolean updateShipment(Shipping_Agency sa)
    {
	try{
	    ps=con.prepareStatement(updateShipment);
	    ps.setString(1, sa.getName());
	    ps.setString(2, sa.getAddress());
	    ps.setString(3, sa.getContactname());
	    ps.setString(4, sa.getPhone_Number());
	    ps.setString(5, sa.getBusinessphone());
	    ps.setString(6, sa.getCellphone());
	    ps.setString(7, sa.getEmail());
	    ps.setInt(8, sa.getCompany_id());
	    ps.execute();
	}
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }

    public boolean deleteShipment(int id)
    {
	try{
	    ps=con.prepareStatement(deleteShipment);
	    ps.setInt(1, id);
	    ps.execute();
	}
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
	return true;
    }

    public boolean createSupplier(Supplier sa)
    {
	try
            {
		ps=con.prepareStatement(createSupplier);
		ps.setString(1,sa.getName());
		ps.setInt(2, sa.getCompany_id());
		ps.setString(3,sa.getAddress());
		ps.setString(4,sa.getContactname());
		ps.setString(5,sa.getPhone_Number());
		ps.setString(6,sa.getBusinessphone());
		ps.setString(7,sa.getCellphone());
		ps.setString(8,sa.getEmail());
		ps.execute();
            }
        catch(Exception e)
            {
		e.printStackTrace();
            }
	return true;
    }

    public boolean updateSupplier(Supplier sa)
    {
	try{
            ps=con.prepareStatement(updateSupplier);
            ps.setString(1, sa.getName());
            ps.setString(2, sa.getAddress());
            ps.setString(3, sa.getContactname());
            ps.setString(4, sa.getPhone_Number());
            ps.setString(5, sa.getBusinessphone());
            ps.setString(6, sa.getCellphone());
            ps.setString(7, sa.getEmail());
            ps.setInt(8, sa.getCompany_id());
            ps.execute();
        }
        catch(Exception e)
            {
		e.printStackTrace();
            }
	return true;
    }

    public boolean deleteSupplier(int id)
    {
	try{
            ps=con.prepareStatement(deleteSupplier);
            ps.setInt(1, id);
            ps.execute();
        }
        catch(Exception e)
            {
		e.printStackTrace();
            }
	return true;
    }

	public boolean retrieveUserbyid(User user)
    {
        int rows;
        ResultSet rs;
        try
	    {
		ps = con.prepareStatement(retrieveUserbyid);
		ps.setInt(1, user.getUserId());
		rs = DatabaseAccess.retrieve(ps);

		while(rs.next())
		    {
			user.setEmail(rs.getString("email"));
			System.out.println(user.getUserId());
			System.out.println(user.getEmail());
			return true;
		    }
	    }
        catch(Exception e)
	    {
		e.printStackTrace();
	    }
        return false;
    }
   public Orders retrieveOrder(int transnum)
    {
        int row=0;
        ResultSet rs;
        try
            {
		ps=con.prepareStatement(retrieveOrder);
		ps.setInt(1, transnum);
		rs=DatabaseAccess.retrieve(ps);

		while(rs.next())
		    {
			Orders order=new Orders();
			order.setUserId(rs.getInt("userid"));
			return order;
		    }
            }
        catch(Exception e)
            {
                e.printStackTrace();
	    }
	return null;
    }
    public boolean EmailNewPromo(Promotion promo)
    {
        int rows;
        ResultSet rs;
        try
        {
            ps = con.prepareStatement(EmailUserbyid);
            rs = DatabaseAccess.retrieve(ps);

            while(rs.next())
            {
                final String fromEmail = "onlineshoppingnetworkServer@gmail.com";
                final String fromPassword = "onlineshopping123";
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                Session mailSession = Session.getInstance(props,
							  new javax.mail.Authenticator()
							  {
							      protected PasswordAuthentication getPassswordAuthentication()
							      {
								  return new PasswordAuthentication("unrealbookstore", fromPassword);
							      }
							  });
                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rs.getString("email")));
                message.setSubject("New Deal From UnrealBooks!");
                message.setText("Thank you for being an registered customer at Online Shopping Network! We have a new deals for our dear customers! " +
                                "When checking out at: localhost::8080//UnrealBooks, use the code: " + promo.getPromotion_code() +
                                " and receive " + promo.getValue() +
				" dollar off your purchase! The code will expire at " + promo.getExp_date().toString()+
                                ". Thank you again for being a customer at UnrealBooks!" +
                                "\n\nBest,\n" +
                                "Online Shopping Network Team");
                Transport.send(message, fromEmail, fromPassword);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }


    public boolean EmailUpdatedPromo(Promotion promo)
    {
        int rows;
        ResultSet rs;
        try
        {
            ps = con.prepareStatement(EmailUserbyid);
            rs = DatabaseAccess.retrieve(ps);

            while(rs.next())
            {
                final String fromEmail = "onlineshoppingnetworkServer@gmail.com";
                final String fromPassword = "onlineshopping123";
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                Session mailSession = Session.getInstance(props,
							  new javax.mail.Authenticator()
							  {
							      protected PasswordAuthentication getPassswordAuthentication()
							      {
								  return new PasswordAuthentication("unrealbookstore", fromPassword);
							      }
							  });
                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rs.getString("email")));
                message.setSubject("New Deal From Online Shopping Network!");
                message.setText("Thank you for being an registered customer at Online Shopping Network! " +
                                "There is a change to the pre-existing promotion code: " + promo.getPromotion_code()+
                                ". The code now gives " + promo.getValue() +
				" dollar off your purchase! The code will now expire at " + promo.getExp_date().toString()+
                                ". Thank you again for being a customer at Online Shopping Network!" +
                                "\n\nBest,\n" +
                                "Online Shopping Network Team");
                Transport.send(message, fromEmail, fromPassword);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
}
