package com.unrealbooks.view;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import com.unrealbooks.model.*;

@WebServlet("/home")
public class HomeServlet extends BaseServlet
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

			Template template = null;
			switch(user.getType())
			{
				case CUSTOMER:
					template = cfg.getTemplate("customer.ftl");
					break;
				case ADMIN:
					template = cfg.getTemplate("admin.ftl");
					break;
				case BUSINESS:
					template = cfg.getTemplate("manager.ftl");
					break;
				case SHIPPING:
					template = cfg.getTemplate("shipping.ftl");
					break;
			}

			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
