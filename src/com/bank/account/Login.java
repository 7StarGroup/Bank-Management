package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;



@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
       
    }

	Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		try {
			con = Connect.connectDb();
			if(con==null)
			{
				System.out.println("Not Connected in Login .Java");
			}
			else
			{
				System.out.println("Connected");
		
			}
			
			String name=request.getParameter("username");
			String password=request.getParameter("password");
		
			
			

			
		PreparedStatement stmt = con.prepareStatement("select user_name,password from user where user_name=? and password=?");	
			
	
			stmt.setString(1,name);
			stmt.setString(2,password);
			
			
			
			ResultSet rs = stmt.executeQuery();
			
			
			
			
	
			
			
			if(rs.next())
			{
					out.println("<script>");
					out.println("alert('Success')");
					out.println("</script>");
					
					request.getRequestDispatcher("HomeScreen.jsp").forward(request, response); 
			}
			else
			{
				out.println("<script>");
				out.println("alert('Oops login failed please try again with correct credentials')");
				out.println("window.location.replace('login.jsp')");
				out.println("</script>");
				
			}
			
					
		}catch(Exception e)
		{
			System.out.println("Error"+e);
		}
		
	}
}


