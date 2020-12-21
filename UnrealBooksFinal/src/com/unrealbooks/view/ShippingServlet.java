package com.unrealbooks.view;

import java.io.*;
import java.sql.*;
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
import com.unrealbooks.database.*;
@WebServlet("/shipping")
public class ShippingServlet extends BaseServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	final String fromEmail = "onlineshoppingnetworkserver@gmail.com";
	final String fromPassword = "onlineshopping123";
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "587");

	Session mailSession = Session.getInstance(props, new javax.mail.Authenticator()
						  {
						      protected PasswordAuthentication getPassswordAuthentication()
						      {
							  return new PasswordAuthentication("unrealbookstore", fromPassword);
						      }
						  });


	try
	    {

		PrintWriter out=response.getWriter();
		response.setContentType("text/html");

		HttpSession session = request.getSession();
		synchronized(session){}
		map.put("user", session.getAttribute("user"));
		String ordernum=request.getParameter("ordernum");
		String change = request.getParameter("change");
		String trackingnum= request.getParameter("trackingnum");
		String shippingagency=request.getParameter("shippingagency");
		System.out.println(ordernum+" "+change+" "+trackingnum+" "+shippingagency);

		Shipping_Info.Status s=Shipping_Info.Status.DELIVERED;
		if(change!=null&&!change.equals("")){
		    switch(change)
			{
			case "Shipped":
			    s=Shipping_Info.Status.SHIPPED;
			    break;
			case "Processing":
			    s=Shipping_Info.Status.PROCESSING;
			    break;
			}
		    if(change.equals("Shipped"))
			{
			    controller.updateShipping(trackingnum, s, ordernum, Integer.parseInt(shippingagency));
			}
		    else
			controller.updateShipping("0", s, ordernum, 0);
		    Orders order = controller.retrieveOrder(Integer.parseInt(ordernum));
		    User user=new User();
		    user.setUserId(order.getUserid());
		    controller.retrieveUserbyid(user);
		    System.out.println(user.getUserId());
		    System.out.println(user.getEmail());
		    System.out.println(user.getUserId());
		    Message message = new MimeMessage(mailSession);
		    message.setFrom(new InternetAddress(fromEmail));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
		    message.setSubject("Your Order from Online Shopping Network has SHIPPED!");
		    message.setText("Hello valued customer!\n\n\tThank you for purchasing from Online Shopping Network! " +
                                                        "Your order with the order number: " + ordernum+ " has shipped!"+
                                                        "Please go to localhost::8080//OnlineShoppingNetwork and log in to see more details about your order! " +
                                                        "The tracking number for your order is "+ trackingnum +".\n\n" +
				                        "Thank you once again for shopping at Online Shopping Network!" +
                                                        "\n\nBest,\n" +
				    "Online Shopping Network Team");
		    Transport.send(message, fromEmail, fromPassword);

		}



		Template template=cfg.getTemplate("shipping.ftl");
		template.process(map,out);
		//String tracking = Util.generateRandomString(16);
	    }
	catch(Exception e)
	    {
		e.printStackTrace();
	    }

    }
}
