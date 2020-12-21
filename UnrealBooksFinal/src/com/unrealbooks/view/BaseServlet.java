package com.unrealbooks.view;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import java.util.*;
import com.unrealbooks.controller.*;

public abstract class BaseServlet extends HttpServlet
{
	Configuration cfg;
	HashMap map;
	BookstoreController controller;

	public void init() throws ServletException
	{
		cfg = new Configuration(Configuration.VERSION_2_3_25);
		cfg.setServletContextForTemplateLoading(getServletContext(),
			"/WEB-INF/templates");
		map = new HashMap<>();
		controller = new BookstoreController();
	}
	
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) 
		throws ServletException, IOException
	{
		doGet(request, response);
	}
}
