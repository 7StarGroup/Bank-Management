package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.db.Connect;


@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("username");
		String email=request.getParameter("emailid");
		boolean b=validate(name,email);
		
		if(b== true)
		{
			
			request.setAttribute("username", name);
			request.getRequestDispatcher("NewPassword.jsp").forward(request, response); 
		}
		
		else
		{
			out.println("<script>");
			out.println("alert('Invalid Username or Email Id');window.location = 'http://localhost:8080/BankMgmt/forgotPassword.html';");
			out.println("</script>");
		}
	}
	
	
	
	public boolean validate(String username ,String Email)
	{
		
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
			
			
		
			
			

			
		PreparedStatement stmt = con.prepareStatement("select user_name from user where user_name=? and email=?");	
			
	
			stmt.setString(1,username);
			stmt.setString(2,Email);
			
			
			
			ResultSet rs = stmt.executeQuery();
			
			
			
			
	
			
			
			if(rs.next())
			{
				return true;
			}
			else
			{
				return false;
				
			}
			
		
	}
		catch(Exception e) {}
		
		return false;
	}

}
