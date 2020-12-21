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

@WebServlet("/cart")
public class CartServlet extends BaseServlet
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
			map.put("user", session.getAttribute("user"));

			String qtyUpdate = request.getParameter("qtyUpdate");
			String isbn = request.getParameter("isbn");
			String deleteISBN = request.getParameter("deleteISBN");
			if(qtyUpdate != null)
			{
				controller.updateCartItem(user, isbn, Integer.parseInt(qtyUpdate));
			}

			if(deleteISBN != null)
			{
				controller.deleteCartItem(user, deleteISBN);
			}

			HashMap result = controller.displayCart(user);
			Shopping_Cart cart = (Shopping_Cart)result.get("cart");
			ArrayList<Item> bookList = (ArrayList<Item>)result.get("bookList");
			ArrayList<Integer> qtyList = (ArrayList<Integer>)result.get("qtyList");

			map.put("cart", cart);
			if(bookList.size() > 0)
			{
				map.put("bookList", bookList);
			}
			else
			{
				map.put("bookList", null);
			}
			map.put("qtyList", qtyList);

			Template template = cfg.getTemplate("shoppingcart.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

