package com.bank.account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		
		
		//db connectivity
		Connection con = null;
		ResultSet rs;
		
		try
		{
			
			System.out.println("Screen called");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
			if(con==null)
			{
				System.out.println("Database Not Connected");
			}
			else
			{
				System.out.println("DB Connected");
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		

		
		try
		{
		PreparedStatement ps;
		ps=con.prepareStatement("select * from user where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		
		rs=ps.executeQuery();
		if(rs.next())
		{
			
				pw.println("<script type='text/javascript'>");
				pw.println("location='HomeScreen.jsp';");
				pw.print("</script>");
		}
		}
		catch(Exception e)
	{
		System.out.println(e);
	}
}
}