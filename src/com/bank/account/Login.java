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
import javax.servlet.http.HttpSession;

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
		PreparedStatement ps,ps1;
		ps=con.prepareStatement("select * from user where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		rs=ps.executeQuery();
	
		if(rs.next())
		{
			ps1=con.prepareStatement("select * from user,user_account where user.user_id=user_account.user_id_fk and user_id=?");;
			ps1.setLong(1, rs.getLong(1));
			ResultSet rs1 = ps1.executeQuery();
				HttpSession session=request.getSession();
				if(rs1.next())
				session.setAttribute("userId", rs1.getInt(14));
				session.setAttribute("Address", rs1.getInt(5));
				session.setAttribute("Mobile", rs1.getInt(6));
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