package com.unrealbooks.view;

import java.io.*;
import java.security.MessageDigest;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.bind.DatatypeConverter;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import com.unrealbooks.model.*;
import com.unrealbooks.model.User.Subscribed;

import java.util.Map;
import java.util.HashMap;

@WebServlet("/profile")
public class ProfileServlet extends BaseServlet
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
			
			/*
				session = request.getSession();
				synchronized(session){}
				session.setAttribute("user", user);
				response.sendRedirect("/UnrealBooks/home");
			*/
			
			//input.put("user", user); //ERROR LINE
			
			
			String name = request.getParameter("name");
			
			String email = user.getEmail();
			String address = user.getAddress();
			Subscribed subscribed = user.getSubscribed();
			String password = user.getPassword();
			
			/*
			if((request.getParameter("nPass")!=null) && (request.getParameter("nPass")!="")) {
			password = request.getParameter("nPass");
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(password.getBytes());
			password = DatatypeConverter.printHexBinary(messageDigest.digest());
			}
			*/
			
			/*
			controller.updateUser(user, email, name, address, password);
			*/
			
			/*
			session = request.getSession();
			synchronized(session){}
			session.setAttribute("user", user);
			response.sendRedirect("/UnrealBooks/home");
			*/
			
			Template template = cfg.getTemplate("profile.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
