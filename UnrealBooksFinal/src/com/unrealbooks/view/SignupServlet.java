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

@WebServlet("/signup")
public class SignupServlet extends BaseServlet
{
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException
	{
		//Mail session and properties
		final String fromEmail = "615bookstore@gmail.com";
		final String fromPassword = "Bookstore615$";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session mailSession = Session.getInstance(props,
			new javax.mail.Authenticator()
			{
				protected PasswordAuthentication getPassswordAuthentication()
				{
					return new PasswordAuthentication("615bookstore", fromPassword);
				}
			});
		try
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			map.put("error", false);

			String name = request.getParameter("name");
			System.out.println(name);
			String email = request.getParameter("email");
			System.out.println(email);
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String card = request.getParameter("card");
			String date = request.getParameter("date");
			String billingAddress = request.getParameter("billingAddress");
			String cvv = request.getParameter("cvv");
			String promo = request.getParameter("promo");
			String verificationCode = Util.generateRandomString(16);
			User user = null;

			if(name != null &&
				!name.equals("") &&
				email != null &&
				!email.equals("") &&
				password != null &&
				!password.equals("") &&
				address != null &&
				!address.equals(""))
			{
				//Hash password
				MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
				messageDigest.update(password.getBytes());
				password = DatatypeConverter.printHexBinary(messageDigest.digest());

				User.Subscribed subscribed = null;

				if(promo != null)
				{
					subscribed = User.Subscribed.YES;
				}
				else
				{
					subscribed = User.Subscribed.NO;
				}

				if(!phone.equals(""))
				{
					user = controller.createUser(0, User.Type.CUSTOMER, name,
								password, Integer.parseInt(phone),
								address, User.Status.WAITING, email,
								verificationCode, subscribed);
				}
				else
				{
					user = controller.createUser(0, User.Type.CUSTOMER, name,
								password, -1,
								address, User.Status.WAITING, email,
								verificationCode, subscribed);

				}

				if(card != null && date != null &&
					billingAddress != null && cvv != null &&
					!card.equals("") && !billingAddress.equals("") &&
					!cvv.equals(""))
				{
					controller.createPayment(user, card, billingAddress,
								date, Integer.parseInt(cvv));
				}

				if(user != null)
				{
					//Email
					Message message = new MimeMessage(mailSession);
					message.setFrom(new InternetAddress(fromEmail));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
					message.setSubject("Welcome to Online Shopping Network!");
					message.setText("Thank you for registering an account with UnrealBooks! " +
							"Please confirm your account information by visiting " +
							"localhost::8080/OnlineShoppingNetwork/activate and enter the " +
							"following verification code.\n\n" +
							"Verification Code: " + verificationCode +
							"\n\nBest,\n" +
							"Online Shopping Network Team");
					Transport.send(message, fromEmail, fromPassword);

					//Redirection
					HttpSession session = request.getSession();
					synchronized(session){}
					session.setAttribute("user", user);
					response.sendRedirect("/OnlineShoppingNetwork/confirm");
				}
				else
				{
					map.put("error", true);
				}
			}

			Template template = cfg.getTemplate("signup.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
