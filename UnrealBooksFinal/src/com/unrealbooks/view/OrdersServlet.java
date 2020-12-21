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

@WebServlet("/orders")
public class OrdersServlet extends BaseServlet
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

			HashMap lists = controller.retrieveOrders(user);
			ArrayList<Orders> ordersList = (ArrayList<Orders>) lists.get("ordersList");
			ArrayList<ArrayList<Item>> bookList = 
				(ArrayList<ArrayList<Item>>)lists.get("bookList");
			ArrayList<Integer> qtyList = (ArrayList<Integer>) lists.get("qtyList");
			map.put("ordersList", ordersList);
			map.put("bookList", bookList);
			map.put("qtyList", qtyList);

			Template template = cfg.getTemplate("orders.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}

