
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

@WebServlet("/search")
public class SearchServlet extends BaseServlet
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

			ArrayList<Item> bookList = null;
			map.put("bookList", bookList);
			map.put("user", user);
			map.put("success", false);

			String input = request.getParameter("input");
			String isbn = request.getParameter("isbn");
			if(input != null)
			{
				map.put("input", input);
				bookList = controller.search(input);
				map.put("bookList", bookList);
				if(isbn != null)
				{
					controller.addToCart(user, isbn);
					map.put("success", true);
				}
			}
			else
			{
				input = "";
				map.put("input", input);
			}

			Template template = cfg.getTemplate("search.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

