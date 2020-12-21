package com.unrealbooks.view;

import java.io.*;
import java.util.*;
import java.security.*;
import javax.servlet.*;
import javax.xml.bind.DatatypeConverter;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.unrealbooks.controller.*;
import com.unrealbooks.model.*;

@WebServlet("/orderconfirm")
public class OrderConfirmServlet extends BaseServlet
{
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException
	{
		try
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			map.put("user", user);

			ArrayList<Item> bookList = (ArrayList<Item>) session.getAttribute("bookList");
			ArrayList<Integer> qtyList = (ArrayList<Integer>) session.getAttribute("qtyList");
			Shopping_Cart cart = (Shopping_Cart) session.getAttribute("cart");
			Promotion promotion = (Promotion) session.getAttribute("promotion");

			//Create Order
			Orders order;
			if(session.getAttribute("finalPrice") != null)
			{
				int finalPrice = (int) session.getAttribute("finalPrice");
				order = controller.createOrder(user, finalPrice);
			}
			else
			{
				order = controller.createOrder(user, (int) cart.getPrice());

			}

			if(order != null)
			{
				map.put("orderNumber", order.getTransaction_number());
			}

			//Order Details
			controller.createOrderDetails(order, cart);

			//Email
			String message = "Thank you for shopping with Online Shopping Network. Please review the " +
					"order details below.\n\n" +
					"Customer Name: " + user.getName() + "\n" +
					"Order Number: " + order.getTransaction_number() + "\n" +
					"Order Date: " + order.getOrder_date() + "\n" +
					"Order Price: $" + order.getFinalPrice(); //DONT FORGET ITEMS
			if(promotion != null)
			{
				message += "\nPromotion Code: " + promotion.getPromotion_code();
			}

			message += "\n\nOrder Items:\n";

			Item book;
			int qty;
			for(int i = 0; i < bookList.size(); i++)
			{
				book = (Item) bookList.get(i);
				message += "" + book.getName() + " ";
				message += "(qty: " + (Integer)qtyList.get(i) + ")\n";

				//update book quantities
				qty = book.getInventory_amt() - (Integer)qtyList.get(i);
				book.setInventory_amt(qty);
				controller.updateBookQty(book);
			}

			message += "\n\nBest,\nOnline Shopping Network Team";

			Util.email(user.getEmail(), "Order Confirmation", message);

			Template template = cfg.getTemplate("orderconfirm.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
