package com.unrealbooks.controller;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


public class Util
{
	private static final String dictionary = "abcdefghijklmnopqrstuvwxyz" + 
					"ABCDEFGHIJKLMNOPQRSTUVWXYZ" + 
					"1234567890" + 
					"!@#$%^&*";
	private static Random generator = new Random();

	public static String generateRandomString(int length)
	{
		int index = 0;
		String result = "";
		for(int i = 0 ; i < length; i++)
		{
			index = generator.nextInt(dictionary.length());
			result += dictionary.charAt(index);
		}

		return result;
	}

	public static void email(String reciever, String subject, String messageText)
	{
		//Mail session and properties
		final String fromEmail = "unrealbookstore@gmail.com";
		final String fromPassword = "unrealbookspassword";
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

		//Email
		try
		{
			Message message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
			message.setSubject(subject);
			message.setText(messageText);
			Transport.send(message, fromEmail, fromPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

