package com.bank.db;
import java.sql.*;

import javax.swing.JOptionPane;
public class Connect {

	Connection con=null;
	
	public static Connection connectDb()
	{
		try{  

			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Akshay@1997");

			

			if(con==null)
			{
				System.out.println("Not Connedted");
			}
			else
			{
				System.out.println("Connected");
			}
			return con;
			}
			catch(Exception e)
			{
				//JOptionPane.showMessageDialog(null,e);
				e.printStackTrace();
				return null;
			}
		  
	}
	public static void main(String args[])
	{
		Connect c=new Connect();
		c.connectDb();
	}
}
