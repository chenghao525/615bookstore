package com.unrealbooks.view;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import java.util.*;

@WebServlet("/confirm")
public class ConfirmServlet extends BaseServlet
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
			synchronized(session){}
			map.put("user", session.getAttribute("user"));
			
			Template template = cfg.getTemplate("confirm.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

