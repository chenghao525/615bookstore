package com.unrealbooks.view;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import com.unrealbooks.model.*;

@WebServlet("/login")
public class LoginServlet extends BaseServlet
{
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException
	{
		try
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			map.put("error", false);
			map.put("waiting", false);
			map.put("suspended", false);

			String email = request.getParameter("email");
			String password = request.getParameter("password");
			if(email != null &&
				!email.equals("") &&
				password != null &&
				!password.equals(""))
			{
				User user = controller.verifyUser(email, password);
				if(user != null)
				{
					if(user.getStatus() == User.Status.ACTIVE)
					{
						HttpSession session = request.getSession();
						synchronized(session){}
						session.setAttribute("user", user);
						if(user.getType()==User.Type.ADMIN)
						{
						    response.sendRedirect("/OnlineShoppingNetwork/admin");

						}
//						else if(user.getType() == User.Type.SHIPPING)
//						{
//							response.sendRedirect("/OnlineShoppingNetwork/shipping");
//						}
						else
						{
							response.sendRedirect("/OnlineShoppingNetwork/home");
						}
					}
					else if(user.getStatus() == User.Status.WAITING)
					{
						map.put("waiting", true);
					}
					else //Suspended
					{
						map.put("suspended", true);
					}
				}
				else //relaod page with error message
				{
					map.put("error", true);
				}
			}

			Template template = cfg.getTemplate("login.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
