package com.unrealbooks.view;

import java.io.*;
import javax.servlet.*;
import java.security.*;
import javax.xml.bind.DatatypeConverter;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import java.util.*;
import com.unrealbooks.controller.*;

@WebServlet("/forgot")
public class ForgotServlet extends BaseServlet
{
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException
	{
		//Mail session and properties
		final String fromEmail = "onlineshoppingnetworkServer@gmail.com";
		final String fromPassword = "onlineshopping123";
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
					return new PasswordAuthentication("unrealbookstore", fromPassword);
				}
			});
		try
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			map.put("error", false);
			map.put("success", false);

			String email = request.getParameter("email");
			if(email != null)
			{
				if(controller.verifyEmail(email))
				{
					map.put("success", true);

					//Password Hash
					String password = Util.generateRandomString(8);
					MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
					messageDigest.update(password.getBytes());
					String hashedPassword =
						DatatypeConverter.printHexBinary(messageDigest.digest());

					//Reset Password
					controller.resetPassword(email, hashedPassword);

					//Send Email
					Message message = new MimeMessage(mailSession);
					message.setFrom(new InternetAddress(fromEmail));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
					message.setSubject("Online Shopping Network Reset Password");
					message.setText("Your Online Shopping Network password has recently been reset " +
							"to the following temporary password.\n\n" +
							"Password: " + password +
							"\n\n Please login with the new password at " +
							"localhost::8080/OnlineShoppingNetwork/login and update " +
							"your password." +
							"\n\nBest,\n" +
							"Online Shopping Network Team");
					Transport.send(message, fromEmail, fromPassword);
				}
				else
				{
					map.put("error", true);
				}
			}

			Template template = cfg.getTemplate("forgot.ftl");
			template.process(map, out);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
