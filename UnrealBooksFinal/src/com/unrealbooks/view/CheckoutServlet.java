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

@WebServlet("/checkout")
public class CheckoutServlet extends BaseServlet
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

			//Payment Information
			String card = request.getParameter("card");
			String date = request.getParameter("date");
			String billingAddress = request.getParameter("billingAddress");
			String cvv = request.getParameter("cvv");

			if(card != null && date != null &&
					billingAddress != null && cvv != null)
			{
				controller.createPayment(user, card, billingAddress,
							date, Integer.parseInt(cvv));
			}

			Payment payment = controller.retrievePayment(user);
			map.put("payment", payment);
			if(payment != null)
			{
				map.put("card_num", payment.getCard_num().substring(
							payment.getCard_num().length() - 4));
				session.setAttribute("payment", payment);
			}
			else
			{
				map.put("card_num", null);
			}


			//Cart Contents
			HashMap result = controller.displayCart(user);
			Shopping_Cart cart = (Shopping_Cart)result.get("cart");
			ArrayList<Item> bookList = (ArrayList<Item>)result.get("bookList");
			ArrayList<Integer> qtyList = (ArrayList<Integer>)result.get("qtyList");

			map.put("cart", cart);
			if(bookList.size() > 0)
			{
				map.put("bookList", bookList);
				session.setAttribute("cart", cart);
				session.setAttribute("bookList", bookList);
				session.setAttribute("qtyList", qtyList);
			}
			else
			{
				map.put("bookList", null);
			}
			map.put("qtyList", qtyList);

			Item book;
			boolean keepSearching = true;
			map.put("invalidBook", null);
			for(int i = 0; i < bookList.size() && keepSearching; i++)
			{
				book = (Item) bookList.get(i);
				if(book.getInventory_amt() < (int)qtyList.get(i))
				{
					map.put("invalidBook", book.getName());
					keepSearching = false;
				}
			}

			//Final Price
			String promoCode = request.getParameter("promo");
			map.put("error", false);
			if(promoCode != null)
			{
				Promotion promotion = controller.retrievePromotion(promoCode);
				if(promotion != null)
				{
					int finalPrice = (int)cart.getPrice() - promotion.getValue();
					if(finalPrice < 0)
					{
						finalPrice = 0;
					}
					map.put("finalPrice", finalPrice);
					session.setAttribute("promotion", promotion);
					session.setAttribute("finalPrice", finalPrice);
				}
				else
				{
					map.put("error", true);
					map.put("finalPrice", null);
				}
			}
			else
			{
				map.put("finalPrice", null);
			}

			Template template = cfg.getTemplate("checkout.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
