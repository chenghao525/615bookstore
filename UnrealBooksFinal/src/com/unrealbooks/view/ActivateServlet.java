package com.unrealbooks.view;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import com.unrealbooks.model.*;

@WebServlet("/activate")
public class ActivateServlet extends BaseServlet
{
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException
	{
		try
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			map.put("incorrectCode", false);
			map.put("invalidUser", false);
			map.put("success", false);
				
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String verification = request.getParameter("verification");

			if(email != null &&
				password != null &&
				verification != null)
			{
				User user = controller.verifyUser(email, password);

				if(user != null)
				{	
					if(verification.equals(user.getVerificationCode()))
					{
						controller.activateUser(user);
						map.put("success", true);
					}
					else //Incorrect Verification Code
					{
						map.put("incorrectCode", true);
					}
				}
				else //Wrong user
				{
					map.put("invalidUser", true);
				}
			}
			
			Template template = cfg.getTemplate("activate.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
