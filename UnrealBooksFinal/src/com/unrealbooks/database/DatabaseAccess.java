package com.unrealbooks.database;

import java.sql.*;

public class DatabaseAccess
{
	private static Connection con = null;
	private static String user = "root";
	private static String pass = "14131341";

	private static void connect()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/OnlineShoppingNetwork?useSSL=false",
				user, pass);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static Connection getConnection()
	{
		if(con == null)
		{
			connect();
		}

		return con;
	}

	public static ResultSet retrieve(PreparedStatement ps)
	{
		ResultSet result = null;
		try
		{
			result = ps.executeQuery();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}

	public static int update(PreparedStatement ps)
	{
		int rows = 0;

		try
		{
			rows = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return rows;
	}
}
