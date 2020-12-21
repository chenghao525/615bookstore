package com.unrealbooks.controller;

import java.util.*;
import java.sql.*;
import java.security.*;
import javax.xml.bind.DatatypeConverter;
import com.unrealbooks.model.*;
import com.unrealbooks.database.*;

public class BookstoreController
{
	private BookstorePersistImpl persist = new BookstorePersistImpl();

    public boolean EmailNewPromo(Promotion promo)
    {
	return persist.EmailNewPromo(promo);
    }
    public boolean EmailUpdatedPromo(Promotion promo)
    {
	return persist.EmailUpdatedPromo(promo);
    }

	public User createUser(int userid, User.Type type, String name,
				String password, int phoneNumber,
				String address, User.Status status,
				String email, String verificationCode,
				User.Subscribed subscribed)
	{
		User user = new User(userid, type, name,
				password, phoneNumber, address,
				status, email, verificationCode, subscribed);
		if(persist.createUser(user))
		{
			return user;
		}
		else
		{
			return null;
		}
	}

	public User verifyUser(String email, String password)
	{
		User.Type type = null;
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		if(persist.retrieveUser(user))
		{
			try
			{
				//Hash password
				MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
				messageDigest.update(password.getBytes());
				password = DatatypeConverter.printHexBinary(messageDigest.digest());
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}

			if(password.equals(user.getPassword()))
			{
				return user;
			}
		}
		return null;
	}

	public boolean activateUser(User user)
	{
			persist.activateUser(user);
			return false;
	}

	public boolean verifyEmail(String email)
	{
		User user = new User();
		user.setEmail(email);
		return persist.retrieveUser(user);
	}

	public boolean resetPassword(String email, String password)
	{
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		return persist.resetPassword(user);
	}

	public ArrayList search(String input)
	{
		return persist.search(input);
	}

	public boolean addToCart(User user, String isbn)
	{
		return persist.addToCart(user, isbn);
	}

	public HashMap displayCart(User user)
	{
		Shopping_Cart cart = persist.retrieveShoppingCart(user);
		HashMap map = persist.displayCart(cart);
		map.put("cart", cart);
		return map;
	}

	public boolean updateCartItem(User user, String isbn, int qty)
	{
		Shopping_Cart cart = persist.retrieveShoppingCart(user);
		return persist.updateCartItem(cart, isbn, qty);
	}

	public boolean deleteCartItem(User user, String isbn)
	{
		Shopping_Cart cart = persist.retrieveShoppingCart(user);
		System.out.println(cart.getCart_id() + " " + isbn);
		return persist.deleteCartItem(cart, isbn);
	}

	public boolean createPayment(User user, String card_num,
				String billing_address, String expiration_date, int cvv)
	{
		Payment payment = new Payment(user.getUserId(), card_num, billing_address,
					Payment.Type.CREDIT, expiration_date, cvv);
		return persist.createPayment(payment);
	}

	public Payment retrievePayment(User user)
	{
		return persist.retrievePayment(user);
	}

	public Orders createOrder(User user, int finalPrice)
	{
		Calendar calendar = Calendar.getInstance();
		java.util.Date now = calendar.getTime();
		java.sql.Timestamp time = new java.sql.Timestamp(now.getTime());

		Orders order = new Orders();
		order.setFinalPrice(finalPrice);
		order.setUserId(user.getUserId());
		order.setTime(time);

		calendar.setTimeInMillis(time.getTime());
		order.setOrder_date(new java.sql.Date(calendar.getTime().getTime()));

		return persist.createOrder(order);
	}

	public void createOrderDetails(Orders order, Shopping_Cart cart)
	{
		persist.createOrderDetails(order, cart);
	}

	public void updateBookQty(Item book)
	{
		persist.updateItemInventory(book);
	}

	public HashMap retrieveOrders(User user)
	{
		return persist.retrieveOrders(user);
	}

	public boolean updateUser(User user, String email, String name, String address, String password, User.Subscribed subscribed) {
		user.setName(name);
		user.setAddress(address);
		user.setPassword(password);
		user.setSubscribed(subscribed);
		return persist.updateUser(user);

	}

	public int retrieveRevenue() {

		return persist.retrieveRevenue();
	}

	public ArrayList inventoryNotice()
	{
		return persist.inventoryNotice();
	}

	public int bookSales(String input) {

		return persist.bookSales(input);

	}

	public int pubSales(String input) {

		return persist.pubSales(input);

	}

