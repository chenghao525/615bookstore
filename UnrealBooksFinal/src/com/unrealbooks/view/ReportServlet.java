package com.unrealbooks.view;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import com.unrealbooks.model.*;
import com.unrealbooks.database.*;

@WebServlet("/report")
public class ReportServlet extends BaseServlet
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
			int revenue = 0;
			revenue = controller.retrieveRevenue();
			map.put("revenue", revenue);

			ArrayList<Item> bookList = null;
			bookList = controller.inventoryNotice();
			map.put("bookList", bookList);

			String input = request.getParameter("input");

			int bookSales = 0;
			int pubSales = 0;
			String bookOrPub = "book";

			if (input.length()==10) {

			bookSales = controller.bookSales(input);
			map.put("sales", bookSales);
			}
			else {

			pubSales = controller.pubSales(input);
			map.put("sales", pubSales);
			}

			map.put("input", input);


			Template template = cfg.getTemplate("report.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