	public User updateUserM(int userid, User.Type type, String name,
                           String password, int phoneNumber,
                           String address, User.Status status,
                           String email, String verificationCode, User.Subscribed subscribed)
    {
        User user=new User(userid, type, name,
                           password, phoneNumber, address,
                           status, email, verificationCode,
			   subscribed);
        if(persist.updateUserM(user))
        {
            return user;
        }
        else return null;
    }
    public boolean deleteUser(int id)
    {
        if(persist.deleteUser(id))
            return true;
        else return false;
    }

    public Item createBook(String ISBN, String category,String authors,String title,
				String cover, int inventory_amt,
				int threshold,double price)
    {
        Item book=new Item(ISBN,category, authors, title, cover,
				inventory_amt, threshold, price);
        if( persist.createBook(book)) return book;
        else return null;

    }

    public Item updateBook(String ISBN, String category,String authors,String title,String cover,int inventory_amt, int threshold,double price)
    {
        Item book=new Item(ISBN,category, authors, title, cover, inventory_amt, threshold, price);
        if(persist.updateItem(book)) return book;
        else return null;

    }

    public Promotion createPromotion(String code, java.sql.Date d, int value)
    {
        Promotion promo=new Promotion(code, d, value);
        if(persist.createPromotion(promo))return promo;
        else return null;

    }
    public Promotion retrievePromotion(Promotion promo)
    {
        if(persist.retrievePromotion(promo))return promo;
        else return null;
    }

    public Promotion retrievePromotion(String promoCode)
    {
	Promotion promo = new Promotion();
	promo.setPromotion_code(promoCode);
        if(persist.retrievePromotion(promo))return promo;
        else return null;
    }
    public Promotion updatePromotion(String code, java.sql.Date d, int value)
    {
        Promotion promo =new Promotion(code,d, value);
	System.out.println(value);
        if(persist.updatePromotion(promo))
            return promo;
        else return null;

    }
    public boolean deleteBook(String isbn)
    {
        if(persist.deleteItem(isbn))
            return true;
        else return false;
    }
    public boolean deletePromotion(String code)
    {
        if(persist.deletePromotion(code))
            return true;
        else return false;
    }
    public User retrieveUser(User user)
    {
        if(persist.retrieveUser(user))
        {
            return user;
        }
        else return null;
    }
    public Item retrieveBook(Item book)
    {
        if(persist.retrieveItem(book))return book;
        else return null;

    }

   public boolean restock(String ISBN, int amount)
    {
        return persist.restock(ISBN, amount);
    }
	public boolean createPaymentM(int id, String card1, String billing1, Payment.Type type1, String cardexp1, int ccv1)
    {
	Payment p=new Payment(id, card1, billing1, type1, cardexp1, ccv1);
	return persist.createPaymentM(p);
    }
    public boolean updatePaymentM(int id, String card, String billing, Payment.Type type, String exp, int cvv)
    {
	Payment p=new Payment(id, card, billing, type, exp, cvv);
	return persist.updatePaymentM(p);
    }
    public boolean deletePaymentM(int id)
    {
	return persist.deletePaymentM(id);
    }


    public boolean updateShipping(String trackingnum, Shipping_Info.Status status, String transnum, int id)
    {
	Shipping_Info s=new Shipping_Info(trackingnum,Integer.parseInt(transnum),status, id);
	return persist.updateShipping(s);
    }

    public boolean createShipment(int i, String name, String phone, String ad, String cn, String em, String c, String b)
    {
	Shipping_Agency sa=new Shipping_Agency(name, i, ad, phone, cn, em, c, b);
	return persist.createShipment(sa);
    }
    public boolean updateShipment(int i, String name, String phone, String ad, String cn, String em, String c, String b)
    {
	Shipping_Agency sa=new Shipping_Agency(name, i, ad, phone, cn, em, c, b);
	return persist.updateShipment(sa);
    }
    public boolean deleteShipment(int i)
    {
	return persist.deleteShipment(i);
    }
    public boolean createSupplier(int i, String name, String phone, String ad, String cn, String em, String c, String b)
    {
	Supplier s=new Supplier(name, i, ad, phone, cn, em, c, b);
	return persist.createSupplier(s);
    }
    public boolean updateSupplier(int i, String name, String phone, String ad, String cn, String em, String c, String b)
    {
	Supplier s = new Supplier(name, i, ad, phone, cn, em, c, b);
	return persist.updateSupplier(s);
    }
    public boolean deleteSupplier(int i)
    {
	return persist.deleteSupplier(i);
    }
   public Orders retrieveOrder(int transnum)
    {
	return persist.retrieveOrder(transnum);
    }

    public boolean retrieveUserbyid(User user)
    {
        System.out.println(user.getUserId());
        return persist.retrieveUserbyid(user);

    }
}
